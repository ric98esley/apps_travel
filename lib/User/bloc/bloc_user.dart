import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/repository/auth_repository.dart';
import 'package:trips_app/User/model/user.dart' as userModel;
import 'package:trips_app/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //flujo de datos -streams
  //stream - firebase
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  //Casos de uso del objeto user

  //1. SignIn a la aplicacion
  Future<UserCredential> signIn() {
    return _auth_repository.singInFirebase();
  }

  signOut() {
    _auth_repository.signOut();
  }
  // 2. registrar usuario en base de datos

  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(userModel.User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  @override
  void dispose() {}
}
