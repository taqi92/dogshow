import 'package:dog_show/ui/preview_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dogs_controller.dart';

class SubBreedImageListPage extends StatefulWidget {
  const SubBreedImageListPage({super.key});

  @override
  State<SubBreedImageListPage> createState() => _SubBreedImageListPageState();
}

class _SubBreedImageListPageState extends State<SubBreedImageListPage> {
  final _dogsController = Get.put(DogController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      _dogsController.callGetImageListBySubBreed();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog sub-Breeds Images'),
      ),
      body: GetBuilder<DogController>(builder: (controller) {
        return GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: 2 / 3,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: List.generate(_dogsController.breedImageList.length, (index) {
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
                      child: Image.network(images)),
                ),
              );
            }));
      }),
    );
  }
}
