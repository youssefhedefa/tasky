import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/components/constances.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/upload_image_cubit/upload_image_cubit.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/upload_image_cubit/upload_image_states.dart';

class ImageSelectionContainer extends StatelessWidget {
  const ImageSelectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      radius: const Radius.circular(12),
      borderType: BorderType.RRect,
      color: AppColorHelper.primaryColor,
      strokeWidth: 2,
      child: BlocBuilder<UploadImageCubit, UploadImageStates>(
          builder: (context, state) {
        if (state is UploadImageLoadingState) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: CircularProgressIndicator(
                color: AppColorHelper.primaryColor,
              ),
            ),
          );
        }
        if(state is UploadImageSuccessState){
          context.read<AddTaskCubit>().image = AppConstances.baseImageUrlViewer + state.imageUrl;
          return CachedNetworkImage(
            imageUrl: AppConstances.baseImageUrlViewer + state.imageUrl,
            imageBuilder: (context, imageProvider) =>  Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    AppConstances.baseImageUrlViewer + state.imageUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (context, url) => SizedBox(
              width: 150.w,
              height: 150.h,
              child: const CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          );
        }
        return GestureDetector(
          onTap: () {
            context.read<UploadImageCubit>().pickImages().then((value) {
              context
                  .read<UploadImageCubit>()
                  .emitUploadImageStates(image: value);
            }).catchError((e) {
              print(e);
            });
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: AppColorHelper.primaryColor,
                  size: 30.sp,
                ),
                const SizedBox(width: 8),
                Text(
                  'Add Img',
                  style: AppTextStyleHelper.font19BoldPrimary,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
