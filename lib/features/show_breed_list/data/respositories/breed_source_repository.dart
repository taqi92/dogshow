

import 'dart:developer';

import 'package:dog_show/features/show_breed_list/domain/entities/image.dart';

import '../../domain/entities/breed.dart';
import '../../domain/repositories/breed_repository.dart';
import '../data_sources/remote_data_source.dart';

class BreedRepositoryImpl implements BreedRepository {
  final RemoteBreedDataSource dataSource;

  BreedRepositoryImpl(this.dataSource);

  @override
  Future<List<Breed>> getBreedList() async {
    try {
      final breedModel = await dataSource.getBreedList();
      final List<Breed> breeds = [];

      breedModel.forEach((breedName, subBreeds) {
        if (subBreeds.isEmpty) {
          breeds.add(Breed(breedName));
        } else {
          // If there are sub-breeds, create a Breed object for each sub-breed
          for (var subBreed in subBreeds) {
            breeds.add(Breed('$breedName $subBreed'));
          }
        }
      });

      return breeds;
    } catch (e) {
      throw Exception('Failed to fetch breed list: $e');
    }
  }

  @override
  Future<String> getBreedImage(String breed) async {
    try {
      final imageUrl = await dataSource.getBreedImage(breed);

      log("val 2 " + imageUrl);

      return imageUrl;
    } catch (e) {
      throw Exception('Failed to fetch breed image: $e');
    }
  }

}
