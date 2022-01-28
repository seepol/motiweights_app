import 'package:flutter/material.dart';
import 'package:motiweights/screens/home.dart';
import 'package:motiweights/components/bottom_button.dart';
import 'package:motiweights/components/reusable_card.dart';
import 'package:motiweights/utilities/constants.dart';
import 'package:motiweights/screens/registration.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 100.0),
          Hero(
              tag: 'logo',
              child: SizedBox(
                  child: Image.asset('images/motiweights_logo_notext.png'),
                  height: 140.0)),
          const Hero(
            tag: 'logo_text',
            child: Text(
              'MOTIWEIGHTS',
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50.0),
          ReusableCard(
              colour: kActiveCardColour,
              cardChild: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kInputDecoration.copyWith(hintText: 'Username'),
                onChanged: (value) {},
              ),
              onPress: () {}),
          ReusableCard(
              colour: kActiveCardColour,
              cardChild: TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: kInputDecoration.copyWith(hintText: 'Password'),
                onChanged: (value) {},
              ),
              onPress: () {}),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Not registered yet?'),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationPage.id);
                  },
                  child: const Text('Register here')),
            ],
          ),
          BottomButton(
              onTap: () {
                Navigator.pushNamed(context, HomePage.id);
              },
              buttonTitle: 'Login'),
        ],
      ),
    );
  }
}
