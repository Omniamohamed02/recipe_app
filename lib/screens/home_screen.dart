import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/cubit/recipe_cubit.dart';
import 'package:recipe_app/cubit/recipe_state.dart';
import 'package:recipe_app/screens/recipe_screen.dart';
import 'package:recipe_app/widgets/recipe_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFF57C00),
              Color(0xFFFF9800),
              Color(0xFFFFB74D),
            ],
                begin: Alignment.topLeft,
              end :Alignment.bottomRight,),
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
                  bottomRight:Radius.circular(30) ,
          )
          ),
        ),
        title: const Center(
          child: Text('Recipe App' ,
          style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
        ),
      ),
      body:  BlocBuilder<RecipeCubit,RecipeState>(
        builder: (context,state){
          if(state is RecipeLoading){
            return const Center(child: CircularProgressIndicator(color: Color(0xFFE23E3E),));
          }
          else if(state is RecipeErorr){
            return Center(child: Text(state.massage));
          }
          else if( state is RecipeLoaded){
          return ListView.builder(
              itemCount: state.recipe.length,
              itemBuilder: (context, index) {
                return RecipeWidget(
                  recipe: state.recipe[index],
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => RecipesScreen(recipe: state.recipe[index])));
                  },
                );
              });
        }
          else{
          return const Center(child: Text('No Recipes Found'));
      }}
      ),
    );
  }
}
