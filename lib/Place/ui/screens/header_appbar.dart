import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/Place/ui/widgets/card_image_list.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/title_header.dart';

class HeaderAppBar extends StatelessWidget {
  UserBloc? userBloc;
  User? user;
  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of(context);
    return StreamBuilder(
        stream: userBloc!.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              return showPlacesData(snapshot);
          }
        });

    // return Stack(
    //   children: [
    //     GradientBack(
    //       height: 250.0,
    //     ),
    // Column(
    //   children: [
    //     Container(
    //       margin: EdgeInsets.only(top: 40),
    //       child: Text("Apps Trips",
    //           style: const TextStyle(
    //               color: Colors.white,
    //               fontSize: 30.0,
    //               fontFamily: "Lato",
    //               fontWeight: FontWeight.bold)),
    //       alignment: const Alignment(-0.7, -0.6),
    //     ),
    //         CardImageList()
    //       ],
    //     ),
    //   ],
    // );
  }

  Widget showPlacesData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: [
          GradientBack(height: 250.0),
          Text("Usuario no logeado. Haz Login")
        ],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);

      return Stack(children: [
        GradientBack(height: 250.0),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text("Apps Trips",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold)),
              alignment: const Alignment(-0.7, -0.6),
            ),
            CardImageList(user)
          ],
        )
      ]);
    }
  }
}
