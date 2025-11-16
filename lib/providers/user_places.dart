import 'dart:io';

import 'package:favouriteplaces/models/place_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserPlaceNotifier extends StateNotifier<List<Places>> {
  UserPlaceNotifier() : super([]);

  void addPlace(String title,File image) {
    final newPlace = Places(title: title,image: image);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<UserPlaceNotifier, List<Places>>(
      (ref) => UserPlaceNotifier(),
    );
