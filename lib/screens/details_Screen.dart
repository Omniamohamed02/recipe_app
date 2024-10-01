import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.name),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE23E3E),
                    Color(0xFFFF6B6B),
                    Color(0xFFFFB3B3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
          ),
        ),
        body: ListView(children: [
          Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    recipe.image,
                  ),
                  Center(
                    child: Text(recipe.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                      child: Text('Ingredients',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  Text(
                    recipe.ingredients.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  Center(
                      child: Text('Instructions',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  Text(recipe.instructions.toString(),
                      style: TextStyle(fontSize: 16))
                ],
              )),
        ]));
  }
}
