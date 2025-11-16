import 'package:favouriteplaces/screens/places_detail.dart';
import 'package:flutter/material.dart';
import '../models/place_model.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Places> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No Place Added Yet',
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder:
          (context, index) => ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            title: Text(places[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlacesDetail(places: places[index]),
                ),
              );
            },
          ),
    );
  }
}
