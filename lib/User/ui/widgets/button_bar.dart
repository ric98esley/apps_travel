import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc? userBloc;

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    userBloc = Provider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
        child: Row(
          children: [
            CircleButton(
                mini: true,
                icon: Icons.vpn_key,
                onPressed: () => {},
                iconSize: 20.0,
                color: const Color.fromRGBO(255, 255, 255, 0.6)),
            CircleButton(
                mini: false,
                icon: Icons.add,
                iconSize: 40.0,
                onPressed: () async {
                  await ImagePicker()
                      .pickImage(
                          source: ImageSource.camera,
                          maxHeight: 480,
                          maxWidth: 640)
                      .then((pickedFile) {
                    if (pickedFile == null) {
                      return;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddPlaceScreen(image: File(pickedFile.path))));
                  }).catchError((onError) => print(onError));
                },
                color: Color.fromRGBO(255, 255, 255, 1)),
            CircleButton(
                mini: true,
                icon: Icons.exit_to_app,
                onPressed: () => {userBloc!.signOut()},
                iconSize: 20.0,
                color: Color.fromRGBO(255, 255, 255, 0.6)),
          ],
        ));
  }
}
