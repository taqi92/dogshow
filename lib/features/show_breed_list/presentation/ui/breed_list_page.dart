import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/breed_controller.dart';

class BreedListPage extends StatelessWidget {
  final BreedListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breeds'),
      ),
      body: Obx(() {
        if (controller.breedList.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 2 / 3,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: List.generate(controller.breedList.length, (index) {
                var item = controller.breedList[index];
                return GestureDetector(
                  onTap: () async {},
                  /*child: Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Card(
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Image.network(
                                            item.image?.fileUrl ?? '',
                                            fit: BoxFit.fill,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            colorBlendMode: BlendMode.darken,
                                            height: 200,
                                            width: SizeConfig.getScreenWidth(
                                                context),
                                          ),
                                          TextComponent(
                                            item.name,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                            fontSize: 18,
                                          ),
                                        ]),
                                  ),
                                ),*/
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
                            Text(item.name),
                            TextButton(onPressed: (){}, child: Text("Show Random")),
                            TextButton(onPressed: (){}, child: Text("Show List by breed")),
                            TextButton(onPressed: (){}, child: Text("Show sub-breed"))
                          ],
                        )),
                  ),
                );
              }));
        }
      }),
    );
  }
}
