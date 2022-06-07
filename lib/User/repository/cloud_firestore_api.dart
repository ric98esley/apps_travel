import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/Place/ui/widgets/card_image.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePLaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    auth.User? user = _auth.currentUser;
    DocumentReference _userRef = _db.collection(USERS).doc(user?.uid);
    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _userRef,
      'urlImage': place.urlImagen
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        snapshot.reference;
        DocumentReference _placeRef = snapshot.reference;
        _userRef.update({
          'myPlaces': FieldValue.arrayUnion([_placeRef])
        });
      });
    });
  }

  Stream<QuerySnapshot> placeListStream({Key? key, bool? userOwner = false}) {
    auth.User? user = _auth.currentUser; //Para saber el uid del usuario actual
    DocumentReference _userRef = _db.collection(USERS).doc(user?.uid);

    return userOwner == true
        ? _db
            .collection(PLACES)
            .where('userOwner', isEqualTo: _userRef)
            .snapshots()
        : _db.collection(PLACES).snapshots();
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = List<ProfilePlace>.empty(growable: true);
    for (var p in placesListSnapshot) {
      profilePlaces.add(ProfilePlace(Place(
        name: p['name'],
        description: p['description'],
        urlImagen: p['urlImage'],
        likes: p['likes'],
      )));
    }
    return profilePlaces;
  }

  List<CardImageWithFabIcon> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot) {
    double heigth = 250;
    double width = 300.0;
    double left = 20.0;
    IconData icon = Icons.favorite_border;
    List<CardImageWithFabIcon> placesCard =
        List<CardImageWithFabIcon>.empty(growable: true);
    for (var p in placesListSnapshot) {
      placesCard.add(CardImageWithFabIcon(
        pathImage: p["urlImage"],
        iconData: icon,
        onPressedFabIcon: () {},
        height: heigth,
        width: width,
        left: left,
      ));
    }
    return placesCard;
  }
}
