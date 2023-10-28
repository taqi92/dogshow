
class BreedModel {
  final Map<String, List<String>> message;
  final String status;

  BreedModel({required this.message, required this.status});

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    final status = json['status'] as String;
    final Map<String, dynamic> messageMap = json['message'];

    Map<String, List<String>> breedNames = {};
    messageMap.forEach((key, value) {
      if (value is List) {
        breedNames[key] = (value as List).cast<String>();
      }
    });

    return BreedModel(message: breedNames, status: status);
  }
}
