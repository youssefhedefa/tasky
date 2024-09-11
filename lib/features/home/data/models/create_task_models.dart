class AddTaskRequestModel {
  AddTaskRequestModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.dueDate,
  });

  final String? image;
  final String? title;
  final String? desc;
  final String? priority;
  final DateTime? dueDate;

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "desc": desc,
        "priority": priority,
        "dueDate":
            "${dueDate?.year.toString().padLeft(4, '0')}-${dueDate?.month.toString().padLeft(2, '0')}-${dueDate?.day.toString().padLeft(2, '0')}",
      };
}


class AddTaskResponseModel {
  AddTaskResponseModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.user,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? image;
  final String? title;
  final String? desc;
  final String? priority;
  final String? status;
  final String? user;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;

  factory AddTaskResponseModel.fromJson(Map<String, dynamic> json){
    return AddTaskResponseModel(
      image: json["image"],
      title: json["title"],
      desc: json["desc"],
      priority: json["priority"],
      status: json["status"],
      user: json["user"],
      id: json["_id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

