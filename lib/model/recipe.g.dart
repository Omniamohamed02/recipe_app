// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      name: json['name'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      caloriesPerServing: (json['caloriesPerServing'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String, instructions: (json['ingredients'] as List<dynamic>)
    .map((e) => e as String)
    .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'name': instance.name,
      'ingredients': instance.ingredients,
      'caloriesPerServing': instance.caloriesPerServing,
      'rating': instance.rating,
      'image': instance.image,
    };
