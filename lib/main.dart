import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'features/show_breed_list/data/data_sources/remote_data_source.dart';
import 'features/show_breed_list/data/respositories/breed_source_repository.dart';
import 'features/show_breed_list/domain/repositories/breed_repository.dart';
import 'features/show_breed_list/domain/usecases/get_breed_list.dart';
import 'features/show_breed_list/presentation/controllers/breed_controller.dart';
import 'features/show_breed_list/presentation/ui/breed_list_page.dart';

void main() {
  final RemoteBreedDataSource dataSource = RemoteBreedDataSource();
  final BreedRepository repository = BreedRepositoryImpl(dataSource);
  final GetBreedList getBreedList = GetBreedList(repository);

  Get.put(BreedListController(getBreedList));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dog Breeds',
      home: BreedListPage(),
    );
  }
}
