import 'package:flutter/material.dart';

const double cardRadius = 5.0;

class ReusableCard extends StatelessWidget {
  final double cardHeight;
  final Color activeBackground;
  final Widget childWidget;
  final EdgeInsets margins;
  final Function onPress;
  final EdgeInsets paddings;

  ReusableCard(
      {this.cardHeight,
        @required this.activeBackground,
        this.childWidget,
        this.margins,
        this.paddings,
        this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: paddings,
        height: cardHeight,
        margin: margins,
        child: childWidget,
        decoration: BoxDecoration(
          color: activeBackground,
          borderRadius: BorderRadius.circular(cardRadius),
        ),
      ),
    );
  }
}