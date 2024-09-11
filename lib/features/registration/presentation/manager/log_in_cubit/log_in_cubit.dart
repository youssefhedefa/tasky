import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:tasky/core/networking/local_storage/local_storage.dart';
import 'package:tasky/features/registration/data/models/log_in/log_in_request.dart';
import 'package:tasky/features/registration/domain/repo/registration_repo.dart';
import 'package:tasky/features/registration/presentation/manager/log_in_cubit/log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final RegistrationRepo repo;

  LogInCubit({required this.repo}) : super(LogInInitialState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  logInEmitted({required String phone, required String password}) async {
    emit(LogInLoadingState());
    final result = await repo.logIn(
        logInModel: LogInRequestModel(phone: phone, password: password));
    result.fold(
      (success) {
        AppLocalSecureStorage.saveAccessToken(token: success.accessToken ?? '');
        AppLocalSecureStorage.saveRefreshToken(token: success.refreshToken ?? '');
        emit(LogInSuccessState());
      },
      (error) => emit(LogInErrorState(
          message: error.failure.message ?? 'please try again later')),
    );
  }
}
