import 'package:flutter/material.dart';
import 'package:motiweights/components/bottom_button.dart';
import 'package:motiweights/components/reusable_card.dart';
import 'package:motiweights/utilities/constants.dart';
import 'package:motiweights/services/quotes_api.dart';
import 'package:motiweights/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:motiweights/components/custom_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motiweights/screens/user_profile.dart';
import 'package:flutter_blue/flutter_blue.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String quoteText = "";
  String authorText = "";

  @override
  void initState() {
    super.initState();
    getQuote();
    deviceBrain.findDevices();
  }

  void getQuote() async {
    setState(() {
      quoteText = "";
    });
    var quote = await QuotesAPI().get(endpoint: '/random-quote');
    setState(() {
      quoteText = '"' + quote['quote'] + '"' + ' - ${quote['author']}';
      // authorText = quote['author'];
    });
  }

  Widget quoteCard() {
    if (quoteText == "") {
      return const SpinKitFadingCircle(
        color: Colors.white,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              quoteText,
              style: kLabelTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColour,
        leading: const AppBarLogo(),
        title: const AppBarText(),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () async {
              Navigator.pushNamed(context, UserPage.id);
              // await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ReusableCard(
              colour: kActiveCardColour,
              cardChild: quoteCard(),
              onPress: () {
                getQuote();
              }),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'User Summary',
              style: kLabelTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          ReusableCard(
            colour: kActiveCardColour,
            cardChild: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Workout history',
                style: kSubtitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            onPress: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Connected devices',
              style: kLabelTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          StreamBuilder<List<BluetoothDevice>>(
              stream: Stream.periodic(const Duration(seconds: 2))
                  .asyncMap((_) => FlutterBlue.instance.connectedDevices),
              initialData: [],
              builder: (c, snapshot) {
                if (snapshot.data!.isEmpty) {
                  return ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: const SpinKitFadingCircle(
                        color: Colors.white,
                      ),
                      onPress: () {});
                } else {
                  return Column(
                    children: snapshot.data!
                        .map((d) => deviceBrain.deviceButton(
                              deviceName: d.name,
                              deviceAddress: d.id.toString(),
                            ))
                        .toList(),
                  );
                }
              }),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Workouts',
              style: kLabelTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          ReusableCard(
            colour: kActiveCardColour,
            cardChild: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Popular / recommended',
                style: kSubtitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            onPress: () {},
          ),
          BottomButton(onTap: () {}, buttonTitle: 'Record'),
        ],
      ),
    );
  }
}
