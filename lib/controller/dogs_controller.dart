import 'package:dog_show/model/breed_model.dart';
import 'package:get/get.dart';
import '../repositories/user_repository.dart';
import '../utils/constants.dart';

class DogController extends GetxController {

  late final UserRepository _userRepository;

  List<String> breedList = [];

  late BreedModel _breedModel;

  @override
  void onInit() {
    _userRepository = UserRepository();
    super.onInit();
  }

  void callGetBreedList() {

    _userRepository.getBreedModel((response, error) async {
      if (response != null) {

        //showMessage(response.message, isToast: true);

        breedList = [];

        response.message.keys.forEach((element) {

          breedList.add(element);

          update();

        });

        //breedList = _breedModel.message.keys.toList();


      } else {
        //showMessage(response?.status);
      }
    });
  }
}
