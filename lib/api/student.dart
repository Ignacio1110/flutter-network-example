import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  String? id;
  String? name;
  String? avatar;
  String? createdAt;

  Student({this.id, this.name, this.avatar, this.createdAt});

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);

  @override
  String toString() {
    return "${this.toJson()}";
  }
}
