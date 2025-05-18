import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/input_screen_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InputScreenUi(),
              ),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img01.png',
              width: 200,
              height: 200,
            ),
            Text(
              'Car Installment',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              'Calculator',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Created by NinniN DTI SAU',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
