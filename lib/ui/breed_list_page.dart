import 'dart:io';

import 'package:dog_show/components/header_component.dart';
import 'package:dog_show/components/text_component.dart';
import 'package:dog_show/model/breed_image_list.dart';
import 'package:dog_show/ui/preview_image_screen.dart';
import 'package:dog_show/ui/sub_breed_list_page.dart';
import 'package:dog_show/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/base_state.dart';
import '../controller/dogs_controller.dart';
import '../utils/enums.dart';
import 'breed_image_list_page.dart';

class BreedListPage extends StatefulWidget {
  const BreedListPage({super.key});

  @override
  State<BreedListPage> createState() => _BreedListPageState();
}

class _BreedListPageState extends BaseState<BreedListPage> {
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
        appBar: myAppBar(title: "Breed List", isNavigate: false),
        backgroundColor: kPrimaryColor,
        body: HeaderComponent(
          GetBuilder<DogController>(builder: (controller) {
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.isLoaded) {
              return kIsWeb
                  ? GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 5,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      childAspectRatio: 0.6 / 0.8,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: List.generate(_dogsController.breedList.length,
                          (index) {
                        var item = _dogsController.breedList[index];
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFb87333),
                                  Color(0xFF8a3324)
                                ] //[Colors.blue, Colors.green],
                                    ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextComponent(
                                    item.toUpperCase(),
                                    color: Colors.white,
                                    fontSize: largestFontSize,
                                    fontWeight: boldFontWeight,
                                    textAlign: TextAlign.center,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const PreviewImageScreen(),
                                          arguments: [Enums.BREED, item]);
                                    },
                                    child: const Chip(
                                      label: TextComponent(
                                        "Show Random",
                                        fontSize: k20TitleFontSize,
                                        padding: EdgeInsets.zero,
                                        color: Colors.white,
                                        fontWeight: titleFontWeight,
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const BreedImageListPage(),
                                          arguments: item);
                                    },
                                    child: const Chip(
                                      label: TextComponent(
                                        "Show List by breed",
                                        fontSize: k20TitleFontSize,
                                        padding: EdgeInsets.zero,
                                        color: Colors.white,
                                        fontWeight: titleFontWeight,
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const SubBreedListPage(),
                                          arguments: item);
                                    },
                                    child: const Chip(
                                      label: TextComponent(
                                        "Show sub-breed list",
                                        fontSize: k20TitleFontSize,
                                        padding: EdgeInsets.zero,
                                        color: Colors.white,
                                        fontWeight: titleFontWeight,
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                      backgroundColor: Colors.blueAccent,
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }))
                  : GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      childAspectRatio: 0.6 / 0.8,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: List.generate(_dogsController.breedList.length,
                          (index) {
                        var item = _dogsController.breedList[index];
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFb87333),
                                  Color(0xFF8a3324)
                                ] //[Colors.blue, Colors.green],
                                    ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextComponent(
                                    item.toUpperCase(),
                                    color: Colors.white,
                                    fontWeight: boldFontWeight,
                                    textAlign: TextAlign.center,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const PreviewImageScreen(),
                                          arguments: [Enums.BREED, item]);
                                    },
                                    child: const Chip(
                                      label: TextComponent(
                                        "Show Random",
                                        fontSize: k14FontSize,
                                        padding: EdgeInsets.zero,
                                        color: Colors.white,
                                        fontWeight: titleFontWeight,
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const BreedImageListPage(),
                                          arguments: item);
                                    },
                                    child: const Chip(
                                      label: TextComponent(
                                        "Show List by breed",
                                        fontSize: k14FontSize,
                                        padding: EdgeInsets.zero,
                                        color: Colors.white,
                                        fontWeight: titleFontWeight,
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const SubBreedListPage(),
                                          arguments: item);
                                    },
                                    child: const Chip(
                                      label: TextComponent(
                                        "Show sub-breed list",
                                        fontSize: k14FontSize,
                                        padding: EdgeInsets.zero,
                                        color: Colors.white,
                                        fontWeight: titleFontWeight,
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                      backgroundColor: Colors.blueAccent,
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }));
            } else {
              return TextComponent("Error");
            }
          }),
        ));
  }
}
