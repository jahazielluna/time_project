import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/screens/cuts_screen.dart';
import '../ui/screens/entry_form_screen.dart';
import '../ui/screens/project_detail_screen.dart';
import '../ui/screens/project_form_screen.dart';
import '../ui/screens/projects_list_screen.dart';
import '../ui/screens/report_screen.dart';
import '../ui/screens/settings_screen.dart';
import '../ui/shell/app_shell.dart';

final _rootKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/proyectos',
    routes: [
      ShellRoute(
        navigatorKey: _shellKey,
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/proyectos',
            pageBuilder: (c, s) => const NoTransitionPage(
              child: ProjectsListScreen(),
            ),
          ),
          GoRoute(
            path: '/cortes',
            pageBuilder: (c, s) => const NoTransitionPage(
              child: CutsScreen(),
            ),
          ),
          GoRoute(
            path: '/ajustes',
            pageBuilder: (c, s) => const NoTransitionPage(
              child: SettingsScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/proyectos/nuevo',
        parentNavigatorKey: _rootKey,
        builder: (c, s) => const ProjectFormScreen(),
      ),
      GoRoute(
        path: '/proyectos/:id',
        parentNavigatorKey: _rootKey,
        builder: (c, s) {
          final id = int.parse(s.pathParameters['id']!);
          return ProjectDetailScreen(projectId: id);
        },
        routes: [
          GoRoute(
            path: 'editar',
            parentNavigatorKey: _rootKey,
            builder: (c, s) {
              final id = int.parse(s.pathParameters['id']!);
              return ProjectFormScreen(projectId: id);
            },
          ),
          GoRoute(
            path: 'entrada',
            parentNavigatorKey: _rootKey,
            builder: (c, s) {
              final id = int.parse(s.pathParameters['id']!);
              return EntryFormScreen(projectId: id);
            },
          ),
          GoRoute(
            path: 'entrada/:entryId',
            parentNavigatorKey: _rootKey,
            builder: (c, s) {
              final id = int.parse(s.pathParameters['id']!);
              final entryId = int.parse(s.pathParameters['entryId']!);
              return EntryFormScreen(projectId: id, entryId: entryId);
            },
          ),
          GoRoute(
            path: 'reporte',
            parentNavigatorKey: _rootKey,
            builder: (c, s) {
              final id = int.parse(s.pathParameters['id']!);
              return ReportScreen(projectId: id);
            },
          ),
          GoRoute(
            path: 'cortes',
            parentNavigatorKey: _rootKey,
            builder: (c, s) {
              final id = int.parse(s.pathParameters['id']!);
              return CutsScreen(projectId: id);
            },
          ),
        ],
      ),
    ],
  );
}
