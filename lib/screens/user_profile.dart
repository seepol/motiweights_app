import 'package:flutter/material.dart';
import 'package:motiweights/components/bottom_button.dart';
import 'package:motiweights/components/reusable_card.dart';
import 'package:motiweights/utilities/constants.dart';
import 'package:motiweights/components/custom_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserPage extends StatefulWidget {
  static const String id = 'user_page';
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _firestore = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  String firstName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColour,
        leading: const AppBarLogo(),
        title: const Text('Settings', style: kAppbarTitleTextStyle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Home',
            onPressed: () {
              Navigator.pop(context);
              // await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ReusableCard(
              colour: kActiveCardColour,
              cardChild: TextField(
                textAlign: TextAlign.center,
                decoration: kInputDecoration.copyWith(hintText: 'First name'),
                onChanged: (value) {
                  firstName = value;
                },
              ),
              onPress: () {}),
          BottomButton(
              onTap: () {
                _firestore.collection('users').add({
                  'firstname': firstName,
                  'uid': currentUser!.uid,
                });
                Navigator.pop(context);
              },
              buttonTitle: 'Save'),
          BottomButton(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              buttonTitle: 'Sign Out'),
        ],
      ),
    );
  }
}
