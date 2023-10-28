import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_show/components/header_component.dart';
import 'package:dog_show/components/no_content_component.dart';
import 'package:dog_show/components/text_component.dart';
import 'package:dog_show/controller/sub_breed_controller.dart';
import 'package:dog_show/ui/preview_image_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/base_state.dart';
import '../controller/breed_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../utils/style.dart';

class BreedImageListPage extends StatefulWidget {
  const BreedImageListPage({super.key});

  @override
  State<BreedImageListPage> createState() => _BreedImageListPageState();
}

class _BreedImageListPageState extends BaseState<BreedImageListPage> {

  final _breedController = Get.put(BreedController());
  var breed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.arguments != null) {
      breed = Get.arguments;

      _breedController.callGetImageListByBreed(breed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: "images_by_breed", isNavigate: true),
        backgroundColor: kPrimaryColor,
        body: HeaderComponent(
          GetBuilder<BreedController>(builder: (controller) {

            if(controller.isLoading){

              return Center(child: CircularProgressIndicator());

            }else if(controller.isLoaded){

              return MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: kIsWeb ? 4 : 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemCount: controller.breedImageList.length,
                itemBuilder: (context, index) {
                  var images = controller.breedImageList[index];
                  return GestureDetector(
                    onTap: () async {
                      Get.to(() => PreviewImageScreen(), arguments: images);
                    },
                    child: Card(
                      elevation: 3,
                      // Change this
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: CachedNetworkImage(
                          imageUrl: images ?? "",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                              height: kIsWeb ? 300 : 100,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                      color: kPrimaryColor),
                                ),
                              )),
                          fit: BoxFit.fill),
                    ),
                  );
                },
              );

            }else{

              return NoContentComponent();
            }
          }),
        )
    );
  }
}
