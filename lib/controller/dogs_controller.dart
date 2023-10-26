import 'package:dog_show/model/breed_model.dart';
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

        //showMessage(response.message, isToast: true);

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

  void callGetRandomImageByBreed() {

    _dogRepository.getRandomByBreed((response, error) async {
      if (response != null) {

        image.value = response.message;

      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetImageListByBreed() {

    _dogRepository.getImageListByBreed((response, error) async {
      if (response != null) {

        //showMessage(response.message, isToast: true);

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

  void callGetSubBreedList() {

    _dogRepository.getSubBreedList((response, error) async {
      if (response != null) {

        //showMessage(response.message, isToast: true);

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

  void callGetRandomImageBySubBreed() {

    _dogRepository.getRandomBySubBreed((response, error) async {
      if (response != null) {

        image.value = response.message;

      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetImageListBySubBreed() {

    _dogRepository.getImageListBySubBreed((response, error) async {
      if (response != null) {

        //showMessage(response.message, isToast: true);

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
