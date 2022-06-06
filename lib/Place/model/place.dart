import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trips_app/User/model/user.dart';

class Place {
  String? id;
  String name;
  String description;
  String urlImagen;
  int? likes;

  Place({
    Key? key,
    required this.name,
    required this.description,
    required this.urlImagen,
    this.id,
    this.likes,
  });
}
