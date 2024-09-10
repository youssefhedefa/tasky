import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/di.dart';
import 'package:tasky/core/routing/custom_page_route.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/features/home/presentation/home_view.dart';
import 'package:tasky/features/home/presentation/manager/log_out_cubit/log_out_cubit.dart';
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
            ],
              child: const HomeView(),
          ),
        );
      default:
        return null;
    }
  }
}
