import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';

class ProfilePlacesList extends StatelessWidget {
  UserBloc? userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
          stream: userBloc!.placeListStream(userOwner: true),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const CircularProgressIndicator();
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                return Column(
                  children: userBloc!.buildMyPlaces(snapshot.data.docs),
                );
              case ConnectionState.done:
                return Column(
                  children: userBloc!.buildMyPlaces(snapshot.data.docs),
                );
            }
          }),
    );
  }
}
