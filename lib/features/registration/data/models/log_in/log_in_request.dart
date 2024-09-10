class LogInRequestModel {
  LogInRequestModel({
    required this.phone,
    required this.password,
  });

  final String? phone;
  final String? password;

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
  };

}

/*
{
	"phone": "+201010558269",
	"password": "123456"
}*/