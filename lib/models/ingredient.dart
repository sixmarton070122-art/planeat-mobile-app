class Ingredient {
  final String name; //Ingredient name
  final String amount; //Amount to be used
  final double cost; //Cost of ingredient
  final bool has;

  Ingredient({
    required this.name,
    required this.amount,
    required this.cost,
    required this.has,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      amount: json['amount'],
      cost: json['cost'],
      has: json['has'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'amount': amount,
    'cost': cost,
    'has': has
  };
}