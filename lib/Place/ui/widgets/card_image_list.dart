import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/widgets/title_header.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  UserBloc? userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of(context);
    return Container(
      height: 300.0,
      child: StreamBuilder(
        stream: userBloc!.placeListStream(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              return listViewPlaces(userBloc!.buildPlaces(snapshot.data.docs));
          }
        },
      ),
    );
  }

  Widget listViewPlaces(List<CardImageWithFabIcon> placesCard) {
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }
}
