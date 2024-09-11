import 'package:bloc/bloc.dart';
import 'package:tasky/core/components/constances.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';
import 'package:tasky/features/home/presentation/manager/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final HomeRepo repo;
  ProfileCubit({required this.repo}) : super(ProfileInitialState());

  final List<String> profileList = [
    AppConstances.profileName,
    AppConstances.profilePhone,
    AppConstances.profileLevel,
    AppConstances.profileYears,
    AppConstances.profileLocation,
  ];

  void getProfile() async {
    emit(ProfileLoadingState());
    final response = await repo.getProfile();
    response.fold((profileEntity) {
      emit(ProfileSuccessState(profileEntity: profileEntity));
    }, (failure) {
      emit(ProfileFailedState(
          error: failure.failure.message ?? 'An error occurred'));
    });
  }
}
