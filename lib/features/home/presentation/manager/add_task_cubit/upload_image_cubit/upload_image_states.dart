abstract class UploadImageStates{}

class UploadImageInitialState extends UploadImageStates{}

class UploadImageLoadingState extends UploadImageStates{}

class UploadImageSuccessState extends UploadImageStates{
  final String imageUrl;

  UploadImageSuccessState({required this.imageUrl});
}

class UploadImageErrorState extends UploadImageStates{
  final String error;

  UploadImageErrorState({required this.error});
}