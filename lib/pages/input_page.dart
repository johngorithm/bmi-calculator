import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/inc_dec_content.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/logic/bmi_brain.dart';

import '../constants/constants.dart';
import 'package:bmi_calculator/pages/result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int heightNumber = 140;
  int weightNumber = 50;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                // top row widgets
                Center(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = GenderType.MALE;
                            });
                          },
                          activeBackground: selectedGender == GenderType.MALE
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardHeight: 150.0,
                          margins: EdgeInsets.only(
                            left: 30.0,
                            right: 3.0,
                            bottom: 15.0,
                            top: 30,
                          ),
                          childWidget: IconContent(
                            icon: FontAwesomeIcons.mars,
                            text: 'MALE',
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = GenderType.FEMALE;
                            });
                          },
                          activeBackground: selectedGender == GenderType.FEMALE
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardHeight: 150.0,
                          margins: EdgeInsets.only(
                            left: 3.0,
                            right: 30.0,
                            bottom: 15.0,
                            top: 30,
                          ),
                          childWidget: new IconContent(
                            icon: FontAwesomeIcons.venus,
                            text: 'FEMALE',
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // middle: height input
                ReusableCard(
                  cardHeight: 230.0,
                  activeBackground: kActiveCardColor,
                  margins: EdgeInsets.only(
                    left: 30.0,
                    top: 10.0,
                    right: 30.0,
                    bottom: 15.0,
                  ),
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT', style: kTextLabelStyle),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            heightNumber.toString(),
                            style: kLargeNumberStyle,
                          ),
                          Text(
                            'cm',
                            style: kTextLabelStyle,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(kGrayTextColor),
                            thumbColor: Color(kBottomButtonColor),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 13.0,
                            ),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 26.0),
                            overlayColor: Color(0x29E91555)),
                        child: Slider(
                          value: heightNumber.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              heightNumber = newValue.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                // top row widgets
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardHeight: 200.0,
                        activeBackground: kActiveCardColor,
                        margins: EdgeInsets.only(
                          left: 30.0,
                          right: 3.0,
                          bottom: 15.0,
                          top: 15,
                        ),
                        childWidget: new IncDecCard(
                          label: 'WEIGHT',
                          value: weightNumber,
                          onIncrement: () {
                            setState(() {
                              weightNumber += 1;
                            });
                          },
                          onDecrement: () {
                            setState(() {
                              weightNumber -= 1;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardHeight: 200.0,
                        activeBackground: kActiveCardColor,
                        margins: EdgeInsets.only(
                          left: 3.0,
                          right: 30.0,
                          bottom: 15.0,
                          top: 15,
                        ),
                        childWidget: new IncDecCard(
                          label: 'age',
                          value: age,
                          onDecrement: () {
                            setState(() {
                              age -= 1;
                            });
                          },
                          onIncrement: () {
                            setState(() {
                              age += 1;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.0,
            width: double.infinity,
          ),
          BottomButton(
            bottomText: 'CALCULATE YOUR BMI',
            onPress: () {
              // NAVIGATE TO RESULT SCREEN;
              BmiCalculation calc =
                  BmiCalculation(height: heightNumber, weight: weightNumber);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    resultValue: calc.calculateBmi(),
                    interpretation: calc.getInterpretation(),
                    resultText: calc.getResult(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

enum GenderType { MALE, FEMALE }
