import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';

class BottomButton extends StatelessWidget {
  final String bottomText;
  final Function onPress;

  BottomButton({@required this.onPress, @required this.bottomText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,

      child: Container(
        child: Center(
          child: Text(
            bottomText.toUpperCase(),
            style: kLargeButtonTextStyle,
          ),
        ),
        color: Color(kBottomButtonColor),
        height: kBottomButtonHeight,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
      ),
    );
  }
}
