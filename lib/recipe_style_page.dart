import 'package:flutter/material.dart';
import 'package:masterprojectfront/button_widget.dart';
import 'package:masterprojectfront/my_dropdown_button.dart';
import 'package:masterprojectfront/restriction_picker.dart';
import 'package:masterprojectfront/space_widget.dart';

import 'my_text_field.dart';

class RecipeStylePage extends StatefulWidget {

  const RecipeStylePage({super.key});

  @override
  State<RecipeStylePage> createState() => RecipeStylePageState();
}

class RecipeStylePageState extends State<RecipeStylePage>{

  String? selectedDiet;
  bool dietHasError = false;
  TextEditingController lovedIngController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.width*0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "What kind of recipes are you searching for?",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800
              ),
            ),
            MySpaceWidget(percentage: 0.05, pageContext: context),
            const Text(
              "Diet",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),
            ),
            MySpaceWidget(percentage: 0.02, pageContext: context),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MyDropdownButton(
                hint: "Select",
                items: const [
                  "Diabetic",
                  "Low cholesterol",
                  "Weight-loss",
                  "Low sodium",
                  "Pregnant"
                ],
                selectedItem: selectedDiet,
                hasError: dietHasError,
              ),
            ),
            MySpaceWidget(percentage: 0.05, pageContext: context),
            const Text(
              "Loved Ingredients",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),
            ),
            MySpaceWidget(percentage: 0.02, pageContext: context),
            MyTextField(textEditingController: lovedIngController, hintText: "Write here some ingredients you are enjoying", hasError: false),
            MySpaceWidget(percentage: 0.05, pageContext: context),
            MyTextButton(text: "Add nutritional restriction", onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RestrictionPicker())
              );
            }),
            MySpaceWidget(percentage: 0.2, pageContext: context),
            MyTextButton(text: "Search Recipes", onPressed: () async {})
          ],
        ),
      ),
    );
  }
}