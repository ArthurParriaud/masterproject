import 'package:flutter/material.dart';
import 'package:masterprojectfront/login_page.dart';
import 'package:masterprojectfront/recipe_style_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistant Alimentaire',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RecipeStylePage(),
    );
  }
}
