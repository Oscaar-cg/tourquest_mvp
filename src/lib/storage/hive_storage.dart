import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_progress.dart';

class HiveStorage {
  static const String boxName = "tourquestBox";

  static late Box box;

  static Future<void> init() async {
    Hive.registerAdapter(UserProgressAdapter());
    box = await Hive.openBox(boxName);

    if (box.get('xp') == null) {
      saveProgress(UserProgress());
    }
  }

  static UserProgress loadProgress() {
    final xp = box.get('xp', defaultValue: 0);
    final completed = List<String>.from(box.get('completed', defaultValue: []));
    final photos = Map<String, String>.from(box.get('photos', defaultValue: {}));

    return UserProgress(
      xp: xp,
      completedChallenges: completed,
      photos: photos,
    );
  }

  static void saveProgress(UserProgress p) {
    box.put('xp', p.xp);
    box.put('completed', p.completedChallenges);
    box.put('photos', p.photos);
  }

  /// Reset progress
  static void reset() {
    final p = UserProgress(
      xp: 0,
      completedChallenges: [],
      photos: {},
    );
    saveProgress(p);
  }
}