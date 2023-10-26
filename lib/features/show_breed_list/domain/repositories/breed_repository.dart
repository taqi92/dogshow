
import '../entities/breed.dart';

abstract class BreedRepository {
  Future<List<Breed>> getBreedList();
  Future<String> getBreedImage(String breed);

}

