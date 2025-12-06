import 'package:hive/hive.dart';

part 'challenge.g.dart';

@HiveType(typeId: 2)
class Challenge {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String icon;

  @HiveField(4)
  String difficulty;

  @HiveField(5)
  bool completed;

  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.difficulty,
    this.completed = false,
  });
}