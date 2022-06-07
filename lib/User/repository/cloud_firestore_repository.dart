import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/Place/ui/widgets/card_image.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/repository/cloud_firestore_api.dart';
import 'package:trips_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePLaceDate(Place place) async =>
      _cloudFirestoreAPI.updatePLaceData(place);
  Stream<QuerySnapshot> placeListStream({Key? key, bool? userOwner}) =>
      _cloudFirestoreAPI.placeListStream(userOwner: userOwner);

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);
  List<CardImageWithFabIcon> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
}
