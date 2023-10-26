import 'package:dog_show/components/text_component.dart';
import 'package:dog_show/model/breed_image_list.dart';
import 'package:dog_show/ui/preview_image_screen.dart';
import 'package:dog_show/ui/sub_breed_list_page.dart';
import 'package:dog_show/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dogs_controller.dart';
import '../utils/enums.dart';
import 'breed_image_list_page.dart';

class BreedListPage extends StatefulWidget {
  const BreedListPage({super.key});

  @override
  State<BreedListPage> createState() => _BreedListPageState();
}

class _BreedListPageState extends State<BreedListPage> {
  final _dogsController = Get.put(DogController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _dogsController.callGetBreedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breeds'),
      ),
      body: GetBuilder<DogController>(builder: (controller) {
        return GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: 0.6 / 0.8,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: List.generate(_dogsController.breedList.length, (index) {
              var item = _dogsController.breedList[index];
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
                          TextComponent(item),
                          GestureDetector(
                            onTap: (){
                              Get.to(() => const PreviewImageScreen(),
                                  arguments: [Enums.BREED, item]);
                            },
                            child: Chip(
                                label: TextComponent(
                                  "Show Random",
                                  fontSize: k14FontSize,
                                  padding: EdgeInsets.zero,
                                )),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(() => const BreedImageListPage(),
                                  arguments: item);
                            },
                            child: Chip(
                                label: TextComponent(
                                  "Show List by breed",
                                  fontSize: k14FontSize,
                                  padding: EdgeInsets.zero,
                                )),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(() => const SubBreedListPage(),
                                  arguments: item);
                            },
                            child: Chip(
                                label: TextComponent(
                                  "Show sub-breed list",
                                  fontSize: k14FontSize,
                                  padding: EdgeInsets.zero,
                                )),
                          )
                        ],
                      ))
                ),
              );
            }));
      }),
    );
  }
}
