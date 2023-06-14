import 'package:counter_app/assets/info.dart';
import 'package:counter_app/bmi/bmiCalculator.dart';
import 'cgpa/cgpaCalulator.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onLongPress: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyInfo()));
              },
                child: Image.asset(
              'lib/assets/diagram.png',
              height: 100,
              width: 100,
            )),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 160,
                child: ElevatedButton(
                  child: const Text(
                    "Calculate CGPA",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CgpaCalulator()));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 160,
                child: ElevatedButton(
                  child: const Text(
                    "Calculate BMI",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BmiCalculator()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
