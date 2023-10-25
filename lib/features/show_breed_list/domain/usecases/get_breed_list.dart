import '../entities/breed.dart';
import '../repositories/breed_repository.dart';

class GetBreedList {
  final BreedRepository repository;

  GetBreedList(this.repository);

  Future<List<Breed>> call() async {
    return repository.getBreedList();
  }
}
