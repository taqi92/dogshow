import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_show/ui/preview_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dogs_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../utils/style.dart';

class BreedImageListPage extends StatefulWidget {
  const BreedImageListPage({super.key});

  @override
  State<BreedImageListPage> createState() => _BreedImageListPageState();
}

class _BreedImageListPageState extends State<BreedImageListPage> {
  final _dogsController = Get.put(DogController());
  var breed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.arguments != null) {
      breed = Get.arguments;

      _dogsController.callGetImageListByBreed(breed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breeds Images'),
      ),
      body: GetBuilder<DogController>(builder: (controller) {
        return StaggeredGridView.countBuilder(
          staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          crossAxisCount: 2,
          itemCount: _dogsController.breedImageList.length,
          itemBuilder: (context, index) {
            var images = _dogsController.breedImageList[index];
            return GestureDetector(
              onTap: () async {},
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
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=>PreviewImageScreen(),arguments: images);
                      },
                      child: CachedNetworkImage(
                          imageUrl: images,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                                  height: 100,
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
                  )),
            );
          },
        );
      }),
    );
  }
}
