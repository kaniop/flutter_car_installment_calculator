import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResuitScreenUi extends StatefulWidget {
  double? carPrice;
  double? paypermonth;
  int? month;

  ResuitScreenUi({super.key, this.carPrice, this.paypermonth, this.month});

  @override
  State<ResuitScreenUi> createState() => _ResuitScreenUiState();
}

class _ResuitScreenUiState extends State<ResuitScreenUi> {
  @override
  Widget build(BuildContext context) {
    //กำหนดรูปแบบตัวเลข
    NumberFormat fm = NumberFormat("#,###,##0.00");
    //กำหนดสีตัวเลข
    Color co = Colors.red;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'CI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ผ่อนทั้งหมด ',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.month}',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(
                  ' เดือน',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              'ค่างวดรถต่อเดือน',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${fm.format(widget.paypermonth)}',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              'บาท',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
