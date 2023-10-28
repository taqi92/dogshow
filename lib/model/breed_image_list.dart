class BreedImageLIst {
  final List<String>? message;
  final String? status;

  BreedImageLIst({
    this.message,
    this.status,
  });

  BreedImageLIst.fromJson(Map<String, dynamic> json)
      : message = (json['message'] as List?)?.map((dynamic e) => e as String).toList(),
        status = json['status'] as String?;

  Map<String, dynamic> toJson() => {
    'message' : message,
    'status' : status
  };
}