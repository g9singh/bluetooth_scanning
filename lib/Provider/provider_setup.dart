import 'package:bluetooth_scanning/Provider/devices.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<Devices>(
    create: (_) {
      return Devices();
    },
    lazy: false,
  )
];
