import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:recipe_app/model/recipe.dart';

class RecipeService {
  final _dio = Dio();

  Future<List<Recipe>> getRecipe() async {
    final response = await _dio.get('https://dummyjson.com/recipes');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> recipeJson = jsonData['recipes'];
    List<Recipe> recipes = recipeJson
        .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
        .toList();
    return recipes;
  }
}
