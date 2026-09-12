class UserInput {
    final double budget; //BUDGET FOR THE MEAL
    final String skillLevel; //SKILL LEVEL TO COOK
    final double timeToCook; //TIME TO COOK
    final int servings; //SERVINGS (1 serving = 1 adult meal)
    final List<String> ingredToInclude; //INGREDIENTS THAT SHOULD BE IN THE MEAL
    final List<String> ingredAtHome; //INGREDIENTS THAT THE USER ALREADY HAS, SHOULD BE IN THE MEAL

    UserInput({
      required this.budget,
      required this.skillLevel,
      required this.timeToCook,
      required this.servings,
      required this.ingredToInclude,
      required this.ingredAtHome
    });
}