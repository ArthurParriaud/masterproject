import 'package:flutter/material.dart';
import 'package:masterprojectfront/my_text_field.dart';
import 'package:masterprojectfront/registration_page.dart';
import 'package:masterprojectfront/restriction_picker.dart';

import 'button_widget.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{


  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  bool usernameHasError = false;
  bool passwordHasError = false;
  String errorMessage = "";

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.width*0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Welcome ! Log in or create an account !",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800
              ),
            ),
            MyTextField(textEditingController: usernameEditingController, hintText: "username", hasError: usernameHasError),
            MyTextField(textEditingController: passwordEditingController, hintText: "password", hasError: passwordHasError, passwordField: true),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.4,
              child: MyTextButton(
                text: "Log In",
                onPressed: () async {

                  usernameHasError = false;
                  passwordHasError = false;
                  errorMessage = "";

                  if (usernameEditingController.text == ""){
                    usernameHasError = true;
                    errorMessage += "- username is empty !\n";
                  }

                  if (passwordEditingController.text == ""){
                    passwordHasError = true;
                    errorMessage += "- password is empty !\n";
                  }

                  if (usernameHasError || passwordHasError){
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
                      MaterialPageRoute(builder: (context) => const RestrictionPicker())
                    );
                  }


                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationPage())
                );
              },
              child: const Text(
                "Create an account",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}