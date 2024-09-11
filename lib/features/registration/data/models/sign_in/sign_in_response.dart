class SignInResponseModel {
  SignInResponseModel({
    required this.id,
    required this.displayName,
    required this.accessToken,
    required this.refreshToken,
  });

  final String? id;
  final String? displayName;
  final String? accessToken;
  final String? refreshToken;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json){
    return SignInResponseModel(
      id: json["_id"],
      displayName: json["displayName"],
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
    );
  }

}

/*
{
	"_id": "66e056c1ed5aa194fac36a3a",
	"displayName": "Morad Abdelgaber",
	"access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NmUwNTZjMWVkNWFhMTk0ZmFjMzZhM2EiLCJpYXQiOjE3MjU5NzgzMDUsImV4cCI6MTcyNTk3ODkwNX0.Pkd3Du5wjGEVV77SN2v2qn1WXuWUidzKorPQGWEOCvs",
	"refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NmUwNTZjMWVkNWFhMTk0ZmFjMzZhM2EiLCJpYXQiOjE3MjU5NzgzMDV9.JxQPJOuZ7ayXwS0vC9uXUOwy8XY0f5RFdFtpQDePb08"
}*/