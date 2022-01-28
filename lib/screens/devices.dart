import 'package:flutter/material.dart';
import 'package:motiweights/main.dart';
import 'package:motiweights/components/bottom_button.dart';
import 'package:motiweights/components/custom_appbar.dart';
import 'package:motiweights/utilities/constants.dart';

class DevicesPage extends StatefulWidget {
  static const String id = 'devices_page';
  const DevicesPage({Key? key}) : super(key: key);

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColour,
        leading: const AppBarLogo(),
        title: const Text('Devices', style: kAppbarTitleTextStyle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Sign Out',
            onPressed: () {
              Navigator.pop(context);
              // await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: deviceBrain.createDeviceList(),
          ),
          BottomButton(
              onTap: () {
                setState(
                  () {
                    deviceBrain.findDevices();
                  },
                );
              },
              buttonTitle: 'Search for devices')
        ],
      ),
    );
  }
}
