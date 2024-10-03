import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe.dart';

class RecipesScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipesScreen({super.key, required this.recipe,});

  @override
  Widget build(BuildContext context) {
    List<String> ingredients = recipe.ingredients;
    List<String> instructions = recipe.instructions;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child:  Container(
                    height: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(recipe.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.width - 50,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(recipe.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                   Row(
                    children: [
                      const Icon(Icons.timer, color: Colors.grey, size: 20),
                      Text('${recipe.cookTimeMinutes.toString()} Min', style:const TextStyle(color: Colors.grey, fontSize: 16)),
                      const  SizedBox(width: 30),
                      const Icon(Icons.restaurant, color: Colors.grey, size: 18),
                      Text(recipe.cuisine, style:const TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text('Ingredients:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                   ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) {
                        final ingredient = ingredients[index];
                        return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            elevation: 2.0,
                            shadowColor: Colors.grey[700],
                            child:ListTile(
                              title: Text(ingredient),
                              leading:const  Icon(Icons.shopping_cart),
                            ));
                      },
                    ),

                  const  SizedBox(height: 10,),
                  const  Text('Instructions:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ListView.builder(
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount: instructions.length,
                      itemBuilder: (context, index) {
                        final instruction = instructions[index];
                        return Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 2.0,
                          shadowColor: Colors.grey[700],
                          child: ListTile(
                            title: Text(instruction),
                            leading: const Icon(Icons.outdoor_grill),
                          ),
                        );
                      },
                    ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
