import 'package:flutter/material.dart';
import 'package:motiweights/main.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:motiweights/components/reusable_card.dart';
import 'package:motiweights/utilities/constants.dart';

const scanDuration = Duration(seconds: 4);

class DeviceBrain {
  List<BluetoothDevice> _deviceList = [];
  List<BluetoothDevice> _connectedDeviceList = [];

  final _myService = "9a48ecba-2e92-082f-c079-9e75aae428b1";
  final _myChar = "2d2f88c4-f244-5a80-21f1-ee0224e80658";

  ReusableCard deviceButton({required deviceName, required deviceAddress}) {
    return ReusableCard(
      cardChild: Row(
        children: <Widget>[
          const Padding(
            padding: listPadding,
            child: cardIcon,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: listPadding,
                child: Text('Name: $deviceName\nID: $deviceAddress',
                    style: kLabelTextStyle),
              ),
            ],
          ),
        ],
      ),
      onPress: () {
        findDevices();
      },
      colour: kActiveCardColour,
    );
  }

  ListView createDeviceList() {
    return ListView.builder(
      padding: listPadding,
      itemCount: _connectedDeviceList.length,
      itemBuilder: (BuildContext context, int index) {
        return deviceButton(
            deviceName: _connectedDeviceList[index].name,
            deviceAddress: _connectedDeviceList[index].id.id);
      },
    );
  }

  void findDevices() {
    _deviceList.clear();
    flutterBlue.startScan(timeout: scanDuration);
    flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        if (r.device.name.contains('motiweight')) {
          _deviceList.add(r.device);
          connectDevices(r.device);
        }
      }
    });
  }

  void connectDevices(BluetoothDevice device) async {
    try {
      await device.connect();
    } catch (e) {
      // print(e);
    } finally {
      List<BluetoothService> services = await device.discoverServices();
      enableCharNotify(services);
      _connectedDeviceList = await FlutterBlue.instance.connectedDevices;
    }
  }

  void enableCharNotify(List<BluetoothService> services) async {
    for (BluetoothService service in services) {
      if (service.uuid.toString() == _myService) {
        var characteristics = service.characteristics;
        for (BluetoothCharacteristic characteristic in characteristics) {
          print(characteristic.uuid);
          if (characteristic.uuid.toString() == _myChar) {
            await characteristic.setNotifyValue(true);
            characteristic.value.listen(
              (value) {
                print(value);
              },
            );
          }
        }
      }
    }
  }
}
