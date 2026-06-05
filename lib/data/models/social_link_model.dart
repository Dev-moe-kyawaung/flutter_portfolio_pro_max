import 'package:json_annotation/json_annotation.dart';

part 'social_link_model.g.dart';

@JsonSerializable()
class SocialLinkModel {
  final String label;
  final String url;
  final String icon;

  const SocialLinkModel({
    required this.label,
    required this.url,
    required this.icon,
  });

  factory SocialLinkModel.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLinkModelToJson(this);
}
