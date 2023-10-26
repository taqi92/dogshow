import 'dart:developer';

import 'package:get/get.dart';

import '../../domain/usecases/get_breed_list.dart';

class BreedImagesController extends GetxController {
  final GetBreedImages getBreedImages;
  final imageUrl = ''.obs;

  BreedImagesController(this.getBreedImages);

  Future<void> fetchBreedImage(String breed) async {
    try {

      final image = await getBreedImages(breed);
      imageUrl.value = image;

      log("imageUrl fetched" + image);

    } catch (e) {
      // Handle the error as needed
      log('Error fetching breed image: $e');
    }
  }
}
