import 'package:tasky/features/home/domain/entities/task_entity.dart';

abstract class QrStates {}

class QrInitialState extends QrStates {}

class QrLoadingState extends QrStates {}

class QrSuccessState extends QrStates {
  final TaskEntity qrData;

  QrSuccessState({required this.qrData});
}

class QrErrorState extends QrStates {
  final String error;

  QrErrorState({required this.error});
}

