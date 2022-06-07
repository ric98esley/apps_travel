import 'package:flutter/material.dart';
import 'package:trips_app/Place/model/place.dart';
import 'profile_place_info.dart';
import 'profile_place.dart';

class ProfilePlace extends StatelessWidget {
  Place place;
  ProfilePlace(this.place);

  @override
  Widget build(BuildContext context) {
    final photoCard = Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 70.0),
      height: 220.0,
      child: Container(
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(place.urlImagen, fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                  child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded.toDouble() /
                              loadingProgress.expectedTotalBytes!.toDouble()
                          : null));
            }),
          )),
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     fit: BoxFit.cover, image: NetworkImage(place.urlImagen)),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
    );

    return Stack(
      alignment: Alignment(0.0, 0.8),
      children: <Widget>[photoCard, ProfilePlaceInfo(place)],
    );
  }
}
