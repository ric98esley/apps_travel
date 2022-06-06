import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'profile_place.dart';

class ProfilePlacesList extends StatelessWidget {
  UserBloc? userBloc;
  // Place place = Place(
  //     name: "Knuckles Mountains Range",
  //     description: "Hiking. Water fall hunting. Natural bath",
  //     urlImagen:
  //         "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
  //     likes: 3);
  // Place place2 = Place(
  //     name: "Mountains",
  //     description:
  //         "Hiking. Water fall hunting. Natural bath’, 'Scenery & Photography",
  //     urlImagen:
  //         "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
  //     likes: 10);

  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
          stream: userBloc!.placeListStream(),
          builder: (context, AsyncSnapshot snapshot) {
            print("***********");
            print(userBloc!.placeListStream());
            print(snapshot.data.docs);
            print("***********");
            // return Container();
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const CircularProgressIndicator();
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                return Column(
                  children: userBloc!.buildPlaces(snapshot.data.docs),
                );
              case ConnectionState.done:
                return Column(
                  children: userBloc!.buildPlaces(snapshot.data.docs),
                );
            }
          }),
    );
  }
}
// Column(
//         children: <Widget>[
//           ProfilePlace(place),
//           ProfilePlace(place2),
//         ],
//       // )