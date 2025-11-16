import 'package:favouriteplaces/models/place_model.dart';
import 'package:favouriteplaces/providers/user_places.dart';
import 'package:favouriteplaces/screens/add_place.dart';
import 'package:favouriteplaces/widgets/places_List.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteScreenWidget extends ConsumerWidget {
  const FavouriteScreenWidget({super.key,});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final userPlaces = ref.watch(userPlaceProvider);
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddFavouriteScreenWidget(),
                  ),
                );
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlacesList(places: userPlaces),
        ),
      );
    }
  }
