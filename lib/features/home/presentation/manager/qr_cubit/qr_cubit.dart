import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/networking/qr_reader_function.dart';
import 'package:tasky/features/home/data/mapper/tasks_mapper.dart';
import 'package:tasky/features/home/presentation/manager/qr_cubit/qr_states.dart';

class QrCubit extends Cubit<QrStates> {
  final QRReaderRequestImpl qr;

  QrCubit({required this.qr}) : super(QrInitialState());

  Future generateTaskByQrCode({required String url}) async {
    emit(QrLoadingState());
    final response = await qr.getTaskByQrCode(url: url);
    response.fold(
      (data) => emit(
        QrSuccessState(
          qrData: TasksMapper.taskMapper(
            task: data,
          ),
        ),
      ),
      (error) => emit(
        QrErrorState(error: error.failure.message ?? 'Error'),
      ),
    );
  }
}
