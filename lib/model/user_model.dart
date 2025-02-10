import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)  // Unique ID for Hive
class UserModel extends HiveObject {
  @HiveField(0)
  String username;

  @HiveField(1)
  String password;  // Ideally, use encryption for security

  UserModel({required this.username, required this.password});
}
