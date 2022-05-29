import 'package:flutter/material.dart';
import 'package:trips_app/User/model/user.dart';

class Place {
  String? id;
  String name;
  String description;
  String urlImagen;
  User? userOwner;
  int? likes;

  Place({
    Key? key,
    required this.name,
    required this.description,
    required this.urlImagen,
    this.userOwner,
    this.id,
    this.likes,
  });
}
