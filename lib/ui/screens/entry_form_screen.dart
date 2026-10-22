import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';
import '../../theme/app_theme.dart';
import '../../utils/format.dart';

class EntryFormScreen extends ConsumerStatefulWidget {
  const EntryFormScreen({
    super.key,
    required this.projectId,
    this.entryId,
  });

  final int projectId;
  final int? entryId;

  @override
  ConsumerState<EntryFormScreen> createState() => _EntryFormScreenState();
}

class _EntryFormScreenState extends ConsumerState<EntryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _conceptCtrl = TextEditingController();
  final _durationCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  DateTime _date = DateTime.now();
  bool _useHours = false;
  bool _loading = false;
  bool _loaded = false;

  bool get _isEdit => widget.entryId != null;

  @override
  void dispose() {
    _conceptCtrl.dispose();
    _durationCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadEntry() async {
    if (!_isEdit || _loaded) return;
    final entry =
        await ref.read(databaseProvider).getEntry(widget.entryId!);
    if (entry == null || !mounted) return;
    setState(() {
      _conceptCtrl.text = entry.concept;
      _date = entry.date;
      _notesCtrl.text = entry.notes ?? '';
      if (entry.durationMinutes % 60 == 0) {
        _useHours = true;
        _durationCtrl.text = (entry.durationMinutes / 60).toStringAsFixed(0);
      } else {
        _useHours = false;
        _durationCtrl.text = entry.durationMinutes.toString();
      }
      _loaded = true;
    });
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('es'),
    );
    if (picked != null) setState(() => _date = picked);
  }

  int? _parseMinutes() {
    final raw = _durationCtrl.text.trim().replaceAll(',', '.');
    final n = double.tryParse(raw);
    if (n == null || n <= 0) return null;
    if (_useHours) return (n * 60).round();
    return n.round();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final minutes = _parseMinutes();
    if (minutes == null) return;
    setState(() => _loading = true);
    final actions = ref.read(appActionsProvider);
    try {
      if (_isEdit) {
        final existing =
            await ref.read(databaseProvider).getEntry(widget.entryId!);
        if (existing == null) return;
        await actions.saveEntry(
          existing.copyWith(
            date: dateOnly(_date),
            concept: _conceptCtrl.text.trim(),
            durationMinutes: minutes,
            notes: Value(_notesCtrl.text.trim().isEmpty
                ? null
                : _notesCtrl.text.trim()),
          ),
        );
      } else {
        await actions.addEntry(
          projectId: widget.projectId,
          date: _date,
          concept: _conceptCtrl.text.trim(),
          durationMinutes: minutes,
          notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
        );
      }
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isEdit) {
      _loadEntry();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Editar entrada' : 'Registrar horas'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Fecha'),
              subtitle: Text(formatDate(_date)),
              trailing: const Icon(Icons.calendar_today_outlined),
              onTap: _pickDate,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: AppColors.surfaceAlt),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _conceptCtrl,
              decoration: const InputDecoration(
                labelText: 'Concepto',
                hintText: 'Ej. Desarrollo feature X',
              ),
              textCapitalization: TextCapitalization.sentences,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Requerido' : null,
            ),
            const SizedBox(height: 16),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('Minutos')),
                ButtonSegment(value: true, label: Text('Horas')),
              ],
              selected: {_useHours},
              onSelectionChanged: (s) => setState(() => _useHours = s.first),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _durationCtrl,
              decoration: InputDecoration(
                labelText: _useHours ? 'Duración (horas)' : 'Duración (minutos)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Requerido';
                if (_parseMinutes() == null) return 'Duración inválida';
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesCtrl,
              decoration: const InputDecoration(
                labelText: 'Notas (opcional)',
              ),
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
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
