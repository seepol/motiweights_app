import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kBottomContainerHeight = 80.0;
const kBottomContainerWidth = 160.0;
const kBottomContainerColour = Color(0xFFEB1555);
const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
const kBackgroundColour = Color(0xFF0A0E21);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kAuthorTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  fontStyle: FontStyle.italic,
);

const kSubtitleTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kBottomButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  decoration: TextDecoration.none,
);

const kAppbarTitleTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  decoration: TextDecoration.none,
);

const cardIcon = FaIcon(FontAwesomeIcons.dumbbell);

const listPadding = EdgeInsets.all(8);

const kBorderRadius = BorderRadius.all(Radius.circular(10.0));

const kInputDecoration = InputDecoration(
  hintText: 'Enter a value',
  // hintStyle: kBottomButtonTextStyle,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
    borderRadius: kBorderRadius,
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
    borderRadius: kBorderRadius,
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
    borderRadius: kBorderRadius,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
    ),
    borderRadius: kBorderRadius,
  ),
);
