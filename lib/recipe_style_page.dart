import 'package:flutter/material.dart';

class RecipeStylePage extends StatefulWidget {

  const RecipeStylePage({super.key});

  @override
  State<RecipeStylePage> createState() => RecipeStylePageState();
}

class RecipeStylePageState extends State<RecipeStylePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.width*0.01),
        child: SizedBox(),
      ),
    );
  }
}