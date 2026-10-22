import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/tables.dart';
import '../services/export_service.dart';
import '../services/notification_service.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final settingsProvider = StreamProvider<AppSetting>((ref) {
  return ref.watch(databaseProvider).watchSettings();
});

final projectsProvider = StreamProvider<List<Project>>((ref) {
  return ref.watch(databaseProvider).watchActiveProjects();
});

final projectProvider =
    FutureProvider.family<Project?, int>((ref, id) async {
  return ref.watch(databaseProvider).getProject(id);
});

final entriesProvider =
    StreamProvider.family<List<TimeEntry>, int>((ref, projectId) {
  return ref.watch(databaseProvider).watchEntriesForProject(projectId);
});

final cutsForProjectProvider =
    StreamProvider.family<List<BillingCut>, int>((ref, projectId) {
  return ref.watch(databaseProvider).watchCutsForProject(projectId);
});

final allCutsProvider = StreamProvider<List<BillingCut>>((ref) {
  return ref.watch(databaseProvider).watchAllCuts();
});

final monthMinutesProvider =
    FutureProvider.family<int, int>((ref, projectId) async {
  ref.watch(entriesProvider(projectId));
  return ref.watch(databaseProvider).minutesThisMonth(projectId);
});

final exportServiceProvider = Provider((ref) => ExportService());

final notificationServiceProvider = Provider((ref) {
  return NotificationService();
});

/// Acciones de dominio sobre la DB + notificaciones de límite.
class AppActions {
  AppActions(this._db, this._notifications);

  final AppDatabase _db;
  final NotificationService _notifications;

  Future<int> createProject({
    required String name,
    required double hourlyRate,
    double? monthlyHourLimit,
    int accentColor = 0xFF0F766E,
  }) {
    final now = DateTime.now();
    return _db.insertProject(
      ProjectsCompanion.insert(
        name: name.trim(),
        hourlyRate: hourlyRate,
        currencyCode: const Value('MXN'),
        monthlyHourLimit: Value(monthlyHourLimit),
        accentColor: Value(accentColor),
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<void> saveProject(Project project) {
    return _db.updateProject(
      project.copyWith(updatedAt: DateTime.now()),
    );
  }

  Future<void> archiveProject(int id) => _db.archiveProject(id);

  Future<int> addEntry({
    required int projectId,
    required DateTime date,
    required String concept,
    required int durationMinutes,
    String? notes,
  }) async {
    final now = DateTime.now();
    final id = await _db.insertEntry(
      TimeEntriesCompanion.insert(
        projectId: projectId,
        date: DateTime(date.year, date.month, date.day),
        concept: concept.trim(),
        durationMinutes: durationMinutes,
        notes: Value(notes),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await _checkLimit(projectId);
    return id;
  }

  Future<void> saveEntry(TimeEntry entry) async {
    await _db.updateEntry(entry.copyWith(updatedAt: DateTime.now()));
    await _checkLimit(entry.projectId);
  }

  Future<void> removeEntry(TimeEntry entry) async {
    await _db.deleteEntry(entry.id);
    await _checkLimit(entry.projectId);
  }

  Future<int> createCut({
    required int projectId,
    required PeriodType periodType,
    required DateTime start,
    required DateTime end,
  }) async {
    final project = await _db.getProject(projectId);
    if (project == null) throw StateError('Proyecto no encontrado');
    final minutes = await _db.minutesInRange(projectId, start, end);
    final amount = (minutes / 60.0) * project.hourlyRate;
    return _db.insertCut(
      BillingCutsCompanion.insert(
        projectId: projectId,
        periodType: periodType,
        startDate: DateTime(start.year, start.month, start.day),
        endDate: DateTime(end.year, end.month, end.day),
        totalMinutes: minutes,
        totalAmount: amount,
        createdAt: DateTime.now(),
        status: const Value(CutStatus.pending),
      ),
    );
  }

  Future<void> setCutStatus(BillingCut cut, CutStatus status) {
    return _db.updateCut(
      cut.copyWith(
        status: status,
        paidAt: Value(status == CutStatus.paid ? DateTime.now() : null),
      ),
    );
  }

  Future<void> updateNotifyPercent(int percent) async {
    final s = await _db.getSettings();
    await _db.updateSettings(s.copyWith(notifyAtPercent: percent));
  }

  Future<void> _checkLimit(int projectId) async {
    final project = await _db.getProject(projectId);
    if (project == null || project.monthlyHourLimit == null) return;
    final limitHours = project.monthlyHourLimit!;
    if (limitHours <= 0) return;

    final settings = await _db.getSettings();
    final minutes = await _db.minutesThisMonth(projectId);
    final hours = minutes / 60.0;
    final pct = (hours / limitHours) * 100;
    final now = DateTime.now();
    final ym = '${now.year}-${now.month.toString().padLeft(2, '0')}';

    Future<void> maybeNotify(int threshold) async {
      if (pct < threshold) return;
      if (await _db.wasNotified(projectId, ym, threshold)) return;
      await _notifications.showLimitWarning(
        projectName: project.name,
        hoursUsed: hours,
        hoursLimit: limitHours,
        percent: pct.round(),
      );
      await _db.markNotified(projectId, ym, threshold);
    }

    await maybeNotify(settings.notifyAtPercent);
    if (settings.notifyAtPercent < 100) {
      await maybeNotify(100);
    }
  }
}

final appActionsProvider = Provider<AppActions>((ref) {
  return AppActions(
    ref.watch(databaseProvider),
    ref.watch(notificationServiceProvider),
  );
});
