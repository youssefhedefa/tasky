class LogOutRequestModel {
  LogOutRequestModel({
    required this.token,
  });

  final String token;

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class LogOutResponseModel {
  LogOutResponseModel({
    required this.success,
  });

  final bool success;

  factory LogOutResponseModel.fromJson(Map<String, dynamic> json) =>
      LogOutResponseModel(
        success: json["success"],
      );
}