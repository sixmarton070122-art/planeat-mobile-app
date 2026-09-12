class UserInput {
    final double budget;
    final String skillLevel;
    final double timeToCook;
    final int numberOfPeople;
    final List<String> ingredToInclude;
    final List<String> ingredAtHome;

    UserInput({
      required this.budget,
      required this.skillLevel,
      required this.timeToCook,
      required this.numberOfPeople,
      required this.ingredToInclude,
      required this.ingredAtHome
    });
}