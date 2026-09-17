import 'package:hive_ce_flutter/hive_flutter.dart';
part 'ingredient.g.dart';

@HiveType(typeId: 1)
class Ingredient {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String amount;

  @HiveField(2)
  final double cost;

  @HiveField(3)
  final bool has;

  Ingredient({
    required this.name,
    required this.amount,
    required this.cost,
    required this.has,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String,
      amount: json['amount'] as String,
      cost: json['cost'] as double,
      has: json['has'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'amount': amount,
    'cost': cost,
    'has': has,
  };
}
