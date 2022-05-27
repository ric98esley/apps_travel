import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc? userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
        child: Row(
          children: <Widget>[
            CircleButton(
                mini: true,
                icon: Icons.vpn_key,
                onPressed: () => {},
                iconSize: 20.0,
                color: Color.fromRGBO(255, 255, 255, 0.6)),
            CircleButton(
                mini: false,
                icon: Icons.add,
                iconSize: 40.0,
                onPressed: () => {},
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
