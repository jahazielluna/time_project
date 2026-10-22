// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 120),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hourlyRateMeta =
      const VerificationMeta('hourlyRate');
  @override
  late final GeneratedColumn<double> hourlyRate = GeneratedColumn<double>(
      'hourly_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyCodeMeta =
      const VerificationMeta('currencyCode');
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
      'currency_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('MXN'));
  static const VerificationMeta _monthlyHourLimitMeta =
      const VerificationMeta('monthlyHourLimit');
  @override
  late final GeneratedColumn<double> monthlyHourLimit = GeneratedColumn<double>(
      'monthly_hour_limit', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _accentColorMeta =
      const VerificationMeta('accentColor');
  @override
  late final GeneratedColumn<int> accentColor = GeneratedColumn<int>(
      'accent_color', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0xFF0F766E));
  static const VerificationMeta _archivedMeta =
      const VerificationMeta('archived');
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
      'archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        hourlyRate,
        currencyCode,
        monthlyHourLimit,
        accentColor,
        archived,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(Insertable<Project> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('hourly_rate')) {
      context.handle(
          _hourlyRateMeta,
          hourlyRate.isAcceptableOrUnknown(
              data['hourly_rate']!, _hourlyRateMeta));
    } else if (isInserting) {
      context.missing(_hourlyRateMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
          _currencyCodeMeta,
          currencyCode.isAcceptableOrUnknown(
              data['currency_code']!, _currencyCodeMeta));
    }
    if (data.containsKey('monthly_hour_limit')) {
      context.handle(
          _monthlyHourLimitMeta,
          monthlyHourLimit.isAcceptableOrUnknown(
              data['monthly_hour_limit']!, _monthlyHourLimitMeta));
    }
    if (data.containsKey('accent_color')) {
      context.handle(
          _accentColorMeta,
          accentColor.isAcceptableOrUnknown(
              data['accent_color']!, _accentColorMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      hourlyRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}hourly_rate'])!,
      currencyCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_code'])!,
      monthlyHourLimit: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}monthly_hour_limit']),
      accentColor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}accent_color'])!,
      archived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final int id;
  final String name;
  final double hourlyRate;
  final String currencyCode;
  final double? monthlyHourLimit;
  final int accentColor;
  final bool archived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Project(
      {required this.id,
      required this.name,
      required this.hourlyRate,
      required this.currencyCode,
      this.monthlyHourLimit,
      required this.accentColor,
      required this.archived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['hourly_rate'] = Variable<double>(hourlyRate);
    map['currency_code'] = Variable<String>(currencyCode);
    if (!nullToAbsent || monthlyHourLimit != null) {
      map['monthly_hour_limit'] = Variable<double>(monthlyHourLimit);
    }
    map['accent_color'] = Variable<int>(accentColor);
    map['archived'] = Variable<bool>(archived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      name: Value(name),
      hourlyRate: Value(hourlyRate),
      currencyCode: Value(currencyCode),
      monthlyHourLimit: monthlyHourLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(monthlyHourLimit),
      accentColor: Value(accentColor),
      archived: Value(archived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Project.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      hourlyRate: serializer.fromJson<double>(json['hourlyRate']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      monthlyHourLimit: serializer.fromJson<double?>(json['monthlyHourLimit']),
      accentColor: serializer.fromJson<int>(json['accentColor']),
      archived: serializer.fromJson<bool>(json['archived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'hourlyRate': serializer.toJson<double>(hourlyRate),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'monthlyHourLimit': serializer.toJson<double?>(monthlyHourLimit),
      'accentColor': serializer.toJson<int>(accentColor),
      'archived': serializer.toJson<bool>(archived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Project copyWith(
          {int? id,
          String? name,
          double? hourlyRate,
          String? currencyCode,
          Value<double?> monthlyHourLimit = const Value.absent(),
          int? accentColor,
          bool? archived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Project(
        id: id ?? this.id,
        name: name ?? this.name,
        hourlyRate: hourlyRate ?? this.hourlyRate,
        currencyCode: currencyCode ?? this.currencyCode,
        monthlyHourLimit: monthlyHourLimit.present
            ? monthlyHourLimit.value
            : this.monthlyHourLimit,
        accentColor: accentColor ?? this.accentColor,
        archived: archived ?? this.archived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      hourlyRate:
          data.hourlyRate.present ? data.hourlyRate.value : this.hourlyRate,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      monthlyHourLimit: data.monthlyHourLimit.present
          ? data.monthlyHourLimit.value
          : this.monthlyHourLimit,
      accentColor:
          data.accentColor.present ? data.accentColor.value : this.accentColor,
      archived: data.archived.present ? data.archived.value : this.archived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hourlyRate: $hourlyRate, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('monthlyHourLimit: $monthlyHourLimit, ')
          ..write('accentColor: $accentColor, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, hourlyRate, currencyCode,
      monthlyHourLimit, accentColor, archived, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.name == this.name &&
          other.hourlyRate == this.hourlyRate &&
          other.currencyCode == this.currencyCode &&
          other.monthlyHourLimit == this.monthlyHourLimit &&
          other.accentColor == this.accentColor &&
          other.archived == this.archived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> hourlyRate;
  final Value<String> currencyCode;
  final Value<double?> monthlyHourLimit;
  final Value<int> accentColor;
  final Value<bool> archived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.hourlyRate = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.monthlyHourLimit = const Value.absent(),
    this.accentColor = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProjectsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double hourlyRate,
    this.currencyCode = const Value.absent(),
    this.monthlyHourLimit = const Value.absent(),
    this.accentColor = const Value.absent(),
    this.archived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : name = Value(name),
        hourlyRate = Value(hourlyRate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Project> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? hourlyRate,
    Expression<String>? currencyCode,
    Expression<double>? monthlyHourLimit,
    Expression<int>? accentColor,
    Expression<bool>? archived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (hourlyRate != null) 'hourly_rate': hourlyRate,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (monthlyHourLimit != null) 'monthly_hour_limit': monthlyHourLimit,
      if (accentColor != null) 'accent_color': accentColor,
      if (archived != null) 'archived': archived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProjectsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? hourlyRate,
      Value<String>? currencyCode,
      Value<double?>? monthlyHourLimit,
      Value<int>? accentColor,
      Value<bool>? archived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ProjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      currencyCode: currencyCode ?? this.currencyCode,
      monthlyHourLimit: monthlyHourLimit ?? this.monthlyHourLimit,
      accentColor: accentColor ?? this.accentColor,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (hourlyRate.present) {
      map['hourly_rate'] = Variable<double>(hourlyRate.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (monthlyHourLimit.present) {
      map['monthly_hour_limit'] = Variable<double>(monthlyHourLimit.value);
    }
    if (accentColor.present) {
      map['accent_color'] = Variable<int>(accentColor.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hourlyRate: $hourlyRate, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('monthlyHourLimit: $monthlyHourLimit, ')
          ..write('accentColor: $accentColor, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TimeEntriesTable extends TimeEntries
    with TableInfo<$TimeEntriesTable, TimeEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
      'project_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES projects (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _conceptMeta =
      const VerificationMeta('concept');
  @override
  late final GeneratedColumn<String> concept = GeneratedColumn<String>(
      'concept', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        date,
        concept,
        durationMinutes,
        notes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'time_entries';
  @override
  VerificationContext validateIntegrity(Insertable<TimeEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('concept')) {
      context.handle(_conceptMeta,
          concept.isAcceptableOrUnknown(data['concept']!, _conceptMeta));
    } else if (isInserting) {
      context.missing(_conceptMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimeEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimeEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}project_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      concept: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}concept'])!,
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TimeEntriesTable createAlias(String alias) {
    return $TimeEntriesTable(attachedDatabase, alias);
  }
}

class TimeEntry extends DataClass implements Insertable<TimeEntry> {
  final int id;
  final int projectId;
  final DateTime date;
  final String concept;
  final int durationMinutes;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TimeEntry(
      {required this.id,
      required this.projectId,
      required this.date,
      required this.concept,
      required this.durationMinutes,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<int>(projectId);
    map['date'] = Variable<DateTime>(date);
    map['concept'] = Variable<String>(concept);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TimeEntriesCompanion toCompanion(bool nullToAbsent) {
    return TimeEntriesCompanion(
      id: Value(id),
      projectId: Value(projectId),
      date: Value(date),
      concept: Value(concept),
      durationMinutes: Value(durationMinutes),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TimeEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeEntry(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<int>(json['projectId']),
      date: serializer.fromJson<DateTime>(json['date']),
      concept: serializer.fromJson<String>(json['concept']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<int>(projectId),
      'date': serializer.toJson<DateTime>(date),
      'concept': serializer.toJson<String>(concept),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TimeEntry copyWith(
          {int? id,
          int? projectId,
          DateTime? date,
          String? concept,
          int? durationMinutes,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TimeEntry(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        date: date ?? this.date,
        concept: concept ?? this.concept,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  TimeEntry copyWithCompanion(TimeEntriesCompanion data) {
    return TimeEntry(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      date: data.date.present ? data.date.value : this.date,
      concept: data.concept.present ? data.concept.value : this.concept,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimeEntry(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('date: $date, ')
          ..write('concept: $concept, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, date, concept, durationMinutes,
      notes, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeEntry &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.date == this.date &&
          other.concept == this.concept &&
          other.durationMinutes == this.durationMinutes &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TimeEntriesCompanion extends UpdateCompanion<TimeEntry> {
  final Value<int> id;
  final Value<int> projectId;
  final Value<DateTime> date;
  final Value<String> concept;
  final Value<int> durationMinutes;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TimeEntriesCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.date = const Value.absent(),
    this.concept = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TimeEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int projectId,
    required DateTime date,
    required String concept,
    required int durationMinutes,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : projectId = Value(projectId),
        date = Value(date),
        concept = Value(concept),
        durationMinutes = Value(durationMinutes),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TimeEntry> custom({
    Expression<int>? id,
    Expression<int>? projectId,
    Expression<DateTime>? date,
    Expression<String>? concept,
    Expression<int>? durationMinutes,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (date != null) 'date': date,
      if (concept != null) 'concept': concept,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TimeEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? projectId,
      Value<DateTime>? date,
      Value<String>? concept,
      Value<int>? durationMinutes,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TimeEntriesCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      date: date ?? this.date,
      concept: concept ?? this.concept,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (concept.present) {
      map['concept'] = Variable<String>(concept.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeEntriesCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('date: $date, ')
          ..write('concept: $concept, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BillingCutsTable extends BillingCuts
    with TableInfo<$BillingCutsTable, BillingCut> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillingCutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
      'project_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES projects (id)'));
  static const VerificationMeta _periodTypeMeta =
      const VerificationMeta('periodType');
  @override
  late final GeneratedColumnWithTypeConverter<PeriodType, String> periodType =
      GeneratedColumn<String>('period_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<PeriodType>($BillingCutsTable.$converterperiodType);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<CutStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(CutStatus.pending.name))
          .withConverter<CutStatus>($BillingCutsTable.$converterstatus);
  static const VerificationMeta _totalMinutesMeta =
      const VerificationMeta('totalMinutes');
  @override
  late final GeneratedColumn<int> totalMinutes = GeneratedColumn<int>(
      'total_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
      'total_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paidAtMeta = const VerificationMeta('paidAt');
  @override
  late final GeneratedColumn<DateTime> paidAt = GeneratedColumn<DateTime>(
      'paid_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        periodType,
        startDate,
        endDate,
        status,
        totalMinutes,
        totalAmount,
        paidAt,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'billing_cuts';
  @override
  VerificationContext validateIntegrity(Insertable<BillingCut> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    context.handle(_periodTypeMeta, const VerificationResult.success());
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('total_minutes')) {
      context.handle(
          _totalMinutesMeta,
          totalMinutes.isAcceptableOrUnknown(
              data['total_minutes']!, _totalMinutesMeta));
    } else if (isInserting) {
      context.missing(_totalMinutesMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount']!, _totalAmountMeta));
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('paid_at')) {
      context.handle(_paidAtMeta,
          paidAt.isAcceptableOrUnknown(data['paid_at']!, _paidAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BillingCut map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BillingCut(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}project_id'])!,
      periodType: $BillingCutsTable.$converterperiodType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}period_type'])!),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      status: $BillingCutsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      totalMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_minutes'])!,
      totalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_amount'])!,
      paidAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}paid_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $BillingCutsTable createAlias(String alias) {
    return $BillingCutsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PeriodType, String, String> $converterperiodType =
      const EnumNameConverter<PeriodType>(PeriodType.values);
  static JsonTypeConverter2<CutStatus, String, String> $converterstatus =
      const EnumNameConverter<CutStatus>(CutStatus.values);
}

class BillingCut extends DataClass implements Insertable<BillingCut> {
  final int id;
  final int projectId;
  final PeriodType periodType;
  final DateTime startDate;
  final DateTime endDate;
  final CutStatus status;
  final int totalMinutes;
  final double totalAmount;
  final DateTime? paidAt;
  final DateTime createdAt;
  const BillingCut(
      {required this.id,
      required this.projectId,
      required this.periodType,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.totalMinutes,
      required this.totalAmount,
      this.paidAt,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<int>(projectId);
    {
      map['period_type'] = Variable<String>(
          $BillingCutsTable.$converterperiodType.toSql(periodType));
    }
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    {
      map['status'] =
          Variable<String>($BillingCutsTable.$converterstatus.toSql(status));
    }
    map['total_minutes'] = Variable<int>(totalMinutes);
    map['total_amount'] = Variable<double>(totalAmount);
    if (!nullToAbsent || paidAt != null) {
      map['paid_at'] = Variable<DateTime>(paidAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BillingCutsCompanion toCompanion(bool nullToAbsent) {
    return BillingCutsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      periodType: Value(periodType),
      startDate: Value(startDate),
      endDate: Value(endDate),
      status: Value(status),
      totalMinutes: Value(totalMinutes),
      totalAmount: Value(totalAmount),
      paidAt:
          paidAt == null && nullToAbsent ? const Value.absent() : Value(paidAt),
      createdAt: Value(createdAt),
    );
  }

  factory BillingCut.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BillingCut(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<int>(json['projectId']),
      periodType: $BillingCutsTable.$converterperiodType
          .fromJson(serializer.fromJson<String>(json['periodType'])),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      status: $BillingCutsTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
      totalMinutes: serializer.fromJson<int>(json['totalMinutes']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      paidAt: serializer.fromJson<DateTime?>(json['paidAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<int>(projectId),
      'periodType': serializer.toJson<String>(
          $BillingCutsTable.$converterperiodType.toJson(periodType)),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'status': serializer
          .toJson<String>($BillingCutsTable.$converterstatus.toJson(status)),
      'totalMinutes': serializer.toJson<int>(totalMinutes),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'paidAt': serializer.toJson<DateTime?>(paidAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BillingCut copyWith(
          {int? id,
          int? projectId,
          PeriodType? periodType,
          DateTime? startDate,
          DateTime? endDate,
          CutStatus? status,
          int? totalMinutes,
          double? totalAmount,
          Value<DateTime?> paidAt = const Value.absent(),
          DateTime? createdAt}) =>
      BillingCut(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        periodType: periodType ?? this.periodType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        totalMinutes: totalMinutes ?? this.totalMinutes,
        totalAmount: totalAmount ?? this.totalAmount,
        paidAt: paidAt.present ? paidAt.value : this.paidAt,
        createdAt: createdAt ?? this.createdAt,
      );
  BillingCut copyWithCompanion(BillingCutsCompanion data) {
    return BillingCut(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      periodType:
          data.periodType.present ? data.periodType.value : this.periodType,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      status: data.status.present ? data.status.value : this.status,
      totalMinutes: data.totalMinutes.present
          ? data.totalMinutes.value
          : this.totalMinutes,
      totalAmount:
          data.totalAmount.present ? data.totalAmount.value : this.totalAmount,
      paidAt: data.paidAt.present ? data.paidAt.value : this.paidAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BillingCut(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('periodType: $periodType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('totalMinutes: $totalMinutes, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAt: $paidAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, periodType, startDate, endDate,
      status, totalMinutes, totalAmount, paidAt, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BillingCut &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.periodType == this.periodType &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.status == this.status &&
          other.totalMinutes == this.totalMinutes &&
          other.totalAmount == this.totalAmount &&
          other.paidAt == this.paidAt &&
          other.createdAt == this.createdAt);
}

class BillingCutsCompanion extends UpdateCompanion<BillingCut> {
  final Value<int> id;
  final Value<int> projectId;
  final Value<PeriodType> periodType;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<CutStatus> status;
  final Value<int> totalMinutes;
  final Value<double> totalAmount;
  final Value<DateTime?> paidAt;
  final Value<DateTime> createdAt;
  const BillingCutsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.periodType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.totalMinutes = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BillingCutsCompanion.insert({
    this.id = const Value.absent(),
    required int projectId,
    required PeriodType periodType,
    required DateTime startDate,
    required DateTime endDate,
    this.status = const Value.absent(),
    required int totalMinutes,
    required double totalAmount,
    this.paidAt = const Value.absent(),
    required DateTime createdAt,
  })  : projectId = Value(projectId),
        periodType = Value(periodType),
        startDate = Value(startDate),
        endDate = Value(endDate),
        totalMinutes = Value(totalMinutes),
        totalAmount = Value(totalAmount),
        createdAt = Value(createdAt);
  static Insertable<BillingCut> custom({
    Expression<int>? id,
    Expression<int>? projectId,
    Expression<String>? periodType,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? status,
    Expression<int>? totalMinutes,
    Expression<double>? totalAmount,
    Expression<DateTime>? paidAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (periodType != null) 'period_type': periodType,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (status != null) 'status': status,
      if (totalMinutes != null) 'total_minutes': totalMinutes,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (paidAt != null) 'paid_at': paidAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BillingCutsCompanion copyWith(
      {Value<int>? id,
      Value<int>? projectId,
      Value<PeriodType>? periodType,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<CutStatus>? status,
      Value<int>? totalMinutes,
      Value<double>? totalAmount,
      Value<DateTime?>? paidAt,
      Value<DateTime>? createdAt}) {
    return BillingCutsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      periodType: periodType ?? this.periodType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      totalMinutes: totalMinutes ?? this.totalMinutes,
      totalAmount: totalAmount ?? this.totalAmount,
      paidAt: paidAt ?? this.paidAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (periodType.present) {
      map['period_type'] = Variable<String>(
          $BillingCutsTable.$converterperiodType.toSql(periodType.value));
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $BillingCutsTable.$converterstatus.toSql(status.value));
    }
    if (totalMinutes.present) {
      map['total_minutes'] = Variable<int>(totalMinutes.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (paidAt.present) {
      map['paid_at'] = Variable<DateTime>(paidAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillingCutsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('periodType: $periodType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('totalMinutes: $totalMinutes, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAt: $paidAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _defaultCurrencyMeta =
      const VerificationMeta('defaultCurrency');
  @override
  late final GeneratedColumn<String> defaultCurrency = GeneratedColumn<String>(
      'default_currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('MXN'));
  static const VerificationMeta _localeMeta = const VerificationMeta('locale');
  @override
  late final GeneratedColumn<String> locale = GeneratedColumn<String>(
      'locale', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('es'));
  static const VerificationMeta _weekStartsOnMeta =
      const VerificationMeta('weekStartsOn');
  @override
  late final GeneratedColumn<int> weekStartsOn = GeneratedColumn<int>(
      'week_starts_on', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _notifyAtPercentMeta =
      const VerificationMeta('notifyAtPercent');
  @override
  late final GeneratedColumn<int> notifyAtPercent = GeneratedColumn<int>(
      'notify_at_percent', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(80));
  static const VerificationMeta _driveBackupEnabledMeta =
      const VerificationMeta('driveBackupEnabled');
  @override
  late final GeneratedColumn<bool> driveBackupEnabled = GeneratedColumn<bool>(
      'drive_backup_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("drive_backup_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastBackupAtMeta =
      const VerificationMeta('lastBackupAt');
  @override
  late final GeneratedColumn<DateTime> lastBackupAt = GeneratedColumn<DateTime>(
      'last_backup_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _themeToneMeta =
      const VerificationMeta('themeTone');
  @override
  late final GeneratedColumn<String> themeTone = GeneratedColumn<String>(
      'theme_tone', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('slate_teal'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        defaultCurrency,
        locale,
        weekStartsOn,
        notifyAtPercent,
        driveBackupEnabled,
        lastBackupAt,
        themeTone
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('default_currency')) {
      context.handle(
          _defaultCurrencyMeta,
          defaultCurrency.isAcceptableOrUnknown(
              data['default_currency']!, _defaultCurrencyMeta));
    }
    if (data.containsKey('locale')) {
      context.handle(_localeMeta,
          locale.isAcceptableOrUnknown(data['locale']!, _localeMeta));
    }
    if (data.containsKey('week_starts_on')) {
      context.handle(
          _weekStartsOnMeta,
          weekStartsOn.isAcceptableOrUnknown(
              data['week_starts_on']!, _weekStartsOnMeta));
    }
    if (data.containsKey('notify_at_percent')) {
      context.handle(
          _notifyAtPercentMeta,
          notifyAtPercent.isAcceptableOrUnknown(
              data['notify_at_percent']!, _notifyAtPercentMeta));
    }
    if (data.containsKey('drive_backup_enabled')) {
      context.handle(
          _driveBackupEnabledMeta,
          driveBackupEnabled.isAcceptableOrUnknown(
              data['drive_backup_enabled']!, _driveBackupEnabledMeta));
    }
    if (data.containsKey('last_backup_at')) {
      context.handle(
          _lastBackupAtMeta,
          lastBackupAt.isAcceptableOrUnknown(
              data['last_backup_at']!, _lastBackupAtMeta));
    }
    if (data.containsKey('theme_tone')) {
      context.handle(_themeToneMeta,
          themeTone.isAcceptableOrUnknown(data['theme_tone']!, _themeToneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      defaultCurrency: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}default_currency'])!,
      locale: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}locale'])!,
      weekStartsOn: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}week_starts_on'])!,
      notifyAtPercent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}notify_at_percent'])!,
      driveBackupEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}drive_backup_enabled'])!,
      lastBackupAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_backup_at']),
      themeTone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_tone'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final String defaultCurrency;
  final String locale;
  final int weekStartsOn;
  final int notifyAtPercent;
  final bool driveBackupEnabled;
  final DateTime? lastBackupAt;
  final String themeTone;
  const AppSetting(
      {required this.id,
      required this.defaultCurrency,
      required this.locale,
      required this.weekStartsOn,
      required this.notifyAtPercent,
      required this.driveBackupEnabled,
      this.lastBackupAt,
      required this.themeTone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['default_currency'] = Variable<String>(defaultCurrency);
    map['locale'] = Variable<String>(locale);
    map['week_starts_on'] = Variable<int>(weekStartsOn);
    map['notify_at_percent'] = Variable<int>(notifyAtPercent);
    map['drive_backup_enabled'] = Variable<bool>(driveBackupEnabled);
    if (!nullToAbsent || lastBackupAt != null) {
      map['last_backup_at'] = Variable<DateTime>(lastBackupAt);
    }
    map['theme_tone'] = Variable<String>(themeTone);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      defaultCurrency: Value(defaultCurrency),
      locale: Value(locale),
      weekStartsOn: Value(weekStartsOn),
      notifyAtPercent: Value(notifyAtPercent),
      driveBackupEnabled: Value(driveBackupEnabled),
      lastBackupAt: lastBackupAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastBackupAt),
      themeTone: Value(themeTone),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      defaultCurrency: serializer.fromJson<String>(json['defaultCurrency']),
      locale: serializer.fromJson<String>(json['locale']),
      weekStartsOn: serializer.fromJson<int>(json['weekStartsOn']),
      notifyAtPercent: serializer.fromJson<int>(json['notifyAtPercent']),
      driveBackupEnabled: serializer.fromJson<bool>(json['driveBackupEnabled']),
      lastBackupAt: serializer.fromJson<DateTime?>(json['lastBackupAt']),
      themeTone: serializer.fromJson<String>(json['themeTone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'defaultCurrency': serializer.toJson<String>(defaultCurrency),
      'locale': serializer.toJson<String>(locale),
      'weekStartsOn': serializer.toJson<int>(weekStartsOn),
      'notifyAtPercent': serializer.toJson<int>(notifyAtPercent),
      'driveBackupEnabled': serializer.toJson<bool>(driveBackupEnabled),
      'lastBackupAt': serializer.toJson<DateTime?>(lastBackupAt),
      'themeTone': serializer.toJson<String>(themeTone),
    };
  }

  AppSetting copyWith(
          {int? id,
          String? defaultCurrency,
          String? locale,
          int? weekStartsOn,
          int? notifyAtPercent,
          bool? driveBackupEnabled,
          Value<DateTime?> lastBackupAt = const Value.absent(),
          String? themeTone}) =>
      AppSetting(
        id: id ?? this.id,
        defaultCurrency: defaultCurrency ?? this.defaultCurrency,
        locale: locale ?? this.locale,
        weekStartsOn: weekStartsOn ?? this.weekStartsOn,
        notifyAtPercent: notifyAtPercent ?? this.notifyAtPercent,
        driveBackupEnabled: driveBackupEnabled ?? this.driveBackupEnabled,
        lastBackupAt:
            lastBackupAt.present ? lastBackupAt.value : this.lastBackupAt,
        themeTone: themeTone ?? this.themeTone,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      defaultCurrency: data.defaultCurrency.present
          ? data.defaultCurrency.value
          : this.defaultCurrency,
      locale: data.locale.present ? data.locale.value : this.locale,
      weekStartsOn: data.weekStartsOn.present
          ? data.weekStartsOn.value
          : this.weekStartsOn,
      notifyAtPercent: data.notifyAtPercent.present
          ? data.notifyAtPercent.value
          : this.notifyAtPercent,
      driveBackupEnabled: data.driveBackupEnabled.present
          ? data.driveBackupEnabled.value
          : this.driveBackupEnabled,
      lastBackupAt: data.lastBackupAt.present
          ? data.lastBackupAt.value
          : this.lastBackupAt,
      themeTone: data.themeTone.present ? data.themeTone.value : this.themeTone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('defaultCurrency: $defaultCurrency, ')
          ..write('locale: $locale, ')
          ..write('weekStartsOn: $weekStartsOn, ')
          ..write('notifyAtPercent: $notifyAtPercent, ')
          ..write('driveBackupEnabled: $driveBackupEnabled, ')
          ..write('lastBackupAt: $lastBackupAt, ')
          ..write('themeTone: $themeTone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, defaultCurrency, locale, weekStartsOn,
      notifyAtPercent, driveBackupEnabled, lastBackupAt, themeTone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.defaultCurrency == this.defaultCurrency &&
          other.locale == this.locale &&
          other.weekStartsOn == this.weekStartsOn &&
          other.notifyAtPercent == this.notifyAtPercent &&
          other.driveBackupEnabled == this.driveBackupEnabled &&
          other.lastBackupAt == this.lastBackupAt &&
          other.themeTone == this.themeTone);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<String> defaultCurrency;
  final Value<String> locale;
  final Value<int> weekStartsOn;
  final Value<int> notifyAtPercent;
  final Value<bool> driveBackupEnabled;
  final Value<DateTime?> lastBackupAt;
  final Value<String> themeTone;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.defaultCurrency = const Value.absent(),
    this.locale = const Value.absent(),
    this.weekStartsOn = const Value.absent(),
    this.notifyAtPercent = const Value.absent(),
    this.driveBackupEnabled = const Value.absent(),
    this.lastBackupAt = const Value.absent(),
    this.themeTone = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.defaultCurrency = const Value.absent(),
    this.locale = const Value.absent(),
    this.weekStartsOn = const Value.absent(),
    this.notifyAtPercent = const Value.absent(),
    this.driveBackupEnabled = const Value.absent(),
    this.lastBackupAt = const Value.absent(),
    this.themeTone = const Value.absent(),
  });
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<String>? defaultCurrency,
    Expression<String>? locale,
    Expression<int>? weekStartsOn,
    Expression<int>? notifyAtPercent,
    Expression<bool>? driveBackupEnabled,
    Expression<DateTime>? lastBackupAt,
    Expression<String>? themeTone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (defaultCurrency != null) 'default_currency': defaultCurrency,
      if (locale != null) 'locale': locale,
      if (weekStartsOn != null) 'week_starts_on': weekStartsOn,
      if (notifyAtPercent != null) 'notify_at_percent': notifyAtPercent,
      if (driveBackupEnabled != null)
        'drive_backup_enabled': driveBackupEnabled,
      if (lastBackupAt != null) 'last_backup_at': lastBackupAt,
      if (themeTone != null) 'theme_tone': themeTone,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? defaultCurrency,
      Value<String>? locale,
      Value<int>? weekStartsOn,
      Value<int>? notifyAtPercent,
      Value<bool>? driveBackupEnabled,
      Value<DateTime?>? lastBackupAt,
      Value<String>? themeTone}) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      locale: locale ?? this.locale,
      weekStartsOn: weekStartsOn ?? this.weekStartsOn,
      notifyAtPercent: notifyAtPercent ?? this.notifyAtPercent,
      driveBackupEnabled: driveBackupEnabled ?? this.driveBackupEnabled,
      lastBackupAt: lastBackupAt ?? this.lastBackupAt,
      themeTone: themeTone ?? this.themeTone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (defaultCurrency.present) {
      map['default_currency'] = Variable<String>(defaultCurrency.value);
    }
    if (locale.present) {
      map['locale'] = Variable<String>(locale.value);
    }
    if (weekStartsOn.present) {
      map['week_starts_on'] = Variable<int>(weekStartsOn.value);
    }
    if (notifyAtPercent.present) {
      map['notify_at_percent'] = Variable<int>(notifyAtPercent.value);
    }
    if (driveBackupEnabled.present) {
      map['drive_backup_enabled'] = Variable<bool>(driveBackupEnabled.value);
    }
    if (lastBackupAt.present) {
      map['last_backup_at'] = Variable<DateTime>(lastBackupAt.value);
    }
    if (themeTone.present) {
      map['theme_tone'] = Variable<String>(themeTone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('defaultCurrency: $defaultCurrency, ')
          ..write('locale: $locale, ')
          ..write('weekStartsOn: $weekStartsOn, ')
          ..write('notifyAtPercent: $notifyAtPercent, ')
          ..write('driveBackupEnabled: $driveBackupEnabled, ')
          ..write('lastBackupAt: $lastBackupAt, ')
          ..write('themeTone: $themeTone')
          ..write(')'))
        .toString();
  }
}

class $LimitNotificationsTable extends LimitNotifications
    with TableInfo<$LimitNotificationsTable, LimitNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LimitNotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
      'project_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES projects (id)'));
  static const VerificationMeta _yearMonthMeta =
      const VerificationMeta('yearMonth');
  @override
  late final GeneratedColumn<String> yearMonth = GeneratedColumn<String>(
      'year_month', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thresholdPercentMeta =
      const VerificationMeta('thresholdPercent');
  @override
  late final GeneratedColumn<int> thresholdPercent = GeneratedColumn<int>(
      'threshold_percent', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notifiedAtMeta =
      const VerificationMeta('notifiedAt');
  @override
  late final GeneratedColumn<DateTime> notifiedAt = GeneratedColumn<DateTime>(
      'notified_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, projectId, yearMonth, thresholdPercent, notifiedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'limit_notifications';
  @override
  VerificationContext validateIntegrity(Insertable<LimitNotification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('year_month')) {
      context.handle(_yearMonthMeta,
          yearMonth.isAcceptableOrUnknown(data['year_month']!, _yearMonthMeta));
    } else if (isInserting) {
      context.missing(_yearMonthMeta);
    }
    if (data.containsKey('threshold_percent')) {
      context.handle(
          _thresholdPercentMeta,
          thresholdPercent.isAcceptableOrUnknown(
              data['threshold_percent']!, _thresholdPercentMeta));
    } else if (isInserting) {
      context.missing(_thresholdPercentMeta);
    }
    if (data.containsKey('notified_at')) {
      context.handle(
          _notifiedAtMeta,
          notifiedAt.isAcceptableOrUnknown(
              data['notified_at']!, _notifiedAtMeta));
    } else if (isInserting) {
      context.missing(_notifiedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LimitNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LimitNotification(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}project_id'])!,
      yearMonth: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}year_month'])!,
      thresholdPercent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}threshold_percent'])!,
      notifiedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}notified_at'])!,
    );
  }

  @override
  $LimitNotificationsTable createAlias(String alias) {
    return $LimitNotificationsTable(attachedDatabase, alias);
  }
}

class LimitNotification extends DataClass
    implements Insertable<LimitNotification> {
  final int id;
  final int projectId;
  final String yearMonth;
  final int thresholdPercent;
  final DateTime notifiedAt;
  const LimitNotification(
      {required this.id,
      required this.projectId,
      required this.yearMonth,
      required this.thresholdPercent,
      required this.notifiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<int>(projectId);
    map['year_month'] = Variable<String>(yearMonth);
    map['threshold_percent'] = Variable<int>(thresholdPercent);
    map['notified_at'] = Variable<DateTime>(notifiedAt);
    return map;
  }

  LimitNotificationsCompanion toCompanion(bool nullToAbsent) {
    return LimitNotificationsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      yearMonth: Value(yearMonth),
      thresholdPercent: Value(thresholdPercent),
      notifiedAt: Value(notifiedAt),
    );
  }

  factory LimitNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LimitNotification(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<int>(json['projectId']),
      yearMonth: serializer.fromJson<String>(json['yearMonth']),
      thresholdPercent: serializer.fromJson<int>(json['thresholdPercent']),
      notifiedAt: serializer.fromJson<DateTime>(json['notifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<int>(projectId),
      'yearMonth': serializer.toJson<String>(yearMonth),
      'thresholdPercent': serializer.toJson<int>(thresholdPercent),
      'notifiedAt': serializer.toJson<DateTime>(notifiedAt),
    };
  }

  LimitNotification copyWith(
          {int? id,
          int? projectId,
          String? yearMonth,
          int? thresholdPercent,
          DateTime? notifiedAt}) =>
      LimitNotification(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        yearMonth: yearMonth ?? this.yearMonth,
        thresholdPercent: thresholdPercent ?? this.thresholdPercent,
        notifiedAt: notifiedAt ?? this.notifiedAt,
      );
  LimitNotification copyWithCompanion(LimitNotificationsCompanion data) {
    return LimitNotification(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      yearMonth: data.yearMonth.present ? data.yearMonth.value : this.yearMonth,
      thresholdPercent: data.thresholdPercent.present
          ? data.thresholdPercent.value
          : this.thresholdPercent,
      notifiedAt:
          data.notifiedAt.present ? data.notifiedAt.value : this.notifiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LimitNotification(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('yearMonth: $yearMonth, ')
          ..write('thresholdPercent: $thresholdPercent, ')
          ..write('notifiedAt: $notifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, projectId, yearMonth, thresholdPercent, notifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LimitNotification &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.yearMonth == this.yearMonth &&
          other.thresholdPercent == this.thresholdPercent &&
          other.notifiedAt == this.notifiedAt);
}

class LimitNotificationsCompanion extends UpdateCompanion<LimitNotification> {
  final Value<int> id;
  final Value<int> projectId;
  final Value<String> yearMonth;
  final Value<int> thresholdPercent;
  final Value<DateTime> notifiedAt;
  const LimitNotificationsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.yearMonth = const Value.absent(),
    this.thresholdPercent = const Value.absent(),
    this.notifiedAt = const Value.absent(),
  });
  LimitNotificationsCompanion.insert({
    this.id = const Value.absent(),
    required int projectId,
    required String yearMonth,
    required int thresholdPercent,
    required DateTime notifiedAt,
  })  : projectId = Value(projectId),
        yearMonth = Value(yearMonth),
        thresholdPercent = Value(thresholdPercent),
        notifiedAt = Value(notifiedAt);
  static Insertable<LimitNotification> custom({
    Expression<int>? id,
    Expression<int>? projectId,
    Expression<String>? yearMonth,
    Expression<int>? thresholdPercent,
    Expression<DateTime>? notifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (yearMonth != null) 'year_month': yearMonth,
      if (thresholdPercent != null) 'threshold_percent': thresholdPercent,
      if (notifiedAt != null) 'notified_at': notifiedAt,
    });
  }

  LimitNotificationsCompanion copyWith(
      {Value<int>? id,
      Value<int>? projectId,
      Value<String>? yearMonth,
      Value<int>? thresholdPercent,
      Value<DateTime>? notifiedAt}) {
    return LimitNotificationsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      yearMonth: yearMonth ?? this.yearMonth,
      thresholdPercent: thresholdPercent ?? this.thresholdPercent,
      notifiedAt: notifiedAt ?? this.notifiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (yearMonth.present) {
      map['year_month'] = Variable<String>(yearMonth.value);
    }
    if (thresholdPercent.present) {
      map['threshold_percent'] = Variable<int>(thresholdPercent.value);
    }
    if (notifiedAt.present) {
      map['notified_at'] = Variable<DateTime>(notifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LimitNotificationsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('yearMonth: $yearMonth, ')
          ..write('thresholdPercent: $thresholdPercent, ')
          ..write('notifiedAt: $notifiedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $TimeEntriesTable timeEntries = $TimeEntriesTable(this);
  late final $BillingCutsTable billingCuts = $BillingCutsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $LimitNotificationsTable limitNotifications =
      $LimitNotificationsTable(this);
  late final Index idxEntriesProjectDate = Index('idx_entries_project_date',
      'CREATE INDEX idx_entries_project_date ON time_entries (project_id, date)');
  late final Index idxCutsProjectStart = Index('idx_cuts_project_start',
      'CREATE INDEX idx_cuts_project_start ON billing_cuts (project_id, start_date)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        projects,
        timeEntries,
        billingCuts,
        appSettings,
        limitNotifications,
        idxEntriesProjectDate,
        idxCutsProjectStart
      ];
}

typedef $$ProjectsTableCreateCompanionBuilder = ProjectsCompanion Function({
  Value<int> id,
  required String name,
  required double hourlyRate,
  Value<String> currencyCode,
  Value<double?> monthlyHourLimit,
  Value<int> accentColor,
  Value<bool> archived,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$ProjectsTableUpdateCompanionBuilder = ProjectsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> hourlyRate,
  Value<String> currencyCode,
  Value<double?> monthlyHourLimit,
  Value<int> accentColor,
  Value<bool> archived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$ProjectsTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectsTable, Project> {
  $$ProjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TimeEntriesTable, List<TimeEntry>>
      _timeEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.timeEntries,
          aliasName:
              $_aliasNameGenerator(db.projects.id, db.timeEntries.projectId));

  $$TimeEntriesTableProcessedTableManager get timeEntriesRefs {
    final manager = $$TimeEntriesTableTableManager($_db, $_db.timeEntries)
        .filter((f) => f.projectId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_timeEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BillingCutsTable, List<BillingCut>>
      _billingCutsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.billingCuts,
          aliasName:
              $_aliasNameGenerator(db.projects.id, db.billingCuts.projectId));

  $$BillingCutsTableProcessedTableManager get billingCutsRefs {
    final manager = $$BillingCutsTableTableManager($_db, $_db.billingCuts)
        .filter((f) => f.projectId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_billingCutsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$LimitNotificationsTable, List<LimitNotification>>
      _limitNotificationsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.limitNotifications,
              aliasName: $_aliasNameGenerator(
                  db.projects.id, db.limitNotifications.projectId));

  $$LimitNotificationsTableProcessedTableManager get limitNotificationsRefs {
    final manager =
        $$LimitNotificationsTableTableManager($_db, $_db.limitNotifications)
            .filter((f) => f.projectId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_limitNotificationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get hourlyRate => $composableBuilder(
      column: $table.hourlyRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get monthlyHourLimit => $composableBuilder(
      column: $table.monthlyHourLimit,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get accentColor => $composableBuilder(
      column: $table.accentColor, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> timeEntriesRefs(
      Expression<bool> Function($$TimeEntriesTableFilterComposer f) f) {
    final $$TimeEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.timeEntries,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeEntriesTableFilterComposer(
              $db: $db,
              $table: $db.timeEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> billingCutsRefs(
      Expression<bool> Function($$BillingCutsTableFilterComposer f) f) {
    final $$BillingCutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.billingCuts,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BillingCutsTableFilterComposer(
              $db: $db,
              $table: $db.billingCuts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> limitNotificationsRefs(
      Expression<bool> Function($$LimitNotificationsTableFilterComposer f) f) {
    final $$LimitNotificationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.limitNotifications,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LimitNotificationsTableFilterComposer(
              $db: $db,
              $table: $db.limitNotifications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get hourlyRate => $composableBuilder(
      column: $table.hourlyRate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get monthlyHourLimit => $composableBuilder(
      column: $table.monthlyHourLimit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get accentColor => $composableBuilder(
      column: $table.accentColor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get hourlyRate => $composableBuilder(
      column: $table.hourlyRate, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode, builder: (column) => column);

  GeneratedColumn<double> get monthlyHourLimit => $composableBuilder(
      column: $table.monthlyHourLimit, builder: (column) => column);

  GeneratedColumn<int> get accentColor => $composableBuilder(
      column: $table.accentColor, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> timeEntriesRefs<T extends Object>(
      Expression<T> Function($$TimeEntriesTableAnnotationComposer a) f) {
    final $$TimeEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.timeEntries,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.timeEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> billingCutsRefs<T extends Object>(
      Expression<T> Function($$BillingCutsTableAnnotationComposer a) f) {
    final $$BillingCutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.billingCuts,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BillingCutsTableAnnotationComposer(
              $db: $db,
              $table: $db.billingCuts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> limitNotificationsRefs<T extends Object>(
      Expression<T> Function($$LimitNotificationsTableAnnotationComposer a) f) {
    final $$LimitNotificationsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.limitNotifications,
            getReferencedColumn: (t) => t.projectId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$LimitNotificationsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.limitNotifications,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProjectsTable,
    Project,
    $$ProjectsTableFilterComposer,
    $$ProjectsTableOrderingComposer,
    $$ProjectsTableAnnotationComposer,
    $$ProjectsTableCreateCompanionBuilder,
    $$ProjectsTableUpdateCompanionBuilder,
    (Project, $$ProjectsTableReferences),
    Project,
    PrefetchHooks Function(
        {bool timeEntriesRefs,
        bool billingCutsRefs,
        bool limitNotificationsRefs})> {
  $$ProjectsTableTableManager(_$AppDatabase db, $ProjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> hourlyRate = const Value.absent(),
            Value<String> currencyCode = const Value.absent(),
            Value<double?> monthlyHourLimit = const Value.absent(),
            Value<int> accentColor = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProjectsCompanion(
            id: id,
            name: name,
            hourlyRate: hourlyRate,
            currencyCode: currencyCode,
            monthlyHourLimit: monthlyHourLimit,
            accentColor: accentColor,
            archived: archived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required double hourlyRate,
            Value<String> currencyCode = const Value.absent(),
            Value<double?> monthlyHourLimit = const Value.absent(),
            Value<int> accentColor = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              ProjectsCompanion.insert(
            id: id,
            name: name,
            hourlyRate: hourlyRate,
            currencyCode: currencyCode,
            monthlyHourLimit: monthlyHourLimit,
            accentColor: accentColor,
            archived: archived,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProjectsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {timeEntriesRefs = false,
              billingCutsRefs = false,
              limitNotificationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (timeEntriesRefs) db.timeEntries,
                if (billingCutsRefs) db.billingCuts,
                if (limitNotificationsRefs) db.limitNotifications
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (timeEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ProjectsTableReferences._timeEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProjectsTableReferences(db, table, p0)
                                .timeEntriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.projectId == item.id),
                        typedResults: items),
                  if (billingCutsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ProjectsTableReferences._billingCutsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProjectsTableReferences(db, table, p0)
                                .billingCutsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.projectId == item.id),
                        typedResults: items),
                  if (limitNotificationsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProjectsTableReferences
                            ._limitNotificationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProjectsTableReferences(db, table, p0)
                                .limitNotificationsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.projectId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProjectsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProjectsTable,
    Project,
    $$ProjectsTableFilterComposer,
    $$ProjectsTableOrderingComposer,
    $$ProjectsTableAnnotationComposer,
    $$ProjectsTableCreateCompanionBuilder,
    $$ProjectsTableUpdateCompanionBuilder,
    (Project, $$ProjectsTableReferences),
    Project,
    PrefetchHooks Function(
        {bool timeEntriesRefs,
        bool billingCutsRefs,
        bool limitNotificationsRefs})>;
typedef $$TimeEntriesTableCreateCompanionBuilder = TimeEntriesCompanion
    Function({
  Value<int> id,
  required int projectId,
  required DateTime date,
  required String concept,
  required int durationMinutes,
  Value<String?> notes,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$TimeEntriesTableUpdateCompanionBuilder = TimeEntriesCompanion
    Function({
  Value<int> id,
  Value<int> projectId,
  Value<DateTime> date,
  Value<String> concept,
  Value<int> durationMinutes,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$TimeEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $TimeEntriesTable, TimeEntry> {
  $$TimeEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias(
          $_aliasNameGenerator(db.timeEntries.projectId, db.projects.id));

  $$ProjectsTableProcessedTableManager get projectId {
    final manager = $$ProjectsTableTableManager($_db, $_db.projects)
        .filter((f) => f.id($_item.projectId));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TimeEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $TimeEntriesTable> {
  $$TimeEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get concept => $composableBuilder(
      column: $table.concept, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectsTableFilterComposer(
              $db: $db,
              $table: $db.projects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TimeEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TimeEntriesTable> {
  $$TimeEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get concept => $composableBuilder(
      column: $table.concept, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectsTableOrderingComposer(
              $db: $db,
              $table: $db.projects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TimeEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimeEntriesTable> {
  $$TimeEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get concept =>
      $composableBuilder(column: $table.concept, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectsTableAnnotationComposer(
              $db: $db,
              $table: $db.projects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TimeEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TimeEntriesTable,
    TimeEntry,
    $$TimeEntriesTableFilterComposer,
    $$TimeEntriesTableOrderingComposer,
    $$TimeEntriesTableAnnotationComposer,
    $$TimeEntriesTableCreateCompanionBuilder,
    $$TimeEntriesTableUpdateCompanionBuilder,
    (TimeEntry, $$TimeEntriesTableReferences),
    TimeEntry,
    PrefetchHooks Function({bool projectId})> {
  $$TimeEntriesTableTableManager(_$AppDatabase db, $TimeEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimeEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimeEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimeEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> projectId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> concept = const Value.absent(),
            Value<int> durationMinutes = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TimeEntriesCompanion(
            id: id,
            projectId: projectId,
            date: date,
            concept: concept,
            durationMinutes: durationMinutes,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int projectId,
            required DateTime date,
            required String concept,
            required int durationMinutes,
            Value<String?> notes = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              TimeEntriesCompanion.insert(
            id: id,
            projectId: projectId,
            date: date,
            concept: concept,
            durationMinutes: durationMinutes,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TimeEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (projectId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.projectId,
                    referencedTable:
                        $$TimeEntriesTableReferences._projectIdTable(db),
                    referencedColumn:
                        $$TimeEntriesTableReferences._projectIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TimeEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TimeEntriesTable,
    TimeEntry,
    $$TimeEntriesTableFilterComposer,
    $$TimeEntriesTableOrderingComposer,
    $$TimeEntriesTableAnnotationComposer,
    $$TimeEntriesTableCreateCompanionBuilder,
    $$TimeEntriesTableUpdateCompanionBuilder,
    (TimeEntry, $$TimeEntriesTableReferences),
    TimeEntry,
    PrefetchHooks Function({bool projectId})>;
typedef $$BillingCutsTableCreateCompanionBuilder = BillingCutsCompanion
    Function({
  Value<int> id,
  required int projectId,
  required PeriodType periodType,
  required DateTime startDate,
  required DateTime endDate,
  Value<CutStatus> status,
  required int totalMinutes,
  required double totalAmount,
  Value<DateTime?> paidAt,
  required DateTime createdAt,
});
typedef $$BillingCutsTableUpdateCompanionBuilder = BillingCutsCompanion
    Function({
  Value<int> id,
  Value<int> projectId,
  Value<PeriodType> periodType,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<CutStatus> status,
  Value<int> totalMinutes,
  Value<double> totalAmount,
  Value<DateTime?> paidAt,
  Value<DateTime> createdAt,
});

final class $$BillingCutsTableReferences
    extends BaseReferences<_$AppDatabase, $BillingCutsTable, BillingCut> {
  $$BillingCutsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias(
          $_aliasNameGenerator(db.billingCuts.projectId, db.projects.id));

  $$ProjectsTableProcessedTableManager get projectId {
    final manager = $$ProjectsTableTableManager($_db, $_db.projects)
        .filter((f) => f.id($_item.projectId));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BillingCutsTableFilterComposer
    extends Composer<_$AppDatabase, $BillingCutsTable> {
  $$BillingCutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<PeriodType, PeriodType, String>
      get periodType => $composableBuilder(
          column: $table.periodType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<CutStatus, CutStatus, String> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get totalMinutes => $composableBuilder(
      column: $table.totalMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paidAt => $composableBuilder(
      column: $table.paidAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectsTableFilterComposer(
              $db: $db,
              $table: $db.projects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BillingCutsTableOrderingComposer
    extends Composer<_$AppDatabase, $BillingCutsTable> {
  $$BillingCutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get periodType => $composableBuilder(
      column: $table.periodType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalMinutes => $composableBuilder(
      column: $table.totalMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paidAt => $composableBuilder(
      column: $table.paidAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectsTableOrderingComposer(
              $db: $db,
              $table: $db.projects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BillingCutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BillingCutsTable> {
  $$BillingCutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PeriodType, String> get periodType =>
      $composableBuilder(
          column: $table.periodType, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CutStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get totalMinutes => $composableBuilder(
      column: $table.totalMinutes, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get paidAt =>
      $composableBuilder(column: $table.paidAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectsTableAnnotationComposer(
              $db: $db,
              $table: $db.projects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BillingCutsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BillingCutsTable,
    BillingCut,
    $$BillingCutsTableFilterComposer,
    $$BillingCutsTableOrderingComposer,
    $$BillingCutsTableAnnotationComposer,
    $$BillingCutsTableCreateCompanionBuilder,
    $$BillingCutsTableUpdateCompanionBuilder,
    (BillingCut, $$BillingCutsTableReferences),
    BillingCut,
    PrefetchHooks Function({bool projectId})> {
  $$BillingCutsTableTableManager(_$AppDatabase db, $BillingCutsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BillingCutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BillingCutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BillingCutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> projectId = const Value.absent(),
            Value<PeriodType> periodType = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<CutStatus> status = const Value.absent(),
            Value<int> totalMinutes = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<DateTime?> paidAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              BillingCutsCompanion(
            id: id,
            projectId: projectId,
            periodType: periodType,
            startDate: startDate,
            endDate: endDate,
            status: status,
            totalMinutes: totalMinutes,
            totalAmount: totalAmount,
            paidAt: paidAt,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int projectId,
            required PeriodType periodType,
            required DateTime startDate,
            required DateTime endDate,
            Value<CutStatus> status = const Value.absent(),
            required int totalMinutes,
            required double totalAmount,
            Value<DateTime?> paidAt = const Value.absent(),
            required DateTime createdAt,
          }) =>
              BillingCutsCompanion.insert(
            id: id,
            projectId: projectId,
            periodType: periodType,
            startDate: startDate,
            endDate: endDate,
            status: status,
            totalMinutes: totalMinutes,
            totalAmount: totalAmount,
            paidAt: paidAt,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BillingCutsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (projectId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.projectId,
                    referencedTable:
                        $$BillingCutsTableReferences._projectIdTable(db),
                    referencedColumn:
                        $$BillingCutsTableReferences._projectIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BillingCutsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BillingCutsTable,
    BillingCut,
    $$BillingCutsTableFilterComposer,
    $$BillingCutsTableOrderingComposer,
    $$BillingCutsTableAnnotationComposer,
    $$BillingCutsTableCreateCompanionBuilder,
    $$BillingCutsTableUpdateCompanionBuilder,
    (BillingCut, $$BillingCutsTableReferences),
    BillingCut,
    PrefetchHooks Function({bool projectId})>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<String> defaultCurrency,
  Value<String> locale,
  Value<int> weekStartsOn,
  Value<int> notifyAtPercent,
  Value<bool> driveBackupEnabled,
  Value<DateTime?> lastBackupAt,
  Value<String> themeTone,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<String> defaultCurrency,
  Value<String> locale,
  Value<int> weekStartsOn,
  Value<int> notifyAtPercent,
  Value<bool> driveBackupEnabled,
  Value<DateTime?> lastBackupAt,
  Value<String> themeTone,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get defaultCurrency => $composableBuilder(
      column: $table.defaultCurrency,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get weekStartsOn => $composableBuilder(
      column: $table.weekStartsOn, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get notifyAtPercent => $composableBuilder(
      column: $table.notifyAtPercent,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get driveBackupEnabled => $composableBuilder(
      column: $table.driveBackupEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastBackupAt => $composableBuilder(
      column: $table.lastBackupAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get themeTone => $composableBuilder(
      column: $table.themeTone, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get defaultCurrency => $composableBuilder(
      column: $table.defaultCurrency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get weekStartsOn => $composableBuilder(
      column: $table.weekStartsOn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get notifyAtPercent => $composableBuilder(
      column: $table.notifyAtPercent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get driveBackupEnabled => $composableBuilder(
      column: $table.driveBackupEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastBackupAt => $composableBuilder(
      column: $table.lastBackupAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get themeTone => $composableBuilder(
      column: $table.themeTone, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get defaultCurrency => $composableBuilder(
      column: $table.defaultCurrency, builder: (column) => column);

  GeneratedColumn<String> get locale =>
      $composableBuilder(column: $table.locale, builder: (column) => column);

  GeneratedColumn<int> get weekStartsOn => $composableBuilder(
      column: $table.weekStartsOn, builder: (column) => column);

  GeneratedColumn<int> get notifyAtPercent => $composableBuilder(
      column: $table.notifyAtPercent, builder: (column) => column);

  GeneratedColumn<bool> get driveBackupEnabled => $composableBuilder(
      column: $table.driveBackupEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get lastBackupAt => $composableBuilder(
      column: $table.lastBackupAt, builder: (column) => column);

  GeneratedColumn<String> get themeTone =>
      $composableBuilder(column: $table.themeTone, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> defaultCurrency = const Value.absent(),
            Value<String> locale = const Value.absent(),
            Value<int> weekStartsOn = const Value.absent(),
            Value<int> notifyAtPercent = const Value.absent(),
            Value<bool> driveBackupEnabled = const Value.absent(),
            Value<DateTime?> lastBackupAt = const Value.absent(),
            Value<String> themeTone = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            id: id,
            defaultCurrency: defaultCurrency,
            locale: locale,
            weekStartsOn: weekStartsOn,
            notifyAtPercent: notifyAtPercent,
            driveBackupEnabled: driveBackupEnabled,
            lastBackupAt: lastBackupAt,
            themeTone: themeTone,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> defaultCurrency = const Value.absent(),
            Value<String> locale = const Value.absent(),
            Value<int> weekStartsOn = const Value.absent(),
            Value<int> notifyAtPercent = const Value.absent(),
            Value<bool> driveBackupEnabled = const Value.absent(),
            Value<DateTime?> lastBackupAt = const Value.absent(),
            Value<String> themeTone = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            id: id,
            defaultCurrency: defaultCurrency,
            locale: locale,
            weekStartsOn: weekStartsOn,
            notifyAtPercent: notifyAtPercent,
            driveBackupEnabled: driveBackupEnabled,
            lastBackupAt: lastBackupAt,
            themeTone: themeTone,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;
typedef $$LimitNotificationsTableCreateCompanionBuilder
    = LimitNotificationsCompanion Function({
  Value<int> id,
  required int projectId,
  required String yearMonth,
  required int thresholdPercent,
  required DateTime notifiedAt,
});
typedef $$LimitNotificationsTableUpdateCompanionBuilder
    = LimitNotificationsCompanion Function({
  Value<int> id,
  Value<int> projectId,
  Value<String> yearMonth,
  Value<int> thresholdPercent,
  Value<DateTime> notifiedAt,
});

final class $$LimitNotificationsTableReferences extends BaseReferences<
    _$AppDatabase, $LimitNotificationsTable, LimitNotification> {
  $$LimitNotificationsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias($_aliasNameGenerator(
          db.limitNotifications.projectId, db.projects.id));

  $$ProjectsTableProcessedTableManager get projectId {
    final manager = $$ProjectsTableTableManager($_db, $_db.projects)
        .filter((f) => f.id($_item.projectId));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LimitNotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $LimitNotificationsTable> {
  $$LimitNotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get yearMonth => $composableBuilder(
      column: $table.yearMonth, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get thresholdPercent => $composableBuilder(
      column: $table.thresholdPercent,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get notifiedAt => $composableBuilder(
      column: $table.notifiedAt, builder: (column) => ColumnFilters(column));

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectsTableFilterComposer(
              $db: $db,
              $table: $db.projects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LimitNotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LimitNotificationsTable> {
  $$LimitNotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get yearMonth => $composableBuilder(
      column: $table.yearMonth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get thresholdPercent => $composableBuilder(
      column: $table.thresholdPercent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get notifiedAt => $composableBuilder(
      column: $table.notifiedAt, builder: (column) => ColumnOrderings(column));

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectsTableOrderingComposer(
              $db: $db,
              $table: $db.projects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LimitNotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LimitNotificationsTable> {
  $$LimitNotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get yearMonth =>
      $composableBuilder(column: $table.yearMonth, builder: (column) => column);

  GeneratedColumn<int> get thresholdPercent => $composableBuilder(
      column: $table.thresholdPercent, builder: (column) => column);

  GeneratedColumn<DateTime> get notifiedAt => $composableBuilder(
      column: $table.notifiedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectsTableAnnotationComposer(
              $db: $db,
              $table: $db.projects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LimitNotificationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LimitNotificationsTable,
    LimitNotification,
    $$LimitNotificationsTableFilterComposer,
    $$LimitNotificationsTableOrderingComposer,
    $$LimitNotificationsTableAnnotationComposer,
    $$LimitNotificationsTableCreateCompanionBuilder,
    $$LimitNotificationsTableUpdateCompanionBuilder,
    (LimitNotification, $$LimitNotificationsTableReferences),
    LimitNotification,
    PrefetchHooks Function({bool projectId})> {
  $$LimitNotificationsTableTableManager(
      _$AppDatabase db, $LimitNotificationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LimitNotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LimitNotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LimitNotificationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> projectId = const Value.absent(),
            Value<String> yearMonth = const Value.absent(),
            Value<int> thresholdPercent = const Value.absent(),
            Value<DateTime> notifiedAt = const Value.absent(),
          }) =>
              LimitNotificationsCompanion(
            id: id,
            projectId: projectId,
            yearMonth: yearMonth,
            thresholdPercent: thresholdPercent,
            notifiedAt: notifiedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int projectId,
            required String yearMonth,
            required int thresholdPercent,
            required DateTime notifiedAt,
          }) =>
              LimitNotificationsCompanion.insert(
            id: id,
            projectId: projectId,
            yearMonth: yearMonth,
            thresholdPercent: thresholdPercent,
            notifiedAt: notifiedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LimitNotificationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (projectId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.projectId,
                    referencedTable:
                        $$LimitNotificationsTableReferences._projectIdTable(db),
                    referencedColumn: $$LimitNotificationsTableReferences
                        ._projectIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$LimitNotificationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LimitNotificationsTable,
    LimitNotification,
    $$LimitNotificationsTableFilterComposer,
    $$LimitNotificationsTableOrderingComposer,
    $$LimitNotificationsTableAnnotationComposer,
    $$LimitNotificationsTableCreateCompanionBuilder,
    $$LimitNotificationsTableUpdateCompanionBuilder,
    (LimitNotification, $$LimitNotificationsTableReferences),
    LimitNotification,
    PrefetchHooks Function({bool projectId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$TimeEntriesTableTableManager get timeEntries =>
      $$TimeEntriesTableTableManager(_db, _db.timeEntries);
  $$BillingCutsTableTableManager get billingCuts =>
      $$BillingCutsTableTableManager(_db, _db.billingCuts);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$LimitNotificationsTableTableManager get limitNotifications =>
      $$LimitNotificationsTableTableManager(_db, _db.limitNotifications);
}
