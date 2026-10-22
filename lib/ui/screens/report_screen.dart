import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../../providers/providers.dart';
import '../../theme/app_theme.dart';
import '../../utils/format.dart';

class ReportScreen extends ConsumerStatefulWidget {
  const ReportScreen({super.key, required this.projectId});

  final int projectId;

  @override
  ConsumerState<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<ReportScreen> {
  late DateTime _start;
  late DateTime _end;
  List<TimeEntry> _entries = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _start = startOfMonth(now);
    _end = endOfMonth(now);
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final rows = await ref.read(databaseProvider).entriesInRange(
            widget.projectId,
            _start,
            _end,
          );
      if (mounted) {
        setState(() {
          _entries = rows;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = '$e';
          _loading = false;
        });
      }
    }
  }

  Future<void> _pickRange() async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: DateTimeRange(start: _start, end: _end),
      locale: const Locale('es'),
    );
    if (range != null) {
      setState(() {
        _start = range.start;
        _end = range.end;
      });
      await _load();
    }
  }

  Map<String, int> get _byConcept {
    final map = <String, int>{};
    for (final e in _entries) {
      map[e.concept] = (map[e.concept] ?? 0) + e.durationMinutes;
    }
    final entries = map.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return Map.fromEntries(entries);
  }

  @override
  Widget build(BuildContext context) {
    final projectAsync = ref.watch(projectProvider(widget.projectId));

    return projectAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(body: Center(child: Text('$e'))),
      data: (project) {
        if (project == null) {
          return const Scaffold(
            body: Center(child: Text('Proyecto no encontrado')),
          );
        }
        final totalMin =
            _entries.fold<int>(0, (s, e) => s + e.durationMinutes);
        final totalAmount =
            amountFromMinutes(totalMin, project.hourlyRate);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Reporte'),
            actions: [
              IconButton(
                tooltip: 'Exportar PDF',
                onPressed: _entries.isEmpty
                    ? null
                    : () => ref.read(exportServiceProvider).sharePdf(
                          project: project,
                          start: _start,
                          end: _end,
                          entries: _entries,
                        ),
                icon: const Icon(Icons.picture_as_pdf_outlined),
              ),
              IconButton(
                tooltip: 'Exportar CSV',
                onPressed: _entries.isEmpty
                    ? null
                    : () => ref.read(exportServiceProvider).shareCsv(
                          project: project,
                          start: _start,
                          end: _end,
                          entries: _entries,
                        ),
                icon: const Icon(Icons.table_chart_outlined),
              ),
            ],
          ),
          body: _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(child: Text(_error!))
                  : ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        Text(
                          project.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 4),
                        TextButton.icon(
                          onPressed: _pickRange,
                          icon: const Icon(Icons.date_range, size: 18),
                          label: Text(
                            '${formatDateShort(_start)} — ${formatDateShort(_end)}',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _Kpi(
                                label: 'Horas',
                                value: formatHours(totalMin),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _Kpi(
                                label: 'Total MXN',
                                value: formatMxn(totalAmount),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'Desglose por concepto',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        if (_byConcept.isEmpty)
                          const Text(
                            'Sin entradas en este periodo.',
                            style: TextStyle(color: AppColors.muted),
                          )
                        else
                          ..._byConcept.entries.map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      e.key,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    formatHours(e.value),
                                    style: const TextStyle(
                                      color: AppColors.slate,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      formatMxn(
                                        amountFromMinutes(
                                          e.value,
                                          project.hourlyRate,
                                        ),
                                      ),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.tealDeep,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 24),
                        Text(
                          'Detalle',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        ..._entries.map(
                          (e) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            title: Text(e.concept),
                            subtitle: Text(formatDate(e.date)),
                            trailing: Text(formatHours(e.durationMinutes)),
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}

class _Kpi extends StatelessWidget {
  const _Kpi({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.surfaceAlt),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColors.muted, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.ink,
                ),
          ),
        ],
      ),
    );
  }
}
