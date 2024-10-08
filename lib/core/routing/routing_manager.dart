import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/di.dart';
import 'package:tasky/core/routing/custom_page_route.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/features/home/domain/entities/task_entity.dart';
import 'package:tasky/features/home/presentation/add_task_view.dart';
import 'package:tasky/features/home/presentation/home_view.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/upload_image_cubit/upload_image_cubit.dart';
import 'package:tasky/features/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasky/features/home/presentation/manager/log_out_cubit/log_out_cubit.dart';
import 'package:tasky/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:tasky/features/home/presentation/manager/qr_cubit/qr_cubit.dart';
import 'package:tasky/features/home/presentation/profile_view.dart';
import 'package:tasky/features/home/presentation/task_details_view.dart';
import 'package:tasky/features/on_boarding/presentation/on_boarding_view.dart';
import 'package:tasky/features/registration/presentation/forms/log_in_form.dart';
import 'package:tasky/features/registration/presentation/forms/sign_up.dart';
import 'package:tasky/features/registration/presentation/manager/log_in_cubit/log_in_cubit.dart';
import 'package:tasky/features/registration/presentation/manager/sign_in_cubit/sign_in_cubit.dart';

class AppRoutingManager {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutingConstances.onboarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case AppRoutingConstances.login:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => getIt<LogInCubit>(),
            child: const LogInForm(),
          ),
          axisDirection: AxisDirection.left,
        );
      case AppRoutingConstances.signup:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpForm(),
          ),
          axisDirection: AxisDirection.left,
        );
      case AppRoutingConstances.home:
        return CustomPageRoute(
          axisDirection: AxisDirection.left,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<LogOutCubit>()),
              BlocProvider(create: (context) => getIt<QrCubit>()),
              BlocProvider(
                  create: (context) => getIt<GetTasksCubit>()..getTasks()),

            ],
            child: const HomeView(),
          ),
        );
      case AppRoutingConstances.profile:
        return CustomPageRoute(
          axisDirection: AxisDirection.left,
          child: BlocProvider(
            create: (context) => getIt<ProfileCubit>()..getProfile(),
            child: const ProfileView(),
          ),
        );
      case AppRoutingConstances.addTask:
        return CustomPageRoute(
          axisDirection: AxisDirection.left,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<UploadImageCubit>()),
              BlocProvider(create: (context) => getIt<AddTaskCubit>()),
            ],
            child: const AddTaskView(),
          ),
        );
      case AppRoutingConstances.viewTask:
        TaskEntity task = settings.arguments as TaskEntity;
        return CustomPageRoute(
          axisDirection: AxisDirection.left,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<EditTaskCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<DeleteTaskCubit>(),
              ),
            ],
            child: TaskDetailsView(
              task: task,
            ),
          ),
        );
      default:
        return null;
    }
  }
}
