
import '../entities/breed.dart';

abstract class BreedRepository {
  Future<List<Breed>> getBreedList();
}
