import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Projects,
  TimeEntries,
  BillingCuts,
  AppSettings,
  LimitNotifications,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await into(appSettings).insert(
            const AppSettingsCompanion(
              id: Value(1),
            ),
          );
        },
        onUpgrade: (m, from, to) async {
          // Migraciones futuras incrementales.
        },
      );

  // --- Projects ---

  Stream<List<Project>> watchActiveProjects() {
    return (select(projects)
          ..where((t) => t.archived.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .watch();
  }

  Future<Project?> getProject(int id) {
    return (select(projects)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertProject(ProjectsCompanion entry) {
    return into(projects).insert(entry);
  }

  Future<bool> updateProject(Project project) {
    return update(projects).replace(project);
  }

  Future<int> archiveProject(int id) {
    return (update(projects)..where((t) => t.id.equals(id))).write(
      ProjectsCompanion(
        archived: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // --- Time entries ---

  Stream<List<TimeEntry>> watchEntriesForProject(int projectId) {
    return (select(timeEntries)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.date),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  Future<List<TimeEntry>> entriesInRange(
    int projectId,
    DateTime start,
    DateTime end,
  ) {
    final startDay = DateTime(start.year, start.month, start.day);
    final endDay = DateTime(end.year, end.month, end.day, 23, 59, 59);
    return (select(timeEntries)
          ..where((t) =>
              t.projectId.equals(projectId) &
              t.date.isBiggerOrEqualValue(startDay) &
              t.date.isSmallerOrEqualValue(endDay))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
  }

  Future<int> minutesInRange(
    int projectId,
    DateTime start,
    DateTime end,
  ) async {
    final rows = await entriesInRange(projectId, start, end);
    return rows.fold<int>(0, (sum, e) => sum + e.durationMinutes);
  }

  Future<int> minutesThisMonth(int projectId) {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0);
    return minutesInRange(projectId, start, end);
  }

  Future<int> insertEntry(TimeEntriesCompanion entry) {
    return into(timeEntries).insert(entry);
  }

  Future<bool> updateEntry(TimeEntry entry) {
    return update(timeEntries).replace(entry);
  }

  Future<int> deleteEntry(int id) {
    return (delete(timeEntries)..where((t) => t.id.equals(id))).go();
  }

  Future<TimeEntry?> getEntry(int id) {
    return (select(timeEntries)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // --- Billing cuts ---

  Stream<List<BillingCut>> watchCutsForProject(int projectId) {
    return (select(billingCuts)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm.desc(t.startDate)]))
        .watch();
  }

  Stream<List<BillingCut>> watchAllCuts() {
    return (select(billingCuts)
          ..orderBy([(t) => OrderingTerm.desc(t.startDate)]))
        .watch();
  }

  Future<int> insertCut(BillingCutsCompanion entry) {
    return into(billingCuts).insert(entry);
  }

  Future<bool> updateCut(BillingCut cut) {
    return update(billingCuts).replace(cut);
  }

  Future<int> deleteCut(int id) {
    return (delete(billingCuts)..where((t) => t.id.equals(id))).go();
  }

  // --- Settings ---

  Stream<AppSetting> watchSettings() {
    return (select(appSettings)..where((t) => t.id.equals(1)))
        .watchSingle();
  }

  Future<AppSetting> getSettings() {
    return (select(appSettings)..where((t) => t.id.equals(1))).getSingle();
  }

  Future<bool> updateSettings(AppSetting settings) {
    return update(appSettings).replace(settings);
  }

  // --- Limit notifications anti-spam ---

  Future<bool> wasNotified(int projectId, String yearMonth, int percent) async {
    final row = await (select(limitNotifications)
          ..where((t) =>
              t.projectId.equals(projectId) &
              t.yearMonth.equals(yearMonth) &
              t.thresholdPercent.equals(percent)))
        .getSingleOrNull();
    return row != null;
  }

  Future<int> markNotified(int projectId, String yearMonth, int percent) {
    return into(limitNotifications).insert(
      LimitNotificationsCompanion.insert(
        projectId: projectId,
        yearMonth: yearMonth,
        thresholdPercent: percent,
        notifiedAt: DateTime.now(),
      ),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'time_project.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
