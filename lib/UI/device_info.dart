import 'package:bluetooth_scanning/Provider/devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';

class DeviceInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(42),
          child: AppBar(
            primary: true,
            centerTitle: true,
            title: Text(Provider.of<Devices>(context).selectedDevice.name),
          ),
        ),
        body: Column(
          children: [
            createDeviceMac(Provider.of<Devices>(context).selectedDevice)
          ],
        ));
  }

  Widget createDeviceMac(BluetoothDevice device) {
    return Center(child: Text('Mac address: ' + device.id.toString()));
  }
}
