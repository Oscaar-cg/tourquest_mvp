import 'package:hive/hive.dart';

part 'user_progress.g.dart';

@HiveType(typeId: 1)
class UserProgress {
  @HiveField(0)
  int xp;

  @HiveField(1)
  List<String> completedChallenges;

  @HiveField(2)
  Map<String, String> photos;

  UserProgress({
    this.xp = 0,
    List<String>? completedChallenges,
    Map<String, String>? photos,
  })  : completedChallenges = completedChallenges ?? [],
        photos = photos ?? {};
}