class BreedModel {
  final Map<String, dynamic> breeds;

  BreedModel(this.breeds);

  Map<String, List<String>> get breedNames =>
      breeds.map((key, value) => MapEntry(key, (value as List).cast<String>() ?? []));
}
