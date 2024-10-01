import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/cubit/recipe_state.dart';
import 'package:recipe_app/services/recipe_service.dart';

import '../model/recipe.dart';

class RecipeCubit extends Cubit<RecipeState>{
  RecipeCubit(): super(RecipeInitial()){
 getRecipe();
  }
    final RecipeService recipeService=RecipeService();
    void getRecipe () async{
      emit(RecipeLoading());
      try {
        final result = await recipeService.getRecipe();
        emit(RecipeLoaded(recipe: result));
      }
            catch(e){
              emit(RecipeErorr(massage: e.toString()));
            }
      }
    }
