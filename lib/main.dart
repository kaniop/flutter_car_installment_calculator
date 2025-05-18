import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/input_screen_ui.dart';
import 'package:flutter_car_installment_calculator/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FluterCarInstallmentCalcutor());
}

class FluterCarInstallmentCalcutor extends StatefulWidget {
  const FluterCarInstallmentCalcutor({super.key});

  @override
  State<FluterCarInstallmentCalcutor> createState() =>
      _FluterCarInstallmentCalcutorState();
}

class _FluterCarInstallmentCalcutorState
    extends State<FluterCarInstallmentCalcutor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
