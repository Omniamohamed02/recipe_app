
import 'package:recipe_app/model/recipe.dart';

abstract class RecipeState{
}

class RecipeInitial extends RecipeState{}
class RecipeLoading extends RecipeState{}
class RecipeLoaded extends RecipeState{
  final List<Recipe>recipe;

  RecipeLoaded({ required this.recipe});
}
class RecipeErorr extends RecipeState{
  final String massage;

  RecipeErorr({required this.massage});

}