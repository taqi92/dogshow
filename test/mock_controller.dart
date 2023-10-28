import 'package:dog_show/controller/breed_controller.dart';
import 'package:mockito/mockito.dart';

class MockDogRepository extends Mock implements BreedRepositoryInterface {

  List<String> get breedList => <String>[]; // Initialize it with an empty list to avoid null

}
