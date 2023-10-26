class RandomImageModel {
  final String? message;
  final String? status;

  RandomImageModel({
    this.message,
    this.status,
  });

  RandomImageModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        status = json['status'] as String?;

  Map<String, dynamic> toJson() => {
    'message' : message,
    'status' : status
  };
}