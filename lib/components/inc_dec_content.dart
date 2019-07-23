import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IncDecCard extends StatelessWidget {
  final int value;
  final String label;
  final Function onIncrement;
  final Function onDecrement;

  IncDecCard(
      {Key key,
      @required this.label,
      @required this.value,
      @required this.onDecrement,
      @required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label.toUpperCase(),
          style: kTextLabelStyle,
        ),
        Text(
          value.toString(),
          style: kLargeNumberStyle,
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              onPress: onDecrement,
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              onPress: onIncrement,
              icon: FontAwesomeIcons.plus,
            ),
          ],
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({@required this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,
      color: Colors.white,),
      elevation: 5.0,
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
