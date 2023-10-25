import 'package:get/get.dart';

import '../../domain/entities/breed.dart';
import '../../domain/usecases/get_breed_list.dart';

class BreedListController extends GetxController {
  final GetBreedList getBreedList;
  final breedList = <Breed>[].obs;

  BreedListController(this.getBreedList);

  @override
  void onInit() {
    fetchBreedList();
    super.onInit();
  }

  void fetchBreedList() async {
    breedList.value = await getBreedList();
  }
}
