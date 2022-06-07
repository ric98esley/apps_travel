import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:trips_app/Place/ui/widgets/card_image.dart';
import 'package:trips_app/User/repository/auth_repository.dart';
import 'package:trips_app/User/model/user.dart' as userModel;
import 'package:trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:trips_app/User/ui/widgets/profile_place.dart';

import '../../Place/model/place.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //flujo de datos -streams
  //stream - firebase
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  Future<User?> currentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }
  //Casos de uso del objeto user

  //1. SignIn a la aplicacion
  Future<UserCredential> signIn() => _auth_repository.singInFirebase();

  signOut() {
    _auth_repository.signOut();
  }
  // 2. registrar usuario en base de datos

  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(userModel.User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  // Registrar un lugar
  Future<void> updatePLaceData(Place place) async =>
      _cloudFirestoreRepository.updatePLaceDate(place);
  // Escuchar nuevos lugares
  Stream<QuerySnapshot> placeListStream({Key? key, bool? userOwner}) =>
      _cloudFirestoreRepository.placeListStream(userOwner: userOwner);
  //Construir lugares en el perfil
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);
  // Construir Lisview en el home
  List<CardImageWithFabIcon> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot);
  // Subir una foto
  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFile(String path, File image) async =>
      _firebaseStorageRepository.uploadFile(path, image);

  @override
  void dispose() {}
}
