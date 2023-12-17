import 'package:flutter/material.dart';
import 'package:masterprojectfront/button_widget.dart';
import 'package:masterprojectfront/recipe_style_page.dart';

import 'my_text_field.dart';

class RegistrationPage extends StatefulWidget {

  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage>{


  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPwEditingController = TextEditingController();

  bool firstNameHasError = false;
  bool lastNameHasError = false;
  bool usernameHasError = false;
  bool passwordHasError = false;
  bool confirmPwHasError = false;
  String errorMessage = "";

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: Text('back'),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.width*0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Registration",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("First Name :"),
                SizedBox(width: MediaQuery.of(context).size.width*0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: MyTextField(textEditingController: firstNameEditingController, hasError: firstNameHasError),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Last Name :"),
                SizedBox(width: MediaQuery.of(context).size.width*0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: MyTextField(textEditingController: lastNameEditingController, hasError: lastNameHasError),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Username :"),
                SizedBox(width: MediaQuery.of(context).size.width*0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: MyTextField(textEditingController: usernameEditingController, hasError: usernameHasError),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Password :"),
                SizedBox(width: MediaQuery.of(context).size.width*0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: MyTextField(textEditingController: passwordEditingController, hasError: passwordHasError, passwordField: true),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Confirm Password :"),
                SizedBox(width: MediaQuery.of(context).size.width*0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: MyTextField(textEditingController: confirmPwEditingController, hasError: confirmPwHasError, passwordField: true),
                )
              ],
            ),
            MyTextButton(text: "Create my account", onPressed: () async {

              firstNameHasError = false;
              lastNameHasError = false;
              usernameHasError = false;
              passwordHasError = false;
              confirmPwHasError = false;
              errorMessage = "";

              setState(() {
                if (firstNameEditingController.text == "" || RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9 ]').hasMatch(firstNameEditingController.text)){
                  firstNameHasError = true;
                  errorMessage += "- invalid first name.\n";
                }
                if (lastNameEditingController.text == "" || RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9 ]').hasMatch(lastNameEditingController.text)){
                  lastNameHasError = true;
                  errorMessage += "- invalid last name.\n";
                }
                if (usernameEditingController.text == "" || RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^% ]').hasMatch(usernameEditingController.text)){
                  usernameHasError = true;
                  errorMessage += "- invalid username.\n";
                }
                if (passwordEditingController.text == ""){
                  passwordHasError = true;
                  errorMessage += "- invalid password.\n";
                }
                if (confirmPwEditingController.text == ""){
                  confirmPwHasError = true;
                  errorMessage += "- invalid confirm password.\n";
                }
                if (passwordEditingController.text != confirmPwEditingController.text){
                  passwordHasError = true;
                  confirmPwHasError = true;
                  errorMessage += "- different passwords";
                }
              });

              if (firstNameHasError || lastNameHasError || usernameHasError || passwordHasError || confirmPwHasError){
                if (mounted){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: const Text('Error'),
                      content: Text(errorMessage),
                      actions: <Widget>[
                        TextButton(child: const Text('Close'),onPressed: () {
                          Navigator.of(context).pop();
                        },)
                      ],
                    );
                  });
                }
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const RecipeStylePage())
                );
              }

            })
          ],
        )
      ),
    );
  }
}