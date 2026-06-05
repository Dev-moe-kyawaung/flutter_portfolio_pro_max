import 'package:json_annotation/json_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  final String title;
  final String description;
  final List<String> tags;
  final String demoUrl;
  final String sourceUrl;
  final String? imageUrl;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    this.demoUrl = '',
    this.sourceUrl = '',
    this.imageUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
