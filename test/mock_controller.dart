import 'package:dog_show/controller/dogs_controller.dart';
import 'package:mockito/mockito.dart';

class MockDogRepository extends Mock implements DogRepositoryInterface {

  List<String> get breedList => <String>[]; // Initialize it with an empty list to avoid null

}
