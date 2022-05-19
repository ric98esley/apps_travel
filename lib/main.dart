import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:trips_app/Place/bloc/bloc_place.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'platzi_trips.dart';
import 'platzi_trips_cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserBloc>(create: (_) => UserBloc()),
        Provider<PlaceBloc>(create: (_) => PlaceBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: PlatziTripsCupertino(),
      ),
    );
  }
}
