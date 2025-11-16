import 'package:favouriteplaces/models/place_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserPlaceNotifier extends StateNotifier<List<Places>> {
  UserPlaceNotifier() : super([]);

  void addPlace(String title) {
    final newPlace = Places(title: title);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<UserPlaceNotifier, List<Places>>(
      (ref) => UserPlaceNotifier(),
    );
