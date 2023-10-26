import 'package:dog_show/model/breed_model.dart';
import 'package:dog_show/utils/environment.dart';
import 'package:get/get.dart';
import '../repositories/user_repository.dart';
import '../utils/constants.dart';

class DogController extends GetxController {

  late final DogRepository _dogRepository;

  List<String> breedList = [];
  List<String> breedImageList = [];
  List<String> subBreedNameList = [];

  var image = Rxn<String?>();

  @override
  void onInit() {
    _dogRepository = DogRepository();
    super.onInit();
  }

  void callGetBreedList() {

    _dogRepository.getBreedModel((response, error) async {
      if (response != null) {

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

    _dogRepository.getRandomByBreed(url,(response, error) async {
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

    _dogRepository.getImageListByBreed(url,(response, error) async {
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

    _dogRepository.getSubBreedList(url,(response, error) async {


      if (response != null) {

        subBreedNameList = [];

        response.message?.forEach((element) {

          subBreedNameList.add(element);

          update();

        });


      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetRandomImageBySubBreed(String breed,String subBreed) {

    var url = "/breed/$breed/$subBreed/images/random";

    image.value = "";

    _dogRepository.getRandomBySubBreed(url,(response, error) async {
      if (response != null) {

        image.value = response.message;

        update();

      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetImageListBySubBreed(String breed,String subBreed) {

    var url = "/breed/$breed/$subBreed/images";

    _dogRepository.getImageListBySubBreed(url,(response, error) async {


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
