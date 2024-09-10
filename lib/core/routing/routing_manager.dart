import 'package:flutter/material.dart';
import 'package:tasky/core/routing/custom_page_route.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/features/on_boarding/presentation/on_boarding_view.dart';
import 'package:tasky/features/resistration/presentation/forms/log_in_form.dart';
import 'package:tasky/features/resistration/presentation/forms/sign_up.dart';

class AppRoutingManager {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutingConstances.onboarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case AppRoutingConstances.login:
        return CustomPageRoute(
          child: const LogInForm(),
          axisDirection: AxisDirection.left,
        );
      case AppRoutingConstances.signup:
        return CustomPageRoute(
          child: const SignUpForm(),
          axisDirection: AxisDirection.left,
        );
      default:
        return null;
    }
  }
}
