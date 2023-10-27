import 'package:dog_show/components/header_component.dart';
import 'package:dog_show/components/text_component.dart';
import 'package:dog_show/model/breed_image_list.dart';
import 'package:dog_show/ui/preview_image_screen.dart';
import 'package:dog_show/ui/sub_breed_image_list_page.dart';
import 'package:dog_show/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/base_state.dart';
import '../controller/dogs_controller.dart';
import '../utils/enums.dart';
import 'breed_image_list_page.dart';

class SubBreedListPage extends StatefulWidget {
  const SubBreedListPage({super.key});

  @override
  State<SubBreedListPage> createState() => _SubBreedListPageState();
}

class _SubBreedListPageState extends BaseState<SubBreedListPage> {
  final _dogsController = Get.put(DogController());
  var breed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.arguments != null) {
      breed = Get.arguments;
      _dogsController.callGetSubBreedList(breed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: myAppBar(
          title: 'Dog Sub Breeds',
        ),
        body: HeaderComponent(
          GetBuilder<DogController>(builder: (controller) {
            return _dogsController.subBreedNameList.isEmpty
                ? const Center(child: TextComponent("No breeds to show"))
                : kIsWeb ? GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 5,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: 2.5 / 3,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: List.generate(
                        _dogsController.subBreedNameList.length, (index) {
                      var item = _dogsController.subBreedNameList[index];
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
                                  Get.to(() => PreviewImageScreen(),
                                      arguments: [
                                        Enums.SUBBREED,
                                        item,
                                        breed
                                      ]);
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
                                  Get.to(() => SubBreedImageListPage(),
                                      arguments: [breed, item]);
                                },
                                child: const Chip(
                                  label: TextComponent(
                                    "List by sub-breed",
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
                            ],
                          ),
                        ),
                      );
                    })
            ) : GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 2.5 / 3,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: List.generate(
                    _dogsController.subBreedNameList.length, (index) {
                  var item = _dogsController.subBreedNameList[index];
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
                              Get.to(() => PreviewImageScreen(),
                                  arguments: [
                                    Enums.SUBBREED,
                                    item,
                                    breed
                                  ]);
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
                              Get.to(() => SubBreedImageListPage(),
                                  arguments: [breed, item]);
                            },
                            child: const Chip(
                              label: TextComponent(
                                "List by sub-breed",
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
                        ],
                      ),
                    ),
                  );
                })
            );
          }),
        ));
  }
}
