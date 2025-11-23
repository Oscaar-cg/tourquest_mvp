// This file handles all the local storage using Hive.
// I keep it simple for the MVP: only XP + completed challenges.
//
// Later you can replace Hive with Firebase if you want online sync.

import 'package:hive/hive.dart';
import '../models/user_progress.dart';

class HiveStorage {
  static late Box _box;   // Hive box that stores the progress data

  // Called when the app starts (in main.dart)
  static Future init() async {
    _box = await Hive.openBox('progressBox');
  }

  // Load saved progress from Hive
  static UserProgress loadProgress() {
    int xp = _box.get('xp', defaultValue: 0); // Load XP (0 if no data yet)
    List<String> completed = List<String>.from(
      _box.get('completedChallenges', defaultValue: []),
    );

    return UserProgress(
      xp: xp,
      completedChallenges: completed,
    );
  }

  // Save updated progress to Hive
  static void saveProgress(UserProgress progress) {
    _box.put('xp', progress.xp);                           // Save XP
    _box.put('completedChallenges', progress.completedChallenges); // Save completed list
  }
}