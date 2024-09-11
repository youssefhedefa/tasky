import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class CustomQRGenerator extends StatelessWidget {
  const CustomQRGenerator({super.key, required this.request});

  final String request;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: FittedBox(
        child: QrImageView(
          data: request,
          version: QrVersions.auto,
          size: MediaQuery.sizeOf(context).width,
        ),
      )
    );
  }
}
