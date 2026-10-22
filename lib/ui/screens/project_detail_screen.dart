import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';
import '../../theme/app_theme.dart';
import '../../utils/format.dart';
import '../widgets/limit_progress.dart';

class ProjectDetailScreen extends ConsumerWidget {
  const ProjectDetailScreen({super.key, required this.projectId});

  final int projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = ref.watch(projectProvider(projectId));
    final entriesAsync = ref.watch(entriesProvider(projectId));
    final monthAsync = ref.watch(monthMinutesProvider(projectId));

    return projectAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(body: Center(child: Text('$e'))),
      data: (project) {
        if (project == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text('Proyecto no encontrado')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(project.name),
            actions: [
              IconButton(
                tooltip: 'Editar',
                onPressed: () => context.push('/proyectos/$projectId/editar'),
                icon: const Icon(Icons.edit_outlined),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.push('/proyectos/$projectId/entrada'),
            icon: const Icon(Icons.add),
            label: const Text('Registrar horas'),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${formatMxn(project.hourlyRate)} / h · MXN',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColors.tealDeep,
                            ),
                      ),
                      const SizedBox(height: 12),
                      monthAsync.when(
                        data: (m) {
                          final amount =
                              amountFromMinutes(m, project.hourlyRate);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Este mes: ${formatHours(m)} · ${formatMxn(amount)}',
                                style: const TextStyle(
                                  color: AppColors.slate,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (project.monthlyHourLimit != null) ...[
                                const SizedBox(height: 10),
                                LimitProgress(
                                  minutesUsed: m,
                                  limitHours: project.monthlyHourLimit!,
                                ),
                              ],
                            ],
                          );
                        },
                        loading: () => const LinearProgressIndicator(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () =>
                                  context.push('/proyectos/$projectId/reporte'),
                              icon: const Icon(Icons.bar_chart_outlined),
                              label: const Text('Reporte'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () =>
                                  context.push('/proyectos/$projectId/cortes'),
                              icon: const Icon(Icons.receipt_long_outlined),
                              label: const Text('Cortes'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Entradas',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
              entriesAsync.when(
                loading: () => const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
                error: (e, _) => SliverToBoxAdapter(child: Text('$e')),
                data: (entries) {
                  if (entries.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          'Aún no hay entradas. Registra tu primera hora.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.muted),
                        ),
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    sliver: SliverList.separated(
                      itemCount: entries.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, i) {
                        final e = entries[i];
                        return Dismissible(
                          key: ValueKey(e.id),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: AppColors.danger,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          confirmDismiss: (_) async {
                            return await showDialog<bool>(
                                  context: context,
                                  builder: (c) => AlertDialog(
                                    title: const Text('Eliminar entrada'),
                                    content: Text(
                                      '¿Borrar «${e.concept}» (${formatHours(e.durationMinutes)})?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(c, false),
                                        child: const Text('Cancelar'),
                                      ),
                                      FilledButton(
                                        onPressed: () => Navigator.pop(c, true),
                                        child: const Text('Eliminar'),
                                      ),
                                    ],
                                  ),
                                ) ??
                                false;
                          },
                          onDismissed: (_) {
                            ref.read(appActionsProvider).removeEntry(e);
                          },
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              title: Text(e.concept),
                              subtitle: Text(formatDate(e.date)),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    formatHours(e.durationMinutes),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                  Text(
                                    formatMxn(
                                      amountFromMinutes(
                                        e.durationMinutes,
                                        project.hourlyRate,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.muted,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () => context.push(
                                '/proyectos/$projectId/entrada/${e.id}',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
