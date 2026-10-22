import 'package:drift/drift.dart';

/// Periodo de corte de facturación.
enum PeriodType { monthly, weekly, biweekly, custom }

/// Estado de cobro del corte.
enum CutStatus { pending, paid }

class Projects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 120)();
  RealColumn get hourlyRate => real()();
  TextColumn get currencyCode => text().withDefault(const Constant('MXN'))();
  RealColumn get monthlyHourLimit => real().nullable()();
  IntColumn get accentColor =>
      integer().withDefault(const Constant(0xFF0F766E))();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@TableIndex(name: 'idx_entries_project_date', columns: {#projectId, #date})
class TimeEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get projectId => integer().references(Projects, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get concept => text().withLength(min: 1, max: 200)();
  IntColumn get durationMinutes => integer()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@TableIndex(name: 'idx_cuts_project_start', columns: {#projectId, #startDate})
class BillingCuts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get projectId => integer().references(Projects, #id)();
  TextColumn get periodType => textEnum<PeriodType>()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get status =>
      textEnum<CutStatus>().withDefault(Constant(CutStatus.pending.name))();
  IntColumn get totalMinutes => integer()();
  RealColumn get totalAmount => real()();
  DateTimeColumn get paidAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

/// Ajustes de la app (fila única id=1).
class AppSettings extends Table {
  IntColumn get id => integer()();
  TextColumn get defaultCurrency =>
      text().withDefault(const Constant('MXN'))();
  TextColumn get locale => text().withDefault(const Constant('es'))();
  IntColumn get weekStartsOn =>
      integer().withDefault(const Constant(1))(); // 1 = lunes
  IntColumn get notifyAtPercent =>
      integer().withDefault(const Constant(80))();
  BoolColumn get driveBackupEnabled =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastBackupAt => dateTime().nullable()();
  TextColumn get themeTone =>
      text().withDefault(const Constant('slate_teal'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Anti-spam de notificaciones de límite (por proyecto/mes/umbral).
class LimitNotifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get projectId => integer().references(Projects, #id)();
  TextColumn get yearMonth => text()(); // YYYY-MM
  IntColumn get thresholdPercent => integer()();
  DateTimeColumn get notifiedAt => dateTime()();
}
