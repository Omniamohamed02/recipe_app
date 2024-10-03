import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  final String name;
  final List<String> ingredients;
  final int caloriesPerServing;
  final double rating;
  final String image;
  final List<String> instructions;
  final String cuisine;
  final int cookTimeMinutes;



  Recipe( {
    required this.name,
    required this.ingredients,
    required this.caloriesPerServing,
    required this.rating,
    required this.image,
    required this.instructions,
    required this.cuisine,
    required this.cookTimeMinutes,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] as String,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((ingredient) => ingredient as String)
          .toList() ??
          [],
      caloriesPerServing: json['caloriesPerServing'] as int,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
      instructions: (json['instructions'] as List<dynamic>?)
          ?.map((instruction) => instruction as String)
          .toList() ??
          [], cuisine:json['cuisine'] as String, cookTimeMinutes: (json['cookTimeMinutes'] as num).toInt(),

    );
  }
}