import 'package:hive_ce_flutter/hive_ce_flutter.dart';
part 'cooking_step.g.dart';

@HiveType(typeId: 2)
class CookingStep {
  @HiveField(0)
  final String description;

  @HiveField(1)
  bool isDone;

  CookingStep({
    required this.description,
    this.isDone = false,
  });

  factory CookingStep.fromJson(Map<String, dynamic> json) {
    return CookingStep(
      description: json['description'] as String,
      isDone: json['isDone'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'description': description,
    'isDone': isDone,
  };
}