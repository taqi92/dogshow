import 'package:dog_show/model/breed_model.dart';
import 'package:dog_show/utils/environment.dart';
import 'package:get/get.dart';
import '../model/dog_class.dart';
import '../repositories/user_repository.dart';
import '../utils/constants.dart';

abstract class DogRepositoryInterface {
  void getBreedModel();
//... other methods like getRandomByBreed, getImageListByBreed etc...
}

/*class DogController extends GetxController {
  late final DogRepository _dogRepository;

  List<String> breedList = [];
  List<String> breedImageList = [];
  List<String> subBreedNameList = [];

  var image = Rxn<String?>();

  // Track the loading and loaded states
  bool isLoading = false;
  bool isLoaded = false;

  @override
  void onInit() {
    _dogRepository = DogRepository();
    super.onInit();
  }

  void callGetBreedList() {

    isLoading = true;

    _dogRepository.getBreedModel((response, error) async {
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

    _dogRepository.getRandomByBreed(url, (response, error) async {

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

    _dogRepository.getImageListByBreed(url, (response, error) async {

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

    _dogRepository.getSubBreedList(url, (response, error) async {

      isLoading = false;
      isLoaded = true;

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

  void callGetRandomImageBySubBreed(String breed, String subBreed) {
    var url = "/breed/$breed/$subBreed/images/random";

    image.value = "";
    isLoading = true;

    _dogRepository.getRandomBySubBreed(url, (response, error) async {

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

    _dogRepository.getImageListBySubBreed(url, (response, error) async {

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
}*/

class DogController extends GetxController with StateMixin<DogModel> {

  late final DogRepository _dogRepository;
  var model;

  @override
  void onInit() {
    _dogRepository = DogRepository();
    super.onInit();

    model = DogModel();

    // Initialize the state variable
    change(DogModel(), status: RxStatus.loading());

  }

  // Methods to update the state variable
  void updateBreedList(List<String> breedList) {
    change(DogModel(breedList: breedList), status: RxStatus.success());
  }

  void updateBreedImageList(List<String> breedImageList) {
    change(DogModel(breedImageList: breedImageList), status: RxStatus.success());
  }

  void updateSubBreedNameList(List<String> subBreedNameList) {
    change(DogModel(subBreedNameList: subBreedNameList), status: RxStatus.success());
  }

  void updateImage(String? image) {
    change(DogModel(image: image), status: RxStatus.success());
  }

  // Methods to call the API
  void callGetBreedList() {
    _dogRepository.getBreedModel((response, error) async {
      if (response != null) {
        updateBreedList(response.message.keys.toList());
      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetRandomImageByBreed(breedName) {
    var url = "/breed/$breedName/images/random";

    _dogRepository.getRandomByBreed(url, (response, error) async {
      if (response != null) {
        updateImage(response.message);
      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetImageListByBreed(breed) {
    var url = "/breed/$breed/images";

    _dogRepository.getImageListByBreed(url, (response, error) async {
      if (response != null) {
        updateBreedImageList(response.message?.toList() ?? []);
      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetSubBreedList(String breed) {
    var url = "/breed/$breed/list";

    _dogRepository.getSubBreedList(url, (response, error) async {
      if (response != null) {
        updateSubBreedNameList(response.message?.toList() ?? []);
      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetRandomImageBySubBreed(String breed, String subBreed) {
    var url = "/breed/$breed/$subBreed/images/random";

    //image.value = "";

    _dogRepository.getRandomBySubBreed(url, (response, error) async {
      if (response != null) {
        updateImage(response.message);
      } else {
        showMessage(response?.status);
      }
    });
  }

  void callGetImageListBySubBreed(String breed, String subBreed) {
    var url = "/breed/$breed/$subBreed/images";

    _dogRepository.getImageListBySubBreed(url, (response, error) async {
      if (response != null) {
        updateBreedImageList(response.message?.toList() ?? []);
      } else {
        showMessage(response?.status);
      }
    });
  }
}
