import 'package:flutter/material.dart';

import '../model/recipe.dart';

class RecipeWidget extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  const RecipeWidget({super.key,required this.recipe,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: onTap,
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                       recipe.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ])),
            ),
            Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Text(
                        recipe.rating.toString(),
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )),
            Positioned(
              bottom: 15,
                right: 15,
                child: Text('${recipe.caloriesPerServing}Kcal',style: TextStyle(color: Colors.white),)),
            Positioned(
              bottom: 8,
                left:8 ,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                Text('${recipe.ingredients.length} ingredients',style: TextStyle(color: Colors.white),)
              ],
            )),
            Positioned(
              top: 5,
                right: 5,
                child: Icon(Icons.more_vert,color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
