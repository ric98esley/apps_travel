import 'package:flutter/material.dart';
import 'package:trips_app/User/ui/widgets/profile_background.dart';
import 'package:trips_app/User/ui/widgets/profile_places_list.dart';

import 'profile_header.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ProfileHeader(),
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
