import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';


class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContent({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text.toUpperCase(),
          style: kTextLabelStyle,
        )
      ],
    );
  }
}
