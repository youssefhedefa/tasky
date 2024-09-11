// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/upload_image_cubit/upload_image_states.dart';

class UploadImageCubit extends Cubit<UploadImageStates> {
  final HomeRepo repo;

  UploadImageCubit({required this.repo}) : super(UploadImageInitialState());

  XFile? imageXFile;
  File? imageFile;
  String imageUrl = '';
  FormData? image;
  String? imageMimeType;

  Future<FormData> pickImages() async {
    final ImagePicker picker = ImagePicker();
    XFile? imageX = await picker.pickImage(source: ImageSource.gallery);
    if (imageX!.path.isNotEmpty) {
      imageXFile = imageX;
      imageFile = File(imageXFile!.path);
    }
    imageMimeType = mime(imageFile!.path);
    String name = imageMimeType!.split('/')[0];
    String type = imageMimeType!.split('/')[1];
    image = FormData.fromMap(
      {
        'image': await MultipartFile.fromFile(
          imageFile!.path,
          filename: imageFile!.path.split('/').last,
          contentType: MediaType(name, type),
        ),
      },
    );
    print(image!.fields);
    return image!;
  }

  void emitUploadImageStates({
    required FormData image,
  }) async {
    emit(UploadImageLoadingState());
    final response = await repo.uploadImage(image: image);
    response.fold(
      (success) {
        print(success.image);
        imageUrl = success.image;
        emit(UploadImageSuccessState(
          imageUrl: imageUrl,
        ));
      },
      (r) {
        emit(UploadImageErrorState(error: r.failure.message ?? 'Error'));
      },
    );
  }
}
