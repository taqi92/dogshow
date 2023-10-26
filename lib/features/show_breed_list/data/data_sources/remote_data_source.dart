import 'dart:developer';

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


  Future<String> getBreedImage(String breed) async {
    try {
      final response = await _dio.get("https://dog.ceo/api/breed/$breed/images/random");
      log("code" + response.statusCode.toString());
      if (response.statusCode == 200) {

        log(response.data["message"]);

        return response.data["message"];
      } else {
        log("Error: Status Code ${response.statusCode}");
        log("Response: ${response.data}");
        throw Exception('Failed to load breed image');
      }
    } catch (e) {
      log("Error: $e");

      throw Exception('Failed to load breed image: $e');
    }
  }
}
