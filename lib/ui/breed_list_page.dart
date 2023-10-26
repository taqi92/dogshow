import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dogs_controller.dart';

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
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: 2 / 3,
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
                          Text(item),
                          TextButton(
                              onPressed: () {
                                /*_dogsController
                                      .getBreedImages("hound");
                                  Get.to(() =>
                                      BreedImagesPage(breed: Breed("hound")));*/
                              },
                              child: Text("Show Random")),
                          TextButton(
                              onPressed: () {},
                              child: Text("Show List by breed")),
                          TextButton(
                              onPressed: () {}, child: Text("Show sub-breed"))
                        ],
                      )),
                ),
              );
            }));
      }),
    );
  }
}
