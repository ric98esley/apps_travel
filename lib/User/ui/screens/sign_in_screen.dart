import 'package:flutter/material.dart';
import 'package:trips_app/widgets/button_green.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:auth_buttons/auth_buttons.dart'
    show GoogleAuthButton, AuthButtonStyle, AuthButtonType, AuthIconType;

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", 1),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome \n This is your Travel App",
                  style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              GoogleAuthButton(
                onPressed: () {},
                darkMode: false,
              ),
              ButtonGreen(
                text: "Login With Google",
                onPressed: () {},
                heightP: 50.0,
                widthP: 300.0,
                radius: 15.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
