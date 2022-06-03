import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trips_app/Place/ui/widgets/card_image.dart';
import 'package:trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/text_input.dart';
import 'package:trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  final File? image;
  AddPlaceScreen({Key? key, this.image}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controlerTitlePlace = TextEditingController();
    final _controlerDescriptionPlace = TextEditingController();
    final _controlerLocationPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 300.0),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                padding: const EdgeInsets.only(top: 45.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    color: Colors.white,
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )),
            TitleHeader(title: "Add new Place"),
          ]),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 90.0, bottom: 20.0),
            width: MediaQuery.of(context).size.width,
            child: ListView(children: [
              Container(
                alignment: Alignment.center,
                child: CardImageWithFabIcon(
                  left: 0,
                  width: MediaQuery.of(context).size.width - 40.0,
                  iconData: Icons.camera_alt,
                  onPressedFabIcon: () {},
                  pathImage: "assets/img/sunset.jpeg",
                ),
              ), //foto
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextInput(
                  hintText: "Title",
                  inputType: TextInputType.text,
                  maxLines: 1,
                  controller: _controlerTitlePlace,
                ),
              ),
              TextInput(
                hintText: "Description",
                inputType: TextInputType.multiline,
                controller: _controlerDescriptionPlace,
                maxLines: 4,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: TextInputLocation(
                  hintText: "Add Location",
                  iconData: Icons.location_on,
                  controller: _controlerLocationPlace,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
