import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky/core/networking/dio_factory.dart';
import 'package:tasky/core/networking/qr_reader_function.dart';
import 'package:tasky/features/home/data/apis/home_api_services.dart';
import 'package:tasky/features/home/data/repo_imple/home_repo_imple.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/upload_image_cubit/upload_image_cubit.dart';
import 'package:tasky/features/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasky/features/home/presentation/manager/log_out_cubit/log_out_cubit.dart';
import 'package:tasky/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:tasky/features/home/presentation/manager/qr_cubit/qr_cubit.dart';
import 'package:tasky/features/registration/data/apis/registration_api_services.dart';
import 'package:tasky/features/registration/data/repo_imple/registration_repo_imple.dart';
import 'package:tasky/features/registration/domain/repo/registration_repo.dart';
import 'package:tasky/features/registration/presentation/manager/log_in_cubit/log_in_cubit.dart';
import 'package:tasky/features/registration/presentation/manager/sign_in_cubit/sign_in_cubit.dart';

var getIt = GetIt.instance;

void setupDependencyInjection() async {
  Dio dio = await DioFactory.getDio();

  // registration
  getIt.registerLazySingleton<RegistrationApiServices>(
      () => RegistrationApiServices(dio));

  getIt.registerLazySingleton<RegistrationRepo>(
    () => RegistrationRepoImple(apiServices: getIt<RegistrationApiServices>()),
  );

  // sign up

  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(repo: getIt<RegistrationRepo>()),
  );

  // log in

  getIt.registerFactory<LogInCubit>(
    () => LogInCubit(repo: getIt<RegistrationRepo>()),
  );

  // home

  getIt.registerLazySingleton<HomeApiServices>(
      () => HomeApiServices(dio));

  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepoImple(apiServices: getIt<HomeApiServices>()),
    );

  //log out

  getIt.registerFactory<LogOutCubit>(
    () => LogOutCubit(repo: getIt<HomeRepo>()),
  );

  // profile

  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(repo: getIt<HomeRepo>()),
  );

  // upload image

  getIt.registerFactory<UploadImageCubit>(
    () => UploadImageCubit(repo: getIt<HomeRepo>()),
  );

  // add task

  getIt.registerFactory<AddTaskCubit>(
    () => AddTaskCubit(repo: getIt<HomeRepo>()),
  );

  // home

  getIt.registerFactory<GetTasksCubit>(
    () => GetTasksCubit(repo: getIt<HomeRepo>()),
  );

  // edit task

  getIt.registerFactory<EditTaskCubit>(
    () => EditTaskCubit(repo: getIt<HomeRepo>()),
  );

  // delete

  getIt.registerFactory<DeleteTaskCubit>(
    () => DeleteTaskCubit(repo: getIt<HomeRepo>()),
  );

  // qr reader

  getIt.registerLazySingleton<QRReaderRequestImpl>(
    () => QRReaderRequestImpl(dio: dio),
  );

  getIt.registerFactory<QrCubit>(
    () => QrCubit(qr: getIt<QRReaderRequestImpl>()),
  );


}
