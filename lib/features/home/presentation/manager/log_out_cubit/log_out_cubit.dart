import 'package:bloc/bloc.dart';
import 'package:tasky/core/networking/local_storage/local_storage.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';
import 'package:tasky/features/home/presentation/manager/log_out_cubit/log_out_states.dart';

class LogOutCubit extends Cubit<LogOutState>{

  final HomeRepo repo;

  LogOutCubit({required this.repo}) : super(LogOutInitialState());

  logOutEmitted()async{
    emit(LogOutLoadingState());
    final response = await repo.logOut();
    response.fold((success) async {
      await AppLocalSecureStorage.clearAll();
      emit(LogOutSuccessState());
    }, (failure) {
      emit(LogOutErrorState(message: failure.failure.message ?? 'An error occurred'));
    });
  }
}