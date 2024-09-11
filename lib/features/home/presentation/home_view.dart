import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/components/task_states_enum.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasky/features/home/presentation/manager/qr_cubit/qr_cubit.dart';
import 'package:tasky/features/home/presentation/manager/qr_cubit/qr_states.dart';
import 'package:tasky/features/home/presentation/widgets/home_app_bar.dart';
import 'package:tasky/features/home/presentation/widgets/task_states_list.dart';
import 'package:tasky/features/home/presentation/widgets/tasks_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TaskStatesEnum selectedState = TaskStatesEnum.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'qr',
            onPressed: () {
              qrScan();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Icon(
              Icons.qr_code,
              color: AppColorHelper.primaryColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 14),
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutingConstances.addTask)
                  .then((value) {
                context.read<GetTasksCubit>().getTasks();
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            backgroundColor: AppColorHelper.primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Tasks',
                style: AppTextStyleHelper.font14BoldGrey,
              ),
              const SizedBox(height: 16),
              TaskStatesList(
                onTaskStateSelected: (state) {
                  print(state);
                  setState(() {
                    selectedState = state;
                  });
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TasksList(
                  state: selectedState,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  qrScan() async {
    try {
      await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      ).then((value) {
        context.read<QrCubit>().generateTaskByQrCode(url: value).then((value) {
          context.read<QrCubit>().stream.listen((state) {
            if (state is QrSuccessState) {
              print(state.qrData);
              Navigator.pushNamed(
                context,
                AppRoutingConstances.viewTask,
                arguments: state.qrData,
              ).then(
                (value) => context.read<GetTasksCubit>().getTasks(),
              );
            }
          });
        });
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please try again!'),
          ),
        );
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please try again! ${e.message}'),
        ),
      );
    }
  }
}
