import 'package:bluetooth_scanning/UI/device_info.dart';
import 'package:bluetooth_scanning/UI/device_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Resources/constants.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.DeviceInfo:
        return MaterialPageRoute(builder: (_) {
          return DeviceInfo();
        });
      case RoutePaths.Devices:
        return MaterialPageRoute(builder: (_) {
          return DeviceList();
        });
    }
  }
}
