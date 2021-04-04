import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class Devices extends ChangeNotifier {
  Devices() {
    devices = [];
    scanning = false;
    scanForDevices();
  }
  bool scanning;
  List<BluetoothDevice> devices;
  BluetoothDevice selectedDevice;

  StreamSubscription<List<ScanResult>> subscription;

  Future<void> scanForDevices() async {
    //reset list
    devices = [];
    if (subscription != null) {
      await subscription.cancel();
    }
    await FlutterBlue.instance.startScan(
        scanMode: ScanMode.lowPower,
        timeout: Duration(seconds: 4),
        allowDuplicates: false);

// Listen to scan results
    subscription = FlutterBlue.instance.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult result in results) {
        devices.add(result.device);
      }
    });

    notifyListeners();
  }

  // change the currently selected device
  selectDevice(BluetoothDevice device) {
    selectedDevice = device;
    notifyListeners();
  }
}
