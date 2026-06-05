import 'package:json_annotation/json_annotation.dart';

part 'app_model.g.dart';

@JsonSerializable()
class AppModel {
  final String name;
  final String subtitle;
  final String? iconUrl;
  final String? storeUrl;
  final String category;

  const AppModel({
    required this.name,
    required this.subtitle,
    this.iconUrl,
    this.storeUrl,
    this.category = 'App',
  });

  factory AppModel.fromJson(Map<String, dynamic> json) =>
      _$AppModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppModelToJson(this);
}
