import 'package:hive/hive.dart';
part 'sepha_model.g.dart';

@HiveType(typeId: 2)
class SebhaModel extends HiveObject {
  @HiveField(0)
  String content;
  @HiveField(1)
  int count;
  @HiveField(3)
  String id;

  SebhaModel({required this.content, required this.count, required this.id});
}
