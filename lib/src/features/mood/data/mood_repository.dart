import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mood_database.dart';

// The repository depends on the database
final moodRepositoryProvider = Provider<MoodRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return MoodRepository(db);
});

class MoodRepository {
  final AppDatabase _db;
  MoodRepository(this._db);

  Future<void> addMood(int moodIndex, String? description) async {
    await _db.into(_db.moodEntries).insert(MoodEntriesCompanion.insert(
      moodIndex: moodIndex,
      description: Value(description),
      timestamp: DateTime.now(),
    ));
  }
}
