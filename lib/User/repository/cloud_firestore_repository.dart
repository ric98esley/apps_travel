import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/repository/cloud_firestore_api.dart';
import 'package:trips_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePLaceDate(Place place) async =>
      _cloudFirestoreAPI.updatePLaceData(place);
  Stream<QuerySnapshot> placeListStream() =>
      _cloudFirestoreAPI.placeListStream();

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
}
