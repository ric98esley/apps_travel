import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/platzi_trips.dart';
import 'package:trips_app/widgets/button_green.dart';
import 'package:trips_app/User/model/user.dart' as userModel;
import 'package:trips_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc? userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of(context);
    return _handCurrentSession();
  }

  Widget _handCurrentSession() {
    return StreamBuilder(
        stream: userBloc!.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //snapshot-data- Object user
          if (!snapshot.hasData || snapshot.hasError) {
            return signInGoogleUI();
          } else {
            return PlatziTrips();
          }
        });
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
              ButtonGreen(
                text: "Login With Google",
                onPressed: () {
                  userBloc!.signOut();
                  userBloc!.signIn().then((UserCredential? user) {
                    userBloc!.updateUserData(userModel.User(
                        uid: user!.user!.uid,
                        name: user.user!.displayName,
                        email: user.user!.email,
                        photoURL: user.user!.photoURL));
                  });
                },
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
