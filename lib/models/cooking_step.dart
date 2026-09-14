class CookingStep {
  final String description;
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