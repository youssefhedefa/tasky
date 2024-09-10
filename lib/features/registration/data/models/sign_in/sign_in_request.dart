class SignInRequestModel {
  SignInRequestModel({
    required this.phone,
    required this.password,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });

  final String? phone;
  final String? password;
  final String? displayName;
  final num? experienceYears;
  final String? address;
  final String? level;

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
    "displayName": displayName,
    "experienceYears": experienceYears,
    "address": address,
    "level": level,
  };

}

/*
{
	"phone": "+201010558259",
	"password": "123456",
	"displayName": "Morad Abdelgaber",
	"experienceYears": 10,
	"address": "Mit ghamr , Dakahlia , Egypt",
	"level": "senior"
}*/