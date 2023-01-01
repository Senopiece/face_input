// face-controlled slider

import 'package:face_input/models.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:face_input/face_input.dart' as face_input;
import 'package:permission_handler/permission_handler.dart';

class FCSlider extends StatefulWidget {
  const FCSlider({super.key});

  @override
  State<FCSlider> createState() => _FCSliderState();
}

class _FCSliderState extends State<FCSlider> {
  double _headAngle = 0.5;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // permissions
    PermissionStatus cameraPermissionStatus;
    do {
      cameraPermissionStatus = await Permission.camera.request();
      if (cameraPermissionStatus == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    } while (cameraPermissionStatus != PermissionStatus.granted);

    // face input
    Stream<FaceState> stream = await face_input.create();
    stream.listen((event) {
      setState(() {
        _headAngle = (event.headEulerAngleY + 40) / 80;
        _headAngle = _headAngle <= 0 ? 0 : _headAngle;
        _headAngle = _headAngle > 1 ? 1 : _headAngle;
      });
    }, onError: (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _headAngle,
      onChanged: (double value) {},
    );
  }
}
