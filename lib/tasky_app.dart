import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/core/routing/routing_manager.dart';

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Tasky',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ).copyWith(
            textTheme: ThemeData().textTheme.apply(
                  fontFamily: 'DM Sans',
                ),
          ),
          onGenerateRoute: AppRoutingManager().onGenerateRoute,
          initialRoute: AppRoutingConstances.onboarding,
          //home: const OnBoardingView(),
        );
      },
    );
  }
}
