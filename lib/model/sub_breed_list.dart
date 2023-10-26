class SubBreedList {
  final List<String>? message;
  final String? status;

  SubBreedList({
    this.message,
    this.status,
  });

  SubBreedList.fromJson(Map<String, dynamic> json)
      : message = (json['message'] as List?)?.map((dynamic e) => e as String).toList(),
        status = json['status'] as String?;

  Map<String, dynamic> toJson() => {
    'message' : message,
    'status' : status
  };
}