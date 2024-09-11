import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/bloc_observer.dart';
import 'package:tasky/core/di/di.dart';
import 'package:tasky/core/networking/local_storage/local_storage.dart';
import 'package:tasky/tasky_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  Bloc.observer = MyBlocObserver();
  await AppLocalSecureStorage.initStorage();
  checkUserLoggedIn();
  runApp(const TaskyApp());
}
bool isLoggedInUser = false;
checkUserLoggedIn() {
  final token =  AppLocalSecureStorage.getAccessToken();
  print('token: $token');
  if (token != '') {
    isLoggedInUser = true;
  }
}