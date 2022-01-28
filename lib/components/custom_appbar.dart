import 'package:flutter/material.dart';
import 'package:motiweights/utilities/constants.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: SizedBox(
          child: Image.asset('images/motiweights_logo_notext.png'),
          height: 40.0),
    );
  }
}

class AppBarText extends StatelessWidget {
  const AppBarText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Hero(
        tag: 'logo_text',
        child: Text('MOTIWEIGHTS', style: kAppbarTitleTextStyle));
  }
}
