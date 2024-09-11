import 'package:tasky/core/components/constances.dart';
import 'package:tasky/features/home/data/models/profile_model.dart';
import 'package:tasky/features/home/domain/entities/profile_entity.dart';

abstract class ProfileMapper{
  static ProfileEntity profileMapper({required ProfileResponseModel model}){
    Map<String,dynamic> profile = {
      AppConstances.profileName: model.displayName ?? 'not set',
      AppConstances.profilePhone: model.username ?? 'not set',
      AppConstances.profileLevel : model.level ?? 'not set',
      AppConstances.profileYears: model.experienceYears.toString(),
      AppConstances.profileLocation: model.address ?? 'not set'
    };

    return ProfileEntity(profile: profile);


    // return ProfileEntity(
    //   name: model.displayName ?? 'not set',
    //   phone: model.username ?? 'not set',
    //   level: model.level ?? 'not set',
    //   years: model.experienceYears.toString(),
    //   address: model.address ?? 'not set',
    // );
  }
}