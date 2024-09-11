class UploadImageResponseModel{
  final String image;

  UploadImageResponseModel({required this.image});

  factory UploadImageResponseModel.fromJson(Map<String, dynamic> json){
    return UploadImageResponseModel(
        image: json['image']
    );
  }
}