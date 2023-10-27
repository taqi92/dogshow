import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_show/components/header_component.dart';
import 'package:dog_show/ui/preview_image_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../base/base_state.dart';
import '../controller/dogs_controller.dart';
import '../utils/style.dart';

class SubBreedImageListPage extends StatefulWidget {
  const SubBreedImageListPage({super.key});

  @override
  State<SubBreedImageListPage> createState() => _SubBreedImageListPageState();
}

class _SubBreedImageListPageState extends BaseState<SubBreedImageListPage> {
  final _dogsController = Get.put(DogController());

  var breed, subBreed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.arguments != null) {
      breed = Get.arguments[0];
      subBreed = Get.arguments[1];

      _dogsController.callGetImageListBySubBreed(breed, subBreed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: myAppBar(
          title: "Images by Sub-breed",
        ),
        body: HeaderComponent(
          GetBuilder<DogController>(builder: (controller) {
            return StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              crossAxisCount: kIsWeb ? 4 : 2,
              itemCount: _dogsController.breedImageList.length,
              itemBuilder: (context, index) {
                var images = _dogsController.breedImageList[index];
                return GestureDetector(
                  onTap: () async {
                    Get.to(()=>PreviewImageScreen(),arguments: images);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 3,
                      // Change this
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: CachedNetworkImage(
                          imageUrl: images,
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
                  ),
                );
              },
            );
          }),
        ));
  }
}
