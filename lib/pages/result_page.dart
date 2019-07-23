import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String interpretation;
  final String resultValue;

  ResultPage({
    @required this.resultText,
    @required this.resultValue,
    @required this.interpretation
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: kResultTextStyle,
              ),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                bottom: 15.0,
              ),
              child: ReusableCard(
                paddings: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                activeBackground: kActiveCardColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultIndicatorTextStyle,
                    ),
                    Text(
                      resultValue,
                      style: kLargeResultValueStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        wordSpacing: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            bottomText: 'RE-CALCULATE',
            onPress: () {
              // NAVIGATE TO RESULT SCREEN;
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
