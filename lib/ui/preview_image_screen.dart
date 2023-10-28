import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_show/components/header_component.dart';
import 'package:dog_show/components/text_component.dart';
import 'package:dog_show/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/base_state.dart';
import '../controller/dogs_controller.dart';
import '../utils/enums.dart';
import '../utils/style.dart';

class PreviewImageScreen extends StatefulWidget {
  const PreviewImageScreen({super.key});

  @override
  State<PreviewImageScreen> createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends BaseState<PreviewImageScreen> {
  final _dogsController = Get.put(DogController());

  var subBreedName, breedName;

  late Rxn<String?> imageUrl;

  @override
  void initState() {
    // TODO: implement initState

    imageUrl = _dogsController.image;

    super.initState();

    if (Get.arguments != null) {
      if (Enums.BREED == Get.arguments[0]) {
        breedName = Get.arguments[1];
        _dogsController.callGetRandomImageByBreed(breedName);
      } else if (Enums.SUBBREED == Get.arguments[0]) {
        subBreedName = Get.arguments[1];
        breedName = Get.arguments[2];
        _dogsController.callGetRandomImageBySubBreed(breedName, subBreedName);
      } else {
        imageUrl.value = Get.arguments;
      }
    }
  }

  @override
  void dispose() {
    resetGetXValues([imageUrl]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(title: "Image Preview"),
      body: HeaderComponent(GetBuilder<DogController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.isLoaded) {
          return _dogsController.image.value != null
              ? Align(
                  alignment: Alignment.topCenter,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: imageUrl.value!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => SizedBox(
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: kPrimaryColor),
                              ),
                            )),
                  ),
                )
              : const Center(child: TextComponent("No Image"));
        } else {
          return const TextComponent("Error");
        }
      })
      ),
    );
  }
}
