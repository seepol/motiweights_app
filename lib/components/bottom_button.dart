import 'package:flutter/material.dart';
import 'package:motiweights/utilities/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.onTap, required this.buttonTitle})
      : super(key: key);

  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: kBottomContainerColour,
          borderRadius: kBorderRadius,
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: kBottomButtonTextStyle,
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
        padding: const EdgeInsets.all(10.0),
        // width: 80.0,
        // height: kBottomContainerHeight,
      ),
    );
  }
}
