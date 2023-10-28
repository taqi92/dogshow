import 'package:dog_show/model/breed_image_list.dart';
import 'package:dog_show/model/breed_model.dart';
import 'package:dog_show/model/random_image_model.dart';
import 'package:dog_show/model/sub_breed_list.dart';

import '../../utils/constants.dart';
import '../../utils/endpoints.dart';
import '../network/api_client.dart';

class BreedRepository {
  final ApiClient _apiClient = ApiClient.apiClient;
  static final BreedRepository _breedRepository = BreedRepository._internal();

  BreedRepository._internal();

  factory BreedRepository() {
    return _breedRepository;
  }

  void getBreedModel(ResponseCallback<BreedModel?, String?> callback) {
    _apiClient.getRequest(breedListEndPoints, (response, error) {
      if (response != null) {
        callback(BreedModel.fromJson(response), null);
      } else {
        callback(null, error);
      }
    });
  }

  void getRandomByBreed(String url,ResponseCallback<RandomImageModel?, String?> callback) {
    _apiClient.getRequest(url, (response, error) {
      if (response != null) {
        callback(RandomImageModel.fromJson(response), null);
      } else {
        callback(null, error);
      }
    });
  }

  void getImageListByBreed(url,
      ResponseCallback<BreedImageLIst?, String?> callback) {
    _apiClient.getRequest(url, (response, error) {
      if (response != null) {
        callback(BreedImageLIst.fromJson(response), null);
      } else {
        callback(null, error);
      }
    });
  }

  void getSubBreedList(url, ResponseCallback<SubBreedList?, String?> callback) {
    _apiClient.getRequest(url, (response, error) {
      if (response != null) {
        callback(SubBreedList.fromJson(response), null);
      } else {
        callback(null, error);
      }
    });
  }

}
