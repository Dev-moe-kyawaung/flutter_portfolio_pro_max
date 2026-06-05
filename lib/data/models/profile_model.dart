import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final String name;
  final String role;
  final String location;
  final String? avatarUrl;
  final List<String> languages;

  const ProfileModel({
    required this.name,
    required this.role,
    required this.location,
    this.avatarUrl,
    this.languages = const [],
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
