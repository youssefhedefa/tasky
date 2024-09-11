import 'package:tasky/features/home/domain/entities/profile_entity.dart';

abstract class ProfileStates{}

class ProfileInitialState extends ProfileStates{}

class ProfileLoadingState extends ProfileStates{}

class ProfileSuccessState extends ProfileStates{
  final ProfileEntity profileEntity;

  ProfileSuccessState({required this.profileEntity});
}

class ProfileFailedState extends ProfileStates{
  final String error;

  ProfileFailedState({required this.error});
}