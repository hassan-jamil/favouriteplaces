import 'package:favouriteplaces/models/place_model.dart';
import 'package:flutter/material.dart';
class PlacesDetail extends StatelessWidget {
  const PlacesDetail({super.key,required this.places});
 final Places places;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(places.title),),
      body: Center(child: Text(places.title),),
    );
  }
}
