import 'package:dog_show/model/breed_image_list.dart';
import 'package:dog_show/model/breed_model.dart';
import 'package:dog_show/model/random_image_model.dart';
import 'package:dog_show/model/sub_breed_list.dart';

import '../../utils/constants.dart';
import '../network/api_client.dart';

class SubBreedRepository {
  final ApiClient _apiClient = ApiClient.apiClient;
  static final SubBreedRepository _subBreedRepository = SubBreedRepository._internal();

  SubBreedRepository._internal();

  factory SubBreedRepository() {
    return _subBreedRepository;
  }


  void getRandomBySubBreed(url,
      ResponseCallback<RandomImageModel?, String?> callback) {
    _apiClient.getRequest(url, (response, error) {
      if (response != null) {
        callback(RandomImageModel.fromJson(response), null);
      } else {
        callback(null, error);
      }
    });
  }

  void getImageListBySubBreed(url,
      ResponseCallback<BreedImageLIst?, String?> callback) {
    _apiClient.getRequest(url, (response, error) {
      if (response != null) {
        callback(BreedImageLIst.fromJson(response), null);
      } else {
        callback(null, error);
      }
    });
  }
}
