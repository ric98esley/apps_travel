import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //Casos de uso del objeto user

  //1. SignIn a la aplicacion
  Future<UserCredential> signIn() {
    return _auth_repository.singInFirebase();
  }

  @override
  void dispose() {}
}
