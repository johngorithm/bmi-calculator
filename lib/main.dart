import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/pages/result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF080B22),
        scaffoldBackgroundColor: Color(0xFF080B22),
      ),
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}


