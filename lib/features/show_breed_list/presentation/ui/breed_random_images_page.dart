import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/breed.dart';
import '../controllers/breed_images_controller.dart';

class BreedImagesPage extends StatelessWidget {
  final BreedImagesController controller = Get.find();
  final Breed breed;

  BreedImagesPage({required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breed Image - ${breed.name}'),
      ),
      body: Obx(() {
        if (controller.imageUrl.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(controller.imageUrl.value),
          );
        }
      }),
    );
  }
}
