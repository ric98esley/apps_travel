import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/Place/bloc/bloc_place.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/ui/widgets/profile_background.dart';
import 'package:trips_app/User/ui/widgets/profile_places_list.dart';

import 'profile_header.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        MultiProvider(providers: [
          Provider<UserBloc>(create: (_) => UserBloc()),
          Provider<PlaceBloc>(create: (_) => PlaceBloc()),
        ], child: ProfileHeader()),
        Container(
          margin: EdgeInsets.only(top: 260),
          child: ListView(
            children: [ProfilePlacesList()],
          ),
        ),
      ],
    );
  }
}
