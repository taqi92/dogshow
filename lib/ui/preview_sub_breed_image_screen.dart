import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_show/components/header_component.dart';
import 'package:dog_show/components/text_component.dart';
import 'package:dog_show/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/base_state.dart';
import '../controller/breed_controller.dart';
import '../controller/sub_breed_controller.dart';
import '../utils/enums.dart';
import '../utils/style.dart';

class PreviewSubBreedImageScreen extends StatefulWidget {
  const PreviewSubBreedImageScreen({super.key});

  @override
  State<PreviewSubBreedImageScreen> createState() => _PreviewSubBreedImageScreenState();
}

class _PreviewSubBreedImageScreenState extends BaseState<PreviewSubBreedImageScreen> {

  final _subBreedController = Get.put(SubBreedController());

  var subBreedName, breedName;

  late Rxn<String?> subBreedImageUrl;

  @override
  void initState() {
    // TODO: implement initState

    subBreedImageUrl = _subBreedController.image;

    super.initState();

    if (Get.arguments != null) {
       if (Enums.SUBBREED == Get.arguments[0]) {
        subBreedName = Get.arguments[1];
        breedName = Get.arguments[2];
        _subBreedController.callGetRandomImageBySubBreed(breedName, subBreedName);
      } else {
         subBreedImageUrl.value = Get.arguments;
      }
    }
  }

  @override
  void dispose() {
    resetGetXValues([subBreedImageUrl]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(title: "Sub-breed Image Preview"),
      body: HeaderComponent(GetBuilder<SubBreedController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.isLoaded) {
          return controller.image.value != null
              ? Align(
                  alignment: Alignment.topCenter,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: subBreedImageUrl.value!,
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
