import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/widgets/title_header.dart';
import 'card_image.dart';

class CardImageList extends StatefulWidget {
  User user;
  CardImageList(this.user);

  @override
  State<CardImageList> createState() => _CardImageListState();
}

class _CardImageListState extends State<CardImageList> {
  UserBloc? userBloc;
  Widget listViewPlaces(List<Place> places) {
    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked;
        userBloc!.likePlace(place, widget.user.uid);
        place.likes = place.liked ? place.likes! + 1 : place.likes! - 1;
        userBloc!.placeSelectedSink.add(place);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: places.map((place) {
          return GestureDetector(
            onTap: () {
              print("CLICK PLACE: ${place.name}");
              userBloc!.placeSelectedSink.add(place);
            },
            child: CardImageWithFabIcon(
              pathImage: place.urlImagen,
              width: 300.0,
              height: 250.0,
              left: 20.0,
              iconData: place.liked ? iconDataLiked : iconDataLike,
              onPressedFabIcon: () {
                setLiked(place);
              },
              internet: true,
            ),
          );
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of(context);
    return Container(
      height: 300.0,
      child: StreamBuilder(
        stream: userBloc!.placeListStream(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              print("PLACESLIST: WAITING");
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              print("PLACESLIST: ACTIVE");
              return listViewPlaces(
                  userBloc!.buildPlaces(snapshot.data.docs, widget.user));
          }
        },
      ),
    );
  }
}

// class CardImageList2 extends StatelessWidget {
//   UserBloc? userBloc;
//   @override
//   Widget build(BuildContext context) {
//     userBloc = Provider.of(context);
//     return Container(
//       height: 300.0,
//       child: StreamBuilder(
//         stream: userBloc!.placeListStream(),
//         builder: (context, AsyncSnapshot snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//             case ConnectionState.waiting:
//               return CircularProgressIndicator();
//             case ConnectionState.active:
//             case ConnectionState.done:
//               return listViewPlaces(userBloc!.buildPlaces(snapshot.data.docs));
//           }
//         },
//       ),
//     );
//   }


// }
