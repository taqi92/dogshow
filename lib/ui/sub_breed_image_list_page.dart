import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_show/components/header_component.dart';
import 'package:dog_show/controller/sub_breed_controller.dart';
import 'package:dog_show/ui/preview_sub_breed_image_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../base/base_state.dart';
import '../components/text_component.dart';
import '../utils/style.dart';

class SubBreedImageListPage extends StatefulWidget {
  const SubBreedImageListPage({super.key});

  @override
  State<SubBreedImageListPage> createState() => _SubBreedImageListPageState();
}

class _SubBreedImageListPageState extends BaseState<SubBreedImageListPage> {
  final _subBreedController = Get.put(SubBreedController());

  var breed, subBreed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.arguments != null) {
      breed = Get.arguments[0];
      subBreed = Get.arguments[1];

      _subBreedController.callGetImageListBySubBreed(breed, subBreed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: myAppBar(
          title: "images_by_sub_breed",
        ),
        body: HeaderComponent(
          GetBuilder<SubBreedController>(builder: (controller) {

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
                      Get.to(()=>PreviewSubBreedImageScreen(),arguments: images);
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

              return TextComponent("error");
            }


          }),
        ));
  }
}
