import 'package:flutter/material.dart';
import 'package:trips_app/Place/model/place.dart';

class User {
  final String uid;
  final name;
  final email;
  final photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;
  User({
    Key? key,
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
    this.myPlaces,
    this.myFavoritePlaces,
  });
}
