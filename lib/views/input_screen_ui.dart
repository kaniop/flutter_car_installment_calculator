import 'package:flutter/material.dart';

class InputScreenUi extends StatefulWidget {
  const InputScreenUi({super.key});

  @override
  State<InputScreenUi> createState() => _InputScreenUiState();
}

class _InputScreenUiState extends State<InputScreenUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car Installment Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    );
  }
}
