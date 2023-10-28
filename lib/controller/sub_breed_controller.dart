import 'package:dog_show/model/breed_model.dart';
import 'package:dog_show/utils/environment.dart';
import 'package:get/get.dart';
import '../model/dog_class.dart';
import '../repositories/breed_repository.dart';
import '../repositories/sub_breed_repository.dart';
import '../utils/constants.dart';


class SubBreedController extends GetxController {
  late final SubBreedRepository _subBreedRepository;

  List<String> breedList = [];
  List<String> breedImageList = [];

  var image = Rxn<String?>();

  // Track the loading and loaded states
  bool isLoading = false;
  bool isLoaded = false;

  @override
  void onInit() {
    _subBreedRepository = SubBreedRepository();
    super.onInit();
  }

  void callGetRandomImageBySubBreed(String breed, String subBreed) {
    var url = "/breed/$breed/$subBreed/images/random";

    image.value = "";
    isLoading = true;

    _subBreedRepository.getRandomBySubBreed(url, (response, error) async {

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

  void callGetImageListBySubBreed(String breed, String subBreed) {
    var url = "/breed/$breed/$subBreed/images";

    isLoading = true;

    _subBreedRepository.getImageListBySubBreed(url, (response, error) async {

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
}
