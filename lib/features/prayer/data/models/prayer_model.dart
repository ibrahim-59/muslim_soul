import 'package:hive/hive.dart';
part 'prayer_model.g.dart';

@HiveType(typeId: 1)
class PrayerModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String cacheKey;
  @HiveField(4)
  final int id;

  PrayerModel(
      {required this.id,
      required this.cacheKey,
      required this.name,
      required this.time,
      required this.image});
}
