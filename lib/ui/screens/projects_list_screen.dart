import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';
import '../../theme/app_theme.dart';
import '../../utils/format.dart';
import '../widgets/limit_progress.dart';

class ProjectsListScreen extends ConsumerWidget {
  const ProjectsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectsProvider);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 36,
                        color: AppColors.tealDeep,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Horas freelance · MXN',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.muted,
                      ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => context.push('/proyectos/nuevo'),
                    icon: const Icon(Icons.add),
                    label: const Text('Nuevo proyecto'),
                  ),
                ),
              ],
            ),
          ),
        ),
        projectsAsync.when(
          loading: () => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => SliverFillRemaining(
            child: Center(child: Text('Error: $e')),
          ),
          data: (projects) {
            if (projects.isEmpty) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.work_outline,
                          size: 56, color: AppColors.muted.withOpacity(0.6)),
                      const SizedBox(height: 16),
                      Text(
                        'Sin proyectos aún',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Crea tu primer proyecto para registrar horas y generar cortes.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              sliver: SliverList.separated(
                itemCount: projects.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  final p = projects[i];
                  return _ProjectTile(projectId: p.id, name: p.name, rate: p.hourlyRate, limit: p.monthlyHourLimit, accent: p.accentColor);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ProjectTile extends ConsumerWidget {
  const _ProjectTile({
    required this.projectId,
    required this.name,
    required this.rate,
    required this.limit,
    required this.accent,
  });

  final int projectId;
  final String name;
  final double rate;
  final double? limit;
  final int accent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minutesAsync = ref.watch(monthMinutesProvider(projectId));

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => context.push('/proyectos/$projectId'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(accent),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '${formatMxn(rate)} / h',
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: 'Registrar horas',
                    onPressed: () =>
                        context.push('/proyectos/$projectId/entrada'),
                    icon: const Icon(Icons.timer_outlined, color: AppColors.teal),
                  ),
                ],
              ),
              if (limit != null) ...[
                const SizedBox(height: 12),
                minutesAsync.when(
                  data: (m) => LimitProgress(minutesUsed: m, limitHours: limit!),
                  loading: () => const SizedBox(height: 24),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ] else
                minutesAsync.when(
                  data: (m) => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Este mes: ${formatHours(m)}',
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
