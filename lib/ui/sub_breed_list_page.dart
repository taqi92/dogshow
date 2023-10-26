import 'package:dog_show/model/breed_image_list.dart';
import 'package:dog_show/ui/preview_image_screen.dart';
import 'package:dog_show/ui/sub_breed_image_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dogs_controller.dart';
import '../utils/enums.dart';
import 'breed_image_list_page.dart';

class SubBreedListPage extends StatefulWidget {
  const SubBreedListPage({super.key});

  @override
  State<SubBreedListPage> createState() => _SubBreedListPageState();
}

class _SubBreedListPageState extends State<SubBreedListPage> {

  final _dogsController = Get.put(DogController());
  var breed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(Get.arguments != null){

      breed = Get.arguments;
      _dogsController.callGetSubBreedList(breed);

    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Sub Breeds'),
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
            children: List.generate(_dogsController.subBreedNameList.length, (index) {
              var item = _dogsController.subBreedNameList[index];
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
                      child: Column(
                        children: [
                          Text(item),
                          TextButton(
                              onPressed: () {
                                //_dogsController.getBreedImages("hound");
                                  Get.to(() => PreviewImageScreen(),arguments: [Enums.SUBBREED,item,breed]);
                              },
                              child: Text("Show Random")),
                          TextButton(
                              onPressed: () {
                                Get.to(() => SubBreedImageListPage(),arguments: [breed,item]);
                              },
                              child: Text("Show List by sub-breed")),
                        ],
                      )),
                ),
              );
            }));
      }),
    );
  }
}
