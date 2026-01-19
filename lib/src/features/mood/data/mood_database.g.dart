// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_database.dart';

// ignore_for_file: type=lint
class $MoodEntriesTable extends MoodEntries
    with TableInfo<$MoodEntriesTable, MoodEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoodEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _moodIndexMeta =
      const VerificationMeta('moodIndex');
  @override
  late final GeneratedColumn<int> moodIndex = GeneratedColumn<int>(
      'mood_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, moodIndex, description, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mood_entries';
  @override
  VerificationContext validateIntegrity(Insertable<MoodEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mood_index')) {
      context.handle(_moodIndexMeta,
          moodIndex.isAcceptableOrUnknown(data['mood_index']!, _moodIndexMeta));
    } else if (isInserting) {
      context.missing(_moodIndexMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoodEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoodEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      moodIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mood_index'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $MoodEntriesTable createAlias(String alias) {
    return $MoodEntriesTable(attachedDatabase, alias);
  }
}

class MoodEntry extends DataClass implements Insertable<MoodEntry> {
  final int id;
  final int moodIndex;
  final String? description;
  final DateTime timestamp;
  const MoodEntry(
      {required this.id,
      required this.moodIndex,
      this.description,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mood_index'] = Variable<int>(moodIndex);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  MoodEntriesCompanion toCompanion(bool nullToAbsent) {
    return MoodEntriesCompanion(
      id: Value(id),
      moodIndex: Value(moodIndex),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      timestamp: Value(timestamp),
    );
  }

  factory MoodEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoodEntry(
      id: serializer.fromJson<int>(json['id']),
      moodIndex: serializer.fromJson<int>(json['moodIndex']),
      description: serializer.fromJson<String?>(json['description']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'moodIndex': serializer.toJson<int>(moodIndex),
      'description': serializer.toJson<String?>(description),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  MoodEntry copyWith(
          {int? id,
          int? moodIndex,
          Value<String?> description = const Value.absent(),
          DateTime? timestamp}) =>
      MoodEntry(
        id: id ?? this.id,
        moodIndex: moodIndex ?? this.moodIndex,
        description: description.present ? description.value : this.description,
        timestamp: timestamp ?? this.timestamp,
      );
  MoodEntry copyWithCompanion(MoodEntriesCompanion data) {
    return MoodEntry(
      id: data.id.present ? data.id.value : this.id,
      moodIndex: data.moodIndex.present ? data.moodIndex.value : this.moodIndex,
      description:
          data.description.present ? data.description.value : this.description,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MoodEntry(')
          ..write('id: $id, ')
          ..write('moodIndex: $moodIndex, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, moodIndex, description, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoodEntry &&
          other.id == this.id &&
          other.moodIndex == this.moodIndex &&
          other.description == this.description &&
          other.timestamp == this.timestamp);
}

class MoodEntriesCompanion extends UpdateCompanion<MoodEntry> {
  final Value<int> id;
  final Value<int> moodIndex;
  final Value<String?> description;
  final Value<DateTime> timestamp;
  const MoodEntriesCompanion({
    this.id = const Value.absent(),
    this.moodIndex = const Value.absent(),
    this.description = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  MoodEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int moodIndex,
    this.description = const Value.absent(),
    required DateTime timestamp,
  })  : moodIndex = Value(moodIndex),
        timestamp = Value(timestamp);
  static Insertable<MoodEntry> custom({
    Expression<int>? id,
    Expression<int>? moodIndex,
    Expression<String>? description,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (moodIndex != null) 'mood_index': moodIndex,
      if (description != null) 'description': description,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  MoodEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? moodIndex,
      Value<String?>? description,
      Value<DateTime>? timestamp}) {
    return MoodEntriesCompanion(
      id: id ?? this.id,
      moodIndex: moodIndex ?? this.moodIndex,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (moodIndex.present) {
      map['mood_index'] = Variable<int>(moodIndex.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoodEntriesCompanion(')
          ..write('id: $id, ')
          ..write('moodIndex: $moodIndex, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MoodEntriesTable moodEntries = $MoodEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moodEntries];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$MoodEntriesTableCreateCompanionBuilder = MoodEntriesCompanion
    Function({
  Value<int> id,
  required int moodIndex,
  Value<String?> description,
  required DateTime timestamp,
});
typedef $$MoodEntriesTableUpdateCompanionBuilder = MoodEntriesCompanion
    Function({
  Value<int> id,
  Value<int> moodIndex,
  Value<String?> description,
  Value<DateTime> timestamp,
});

class $$MoodEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $MoodEntriesTable> {
  $$MoodEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get moodIndex => $composableBuilder(
      column: $table.moodIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));
}

class $$MoodEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MoodEntriesTable> {
  $$MoodEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get moodIndex => $composableBuilder(
      column: $table.moodIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));
}

class $$MoodEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MoodEntriesTable> {
  $$MoodEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get moodIndex =>
      $composableBuilder(column: $table.moodIndex, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$MoodEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MoodEntriesTable,
    MoodEntry,
    $$MoodEntriesTableFilterComposer,
    $$MoodEntriesTableOrderingComposer,
    $$MoodEntriesTableAnnotationComposer,
    $$MoodEntriesTableCreateCompanionBuilder,
    $$MoodEntriesTableUpdateCompanionBuilder,
    (MoodEntry, BaseReferences<_$AppDatabase, $MoodEntriesTable, MoodEntry>),
    MoodEntry,
    PrefetchHooks Function()> {
  $$MoodEntriesTableTableManager(_$AppDatabase db, $MoodEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MoodEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MoodEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MoodEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> moodIndex = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              MoodEntriesCompanion(
            id: id,
            moodIndex: moodIndex,
            description: description,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int moodIndex,
            Value<String?> description = const Value.absent(),
            required DateTime timestamp,
          }) =>
              MoodEntriesCompanion.insert(
            id: id,
            moodIndex: moodIndex,
            description: description,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MoodEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MoodEntriesTable,
    MoodEntry,
    $$MoodEntriesTableFilterComposer,
    $$MoodEntriesTableOrderingComposer,
    $$MoodEntriesTableAnnotationComposer,
    $$MoodEntriesTableCreateCompanionBuilder,
    $$MoodEntriesTableUpdateCompanionBuilder,
    (MoodEntry, BaseReferences<_$AppDatabase, $MoodEntriesTable, MoodEntry>),
    MoodEntry,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MoodEntriesTableTableManager get moodEntries =>
      $$MoodEntriesTableTableManager(_db, _db.moodEntries);
}
