import 'dart:io';

import 'package:favouriteplaces/models/place_model.dart';
import 'package:favouriteplaces/providers/user_places.dart';
import 'package:favouriteplaces/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favouriteplaces/widgets/image_input.dart';
class AddFavouriteScreenWidget extends ConsumerStatefulWidget {
  const AddFavouriteScreenWidget({super.key,});

  @override
  ConsumerState<AddFavouriteScreenWidget> createState() =>
      _AddFavouriteScreenWidgetState();
}

class _AddFavouriteScreenWidgetState extends ConsumerState<AddFavouriteScreenWidget> {
  TextEditingController textEditingController = TextEditingController();
  File? _selectedImage;

  void _savePlace()
  {
    final enteredText = textEditingController.text;
    if(enteredText.isEmpty || _selectedImage == null)
      {
        return;
      }
    ref.read(userPlaceProvider.notifier).addPlace(enteredText,_selectedImage!);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Places')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(label: Text('Title')),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            ImageInput(onPickedImage: (image){
              _selectedImage = image;
            },),
            SizedBox(height: 16),
            LocationInput(),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              label: Text('Add'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
