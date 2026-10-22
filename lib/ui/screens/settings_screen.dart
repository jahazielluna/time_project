import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../theme/app_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
      children: [
        Text(
          'Ajustes',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 4),
        const Text(
          'Preferencias locales de la app',
          style: TextStyle(color: AppColors.muted),
        ),
        const SizedBox(height: 24),
        settingsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('$e'),
          data: (s) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionTitle('Moneda'),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('MXN'),
                subtitle: Text('Fija en esta versión (sin multi-moneda)'),
                leading: Icon(Icons.attach_money, color: AppColors.teal),
              ),
              const Divider(height: 32),
              const _SectionTitle('Idioma'),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Español'),
                subtitle: Text('Único idioma de la interfaz'),
                leading: Icon(Icons.language, color: AppColors.teal),
              ),
              const Divider(height: 32),
              const _SectionTitle('Notificaciones de límite'),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Avisar al alcanzar'),
                subtitle: Text('${s.notifyAtPercent}% del límite mensual'),
                leading: const Icon(
                  Icons.notifications_outlined,
                  color: AppColors.teal,
                ),
              ),
              Slider(
                value: s.notifyAtPercent.toDouble(),
                min: 50,
                max: 100,
                divisions: 10,
                label: '${s.notifyAtPercent}%',
                activeColor: AppColors.teal,
                onChanged: (v) {
                  ref
                      .read(appActionsProvider)
                      .updateNotifyPercent(v.round());
                },
              ),
              const Text(
                'También se avisa al 100% (una vez por proyecto/mes).',
                style: TextStyle(color: AppColors.muted, fontSize: 13),
              ),
              const Divider(height: 32),
              const _SectionTitle('Respaldo'),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.cloud_outlined, color: AppColors.muted),
                title: const Text('Google Drive'),
                subtitle: const Text(
                  'TODO: OAuth y respaldo/restauración — fuera de este MVP',
                ),
                trailing: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Respaldo Drive llega en una versión posterior',
                        ),
                      ),
                    );
                  },
                  child: const Text('Próximamente'),
                ),
              ),
              const Divider(height: 32),
              const _SectionTitle('Acerca de'),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Time'),
                subtitle: Text('v1.0.0 · Android · horas freelance MXN'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.tealDeep,
            ),
      ),
    );
  }
}
