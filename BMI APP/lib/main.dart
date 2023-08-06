import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _result = 0.0;
  String bmi = "";

  void calculateBMI() {
    setState(() {
      int age = int.tryParse(_ageController.text) ?? 0;
      double weight = double.tryParse(_weightController.text) ?? 0.0;
      double height = double.tryParse(_heightController.text) ?? 0.0;

      if (age > 0 && weight > 0 && height > 0) {
        _result = (703 * weight) / pow(height * 12, 2);

        if (_result >= 25.0 && _result < 29.9) {
          bmi = "Overweight";
        } else if (_result >= 18.5 && _result < 25.0) {
          bmi = "Healthy";
        } else if (_result >= 29.9) {
          bmi = "Obese";
        } else {
          bmi = "Underweight";
        }
      } else {
        // Reset BMI and show an error message if any input is invalid or empty
        _result = 0.0;
        bmi = "Invalid input";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            Image(
              image: NetworkImage(
                  "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiwJ0m1SE4W_Mu2vinGFjifxfMfop0HFarDnCXbgBsLtRN5wYDQkIybQQEFHNptjmZwy6wZqF7uWhCCJx3HR0y4CmaiUOLojQQ1iKoJU-a2b7yio0F0mYMzEcR2CKGuM6897BTu1pt62P9RdEoBEJ-j91gbU9ZuoUHgUom0yIDBnYDQUwdsLdnWjEbNJg/s1632/how%20to%20calculate%20bmi.webp"),
              height: 200.0,
              width: 250.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Age",
                      hintText: "Enter your age",
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Height",
                      hintText:"In Feet",
                      icon: Icon(Icons.insert_chart),
                    ),
                  ),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Weight",
                      hintText: "In Lbs",
                      icon: Icon(Icons.line_weight),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: calculateBMI,
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lime,
                      ),
                    ),
                  ),
                  Text(
                    "BMI: ${_result.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Status: $bmi",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
