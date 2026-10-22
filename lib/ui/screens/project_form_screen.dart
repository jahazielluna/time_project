import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';
import '../../theme/app_theme.dart';

class ProjectFormScreen extends ConsumerStatefulWidget {
  const ProjectFormScreen({super.key, this.projectId});

  final int? projectId;

  @override
  ConsumerState<ProjectFormScreen> createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends ConsumerState<ProjectFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _rateCtrl = TextEditingController();
  final _limitCtrl = TextEditingController();
  bool _loading = false;
  bool _loaded = false;

  bool get _isEdit => widget.projectId != null;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _rateCtrl.dispose();
    _limitCtrl.dispose();
    super.dispose();
  }

  void _hydrateFromProject() {
    if (_loaded || !_isEdit) {
      _loaded = true;
      return;
    }
    final async = ref.read(projectProvider(widget.projectId!));
    async.whenData((p) {
      if (p == null || !mounted || _loaded) return;
      setState(() {
        _nameCtrl.text = p.name;
        _rateCtrl.text = p.hourlyRate.toStringAsFixed(2);
        if (p.monthlyHourLimit != null) {
          _limitCtrl.text = p.monthlyHourLimit!.toStringAsFixed(0);
        }
        _loaded = true;
      });
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final actions = ref.read(appActionsProvider);
    final name = _nameCtrl.text.trim();
    final rate = double.parse(_rateCtrl.text.replaceAll(',', '.'));
    final limitText = _limitCtrl.text.trim();
    final limit = limitText.isEmpty
        ? null
        : double.tryParse(limitText.replaceAll(',', '.'));

    try {
      if (_isEdit) {
        final existing =
            await ref.read(databaseProvider).getProject(widget.projectId!);
        if (existing == null) return;
        await actions.saveProject(
          existing.copyWith(
            name: name,
            hourlyRate: rate,
            monthlyHourLimit: Value(limit),
          ),
        );
        if (mounted) context.pop();
      } else {
        final id = await actions.createProject(
          name: name,
          hourlyRate: rate,
          monthlyHourLimit: limit,
        );
        if (mounted) context.go('/proyectos/$id');
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _archive() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Archivar proyecto'),
        content: const Text(
          'El proyecto dejará de aparecer en la lista. Las entradas se conservan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(c, true),
            child: const Text('Archivar'),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await ref.read(appActionsProvider).archiveProject(widget.projectId!);
    if (mounted) context.go('/proyectos');
  }

  @override
  Widget build(BuildContext context) {
    if (_isEdit) {
      ref.listen(projectProvider(widget.projectId!), (_, __) {
        _hydrateFromProject();
      });
      _hydrateFromProject();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Editar proyecto' : 'Nuevo proyecto'),
        actions: [
          if (_isEdit)
            IconButton(
              tooltip: 'Archivar',
              onPressed: _archive,
              icon: const Icon(Icons.archive_outlined),
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre del proyecto',
              ),
              textCapitalization: TextCapitalization.sentences,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Requerido' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _rateCtrl,
              decoration: const InputDecoration(
                labelText: 'Tarifa horaria (MXN)',
                prefixText: '\$ ',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Requerido';
                final n = double.tryParse(v.replaceAll(',', '.'));
                if (n == null || n < 0) return 'Tarifa inválida';
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _limitCtrl,
              decoration: const InputDecoration(
                labelText: 'Límite mensual de horas (opcional)',
                hintText: 'Ej. 80',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Moneda: MXN (fija en esta versión)',
              style: TextStyle(color: AppColors.muted, fontSize: 13),
            ),
            const SizedBox(height: 28),
            FilledButton(
              onPressed: _loading ? null : _save,
              child: Text(_loading ? 'Guardando…' : 'Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
