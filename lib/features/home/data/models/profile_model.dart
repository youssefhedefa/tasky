class ProfileResponseModel {
  ProfileResponseModel({
    required this.id,
    required this.displayName,
    required this.username,
    required this.roles,
    required this.active,
    required this.experienceYears,
    required this.address,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? displayName;
  final String? username;
  final List<String> roles;
  final bool? active;
  final num? experienceYears;
  final String? address;
  final String? level;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json){
    return ProfileResponseModel(
      id: json["_id"],
      displayName: json["displayName"],
      username: json["username"],
      roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
      active: json["active"],
      experienceYears: json["experienceYears"],
      address: json["address"],
      level: json["level"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}
