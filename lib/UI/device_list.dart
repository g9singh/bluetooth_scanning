import 'package:bluetooth_scanning/Provider/devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
import '../Resources/constants.dart';

class DeviceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(42),
        child: AppBar(
          primary: true,
          centerTitle: true,
          title: Text(RoutePaths.Devices),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: Provider.of<Devices>(context, listen: false).scanForDevices,
        child: ListView.separated(
          itemCount: Provider.of<Devices>(context).devices.length,
          separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemBuilder: (context, i) => createDeviceInfo(
              Provider.of<Devices>(context, listen: false).devices[i], context),
        ),
      ),
    );
  }

  Widget createDeviceInfo(BluetoothDevice device, BuildContext context) {
    return ListTile(
      title: Text(device.name.toString()),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Provider.of<Devices>(context, listen: false).selectDevice(device);
        Navigator.pushNamed(context, RoutePaths.DeviceInfo);
      },
    );
  }
}
