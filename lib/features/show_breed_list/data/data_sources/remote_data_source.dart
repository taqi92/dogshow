import 'package:dio/dio.dart';

import '../models/breed_model.dart';

class RemoteBreedDataSource {
  final String apiUrl = "https://dog.ceo/api/breeds/list/all";
  final Dio _dio = Dio();

  Future<Map<String, List<String>>> getBreedList() async {
    try {
      final response = await _dio.get(apiUrl);
      if (response.statusCode == 200) {
        final breedModel = BreedModel(response.data['message']);
        return breedModel.breedNames;
      } else {
        throw Exception('Failed to load breed list');
      }
    } catch (e) {
      throw Exception('Failed to load breed list: $e');
    }
  }
}
