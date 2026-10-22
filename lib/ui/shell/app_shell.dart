import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_theme.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  int _index(String loc) {
    if (loc.startsWith('/cortes')) return 1;
    if (loc.startsWith('/ajustes')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final loc = GoRouterState.of(context).uri.toString();
    final idx = _index(loc);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8FAFC),
              Color(0xFFEEF2F6),
              Color(0xFFE8F5F3),
            ],
          ),
        ),
        child: SafeArea(child: child),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx,
        backgroundColor: Colors.white.withOpacity(0.92),
        indicatorColor: AppColors.tealSoft,
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              context.go('/proyectos');
            case 1:
              context.go('/cortes');
            case 2:
              context.go('/ajustes');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(Icons.folder),
            label: 'Proyectos',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Cortes',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
