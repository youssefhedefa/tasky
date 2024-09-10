import 'package:flutter/material.dart';
import 'package:tasky/features/on_boarding/presentation/on_boarding_view.dart';

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: const OnBoardingView(),
    );
  }
}
