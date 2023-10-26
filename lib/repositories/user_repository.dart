import 'package:dog_show/model/breed_model.dart';

import '../../utils/constants.dart';
import '../../utils/endpoints.dart';
import '../network/api_client.dart';

class UserRepository {
  final ApiClient _apiClient = ApiClient.apiClient;
  static final UserRepository _userRepository = UserRepository._internal();

  UserRepository._internal();

  factory UserRepository() {
    return _userRepository;
  }


  void getBreedModel(ResponseCallback<BreedModel?, String?> callback) {
    _apiClient.getRequest(breedListEndPoints,(response, error) {
      if(response != null) {
        callback(BreedModel.fromJson(response), null);
      } else {
        callback(null, error);
      }
    });
  }


}