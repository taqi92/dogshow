import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../controller/dogs_controller.dart';

class PreviewImageScreen extends StatefulWidget {
  const PreviewImageScreen({super.key});

  @override
  State<PreviewImageScreen> createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
  final _dogsController = Get.put(DogController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //_dogsController.callGetRandomImageByBreed();

    _dogsController.callGetRandomImageBySubBreed();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DogController>(builder: (controller) {
      return _dogsController.image.value != null
          ? Image.network(_dogsController.image.value!)
          : Center(child: Text("No Image"));
    });
  }
}
