import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/tables.dart';
import '../../providers/providers.dart';
import '../../theme/app_theme.dart';
import '../../utils/format.dart';

class CutsScreen extends ConsumerStatefulWidget {
  const CutsScreen({super.key, this.projectId});

  /// Si es null, muestra todos los cortes (tab global).
  final int? projectId;

  @override
  ConsumerState<CutsScreen> createState() => _CutsScreenState();
}

class _CutsScreenState extends ConsumerState<CutsScreen> {
  String _periodLabel(PeriodType t) {
    switch (t) {
      case PeriodType.weekly:
        return 'Semanal';
      case PeriodType.biweekly:
        return 'Quincenal';
      case PeriodType.monthly:
        return 'Mensual';
      case PeriodType.custom:
        return 'Personalizado';
    }
  }

  Future<void> _generateCut(int projectId) async {
    final choice = await showModalBottomSheet<PeriodType>(
      context: context,
      showDragHandle: true,
      builder: (c) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text(
                'Generar corte',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                'El importe se congela con la tarifa actual',
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_view_week),
              title: const Text('Semanal (semana actual)'),
              onTap: () => Navigator.pop(c, PeriodType.weekly),
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('Quincenal'),
              onTap: () => Navigator.pop(c, PeriodType.biweekly),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Mensual'),
              onTap: () => Navigator.pop(c, PeriodType.monthly),
            ),
            ListTile(
              leading: const Icon(Icons.edit_calendar_outlined),
              title: const Text('Rango personalizado'),
              onTap: () => Navigator.pop(c, PeriodType.custom),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (choice == null || !mounted) return;

    final now = DateTime.now();
    DateTime start;
    DateTime end;

    switch (choice) {
      case PeriodType.weekly:
        start = startOfWeek(now);
        end = endOfWeek(now);
      case PeriodType.biweekly:
        final r = biweeklyRange(now);
        start = r.start;
        end = r.end;
      case PeriodType.monthly:
        start = startOfMonth(now);
        end = endOfMonth(now);
      case PeriodType.custom:
        final range = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2020),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          locale: const Locale('es'),
        );
        if (range == null) return;
        start = range.start;
        end = range.end;
    }

    await ref.read(appActionsProvider).createCut(
          projectId: projectId,
          periodType: choice,
          start: start,
          end: end,
        );
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Corte generado')),
      );
    }
  }

  Future<int?> _pickProject() async {
    final projects = await ref.read(projectsProvider.future);
    if (!mounted) return null;
    if (projects.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Crea un proyecto primero')),
      );
      return null;
    }
    return showDialog<int>(
      context: context,
      builder: (c) => SimpleDialog(
        title: const Text('Proyecto'),
        children: projects
            .map(
              (p) => SimpleDialogOption(
                onPressed: () => Navigator.pop(c, p.id),
                child: Text(p.name),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cutsAsync = widget.projectId != null
        ? ref.watch(cutsForProjectProvider(widget.projectId!))
        : ref.watch(allCutsProvider);
    final projectsAsync = ref.watch(projectsProvider);

    return Scaffold(
      appBar: widget.projectId != null
          ? AppBar(title: const Text('Cortes'))
          : null,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final pid = widget.projectId ?? await _pickProject();
          if (pid != null) await _generateCut(pid);
        },
        icon: const Icon(Icons.add),
        label: const Text('Generar corte'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.projectId == null)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cortes',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Periodos de cobro con importe congelado',
                    style: TextStyle(color: AppColors.muted),
                  ),
                ],
              ),
            ),
          Expanded(
            child: cutsAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('$e')),
              data: (cuts) {
                if (cuts.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: Text(
                        'Sin cortes todavía.\nGenera uno semanal, quincenal, mensual o custom.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.muted),
                      ),
                    ),
                  );
                }
                final projects = projectsAsync.valueOrNull ?? [];
                String nameFor(int id) {
                  try {
                    return projects.firstWhere((p) => p.id == id).name;
                  } catch (_) {
                    return 'Proyecto #$id';
                  }
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                  itemCount: cuts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final cut = cuts[i];
                    final paid = cut.status == CutStatus.paid;
                    return Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.projectId == null
                                        ? nameFor(cut.projectId)
                                        : _periodLabel(cut.periodType),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 280),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: paid
                                        ? AppColors.tealSoft
                                        : const Color(0xFFFEF3C7),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    paid ? 'Pagado' : 'Pendiente',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: paid
                                          ? AppColors.success
                                          : AppColors.warn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '${formatDateShort(cut.startDate)} — ${formatDateShort(cut.endDate)} · ${_periodLabel(cut.periodType)}',
                              style: const TextStyle(
                                color: AppColors.muted,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${formatHours(cut.totalMinutes)} · ${formatMxn(cut.totalAmount)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.tealDeep,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    ref.read(appActionsProvider).setCutStatus(
                                          cut,
                                          paid
                                              ? CutStatus.pending
                                              : CutStatus.paid,
                                        );
                                  },
                                  child: Text(
                                    paid
                                        ? 'Marcar pendiente'
                                        : 'Marcar pagado',
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  tooltip: 'Eliminar',
                                  onPressed: () async {
                                    final ok = await showDialog<bool>(
                                      context: context,
                                      builder: (c) => AlertDialog(
                                        title: const Text('Eliminar corte'),
                                        content: const Text(
                                          '¿Eliminar este corte? Las entradas no se borran.',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(c, false),
                                            child: const Text('Cancelar'),
                                          ),
                                          FilledButton(
                                            onPressed: () =>
                                                Navigator.pop(c, true),
                                            child: const Text('Eliminar'),
                                          ),
                                        ],
                                      ),
                                    );
                                    if (ok == true) {
                                      await ref
                                          .read(databaseProvider)
                                          .deleteCut(cut.id);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
