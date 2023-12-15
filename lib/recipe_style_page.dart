import 'package:flutter/material.dart';
import 'package:masterprojectfront/my_dropdown_button.dart';

class RecipeStylePage extends StatefulWidget {

  const RecipeStylePage({super.key});

  @override
  State<RecipeStylePage> createState() => RecipeStylePageState();
}

class RecipeStylePageState extends State<RecipeStylePage>{

  String? selectedDiet;
  bool dietHasError = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.width*0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MyDropdownButton(
                hint: "Select",
                items: const [
                  "Diabete",
                  "Surpoid",
                  "Mélenchon"
                ],
                selectedItem: selectedDiet,
                hasError: dietHasError,
              ),
            )
          ],
        ),
      ),
    );
  }
}