import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

part 'mood_database.g.dart'; // Generator will create this

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Define the table (Schema)
class MoodEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get moodIndex => integer()(); // Store enum as int
  TextColumn get description =>
      text().withLength(min: 0, max: 255).nullable()();
  DateTimeColumn get timestamp => dateTime()();
}

// Define the Database
@DriftDatabase(tables: [MoodEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// Windows-friendly connection opener
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final moodFlowFolder = Directory(path.join(dbFolder.path, 'MoodFlow'));

    // Create the MoodFlow directory if it doesn't exist
    if (!await moodFlowFolder.exists()) {
      await moodFlowFolder.create(recursive: true);
    }

    final file = File(path.join(moodFlowFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
