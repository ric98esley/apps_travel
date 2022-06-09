import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  UserBloc? userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of(context);
    final star_half = Container(
      margin: const EdgeInsets.only(top: 353.0, right: 3.0),
      child: const Icon(
        Icons.star_half,
        color: Color(0xFFf2C611),
      ),
    );

    final star_border = Container(
      margin: const EdgeInsets.only(top: 353.0, right: 3.0),
      child: const Icon(
        Icons.star_border,
        color: Color(0xFFf2C611),
      ),
    );

    final star = Container(
      margin: const EdgeInsets.only(top: 353.0, right: 3.0),
      child: const Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
          child: Text(
            namePlace,
            style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: <Widget>[star, star, star, star, star_half],
        )
      ],
    );

    final description = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)),
      ),
    );

    return StreamBuilder(
        stream: userBloc!.placeSelectedStream,
        builder: (BuildContext context, AsyncSnapshot<Place> snapshot) {
          if (snapshot.hasData) {
            print("PLACE SELECTED: ${snapshot.data!.name}");
            print(snapshot.data);
            Place? place = snapshot.data;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleStars(place!),
                descriptionWidget(place.description),
                ButtonPurple(buttonText: "Navigate", onPressed: () {})
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 400.0, left: 20.0, right: 20.0),
                  child: Text(
                    "Selecciona un lugar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            );
          }
        });

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    //     title_stars,
    //     description,
    //     ButtonPurple(buttonText: "Navigate", onPressed: () {})
    //   ],
    // );
  }

  Widget titleStars(Place place) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
          child: Text(
            place.name,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 370.0,
          ),
          child: Text(
            "Hearts: ${place.likes}",
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: Colors.amber),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget descriptionWidget(String descriptionPlace) {
    return Container(
      margin: new EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)),
      ),
    );
  }
}
