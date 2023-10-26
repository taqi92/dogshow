import 'dart:developer';

import 'package:dog_show/features/show_breed_list/domain/entities/image.dart';

import '../entities/breed.dart';
import '../repositories/breed_repository.dart';

class GetBreedList {
  final BreedRepository repository;

  GetBreedList(this.repository);

  Future<List<Breed>> call() async {
    return repository.getBreedList();
  }
}

class GetBreedImages {
  final BreedRepository repository;

  GetBreedImages(this.repository);

  Future<String> call(String breed) async {

    log("val 3 " + breed);

    return repository.getBreedImage(breed);
  }
}

