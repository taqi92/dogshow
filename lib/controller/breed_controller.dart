import 'package:dog_show/model/breed_model.dart';
import 'package:dog_show/utils/environment.dart';
import 'package:get/get.dart';
import '../model/dog_class.dart';
import '../repositories/breed_repository.dart';
import '../utils/constants.dart';

abstract class BreedRepositoryInterface {
  void getBreedModel();
}

class BreedController extends GetxController {
  late final BreedRepository _breedRepository;

  List<String> breedList = [];
  List<String> breedImageList = [];
  List<String> subBreedNameList = [];

  var image = Rxn<String?>();

  // Track the loading and loaded states
  bool isLoading = false;
  bool isLoaded = false;

  @override
  void onInit() {
    _breedRepository = BreedRepository();
    super.onInit();
  }

  void callGetBreedList() {

    isLoading = true;

    _breedRepository.getBreedModel((response, error) async {
      if (response != null) {

        isLoading = false;
        isLoaded = true;

        breedList = [];

        response.message.keys.forEach((element) {
          breedList.add(element);

          update();
        });
      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetRandomImageByBreed(breedName) {
    var url = "/breed/$breedName/images/random";

    isLoading = true;
    image.value = "";

    _breedRepository.getRandomByBreed(url, (response, error) async {

      isLoading = false;
      isLoaded = true;

      if (response != null) {
        image.value = response.message;

        update();
      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetImageListByBreed(breed) {
    var url = "/breed/$breed/images";

    isLoading = true;

    _breedRepository.getImageListByBreed(url, (response, error) async {

      isLoading = false;
      isLoaded = true;

      if (response != null) {
        breedImageList = [];

        response.message?.forEach((element) {
          breedImageList.add(element);

          update();
        });
      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetSubBreedList(String breed) {
    var url = "/breed/$breed/list";

    isLoading = true;

    _breedRepository.getSubBreedList(url, (response, error) async {

      isLoading = false;
      isLoaded = true;

      subBreedNameList = [];

      if (response != null) {

        response.message?.forEach((element) {
          subBreedNameList.add(element);

          update();
        });
      } else {
        showMessage(response?.status);
      }
    });
  }

}
