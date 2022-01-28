import 'package:motiweights/main.dart';
import 'package:flutter_blue/flutter_blue.dart';

const scanDuration = Duration(seconds: 4);

class DeviceFunctions {
  Future scanForDevice() async {
    List<BluetoothDevice> deviceList = [];
    flutterBlue.startScan(timeout: scanDuration);
    Future.delayed(scanDuration, () {
      flutterBlue.scanResults.listen((List<ScanResult> results) {
        for (ScanResult result in results) {
          if (result.device.name.contains('motiweight')) {
            deviceList.add(result.device);
            // print(deviceList);
          }
        }
      });
      return deviceList;
    });
  }
}
