import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/networking/local_storage/local_storage.dart';
import 'package:tasky/features/registration/data/models/sign_in/sign_in_request.dart';
import 'package:tasky/features/registration/domain/repo/registration_repo.dart';
import 'package:tasky/features/registration/presentation/manager/sign_in_cubit/sign_in_states.dart';

class SignUpCubit extends Cubit<SignInState> {
  final RegistrationRepo repo;

  SignUpCubit({required this.repo}) : super(SignInInitialState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signInEmitted({
    required String name,
    required String phone,
    required num years,
    required String level,
    required String address,
    required String password,
  }) async {
    emit(SignInLoadingState());
    final response = await repo.signIn(
      signInModel: SignInRequestModel(
        phone: phone,
        password: password,
        displayName: name,
        experienceYears: years,
        address: address,
        level: level,
      ),
    );
    response.fold((success) {
      print('Success from sign in $success');
      AppLocalSecureStorage.saveAccessToken(token: success.accessToken ?? '');
      AppLocalSecureStorage.saveRefreshToken(token: success.refreshToken ?? '');
      emit(SignInSuccessState());
    }, (error) {
      emit(SignInErrorState(message: error.failure.message ?? 'please try again later'));
    });
  }
}
