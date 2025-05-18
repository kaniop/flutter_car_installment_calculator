import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/resuit_screen_ui.dart';
import 'package:image_picker/image_picker.dart';

class InputScreenUi extends StatefulWidget {
  const InputScreenUi({super.key});

  @override
  State<InputScreenUi> createState() => _InputScreenUiState();
}

class _InputScreenUiState extends State<InputScreenUi> {
  int _monthCtrl = 24;
  int _downCtrl = 10;

  TextEditingController _carPriceCtrl = TextEditingController();
  TextEditingController _interestCtrl = TextEditingController();

  File? _imageFile;

  _warningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('คำเตือน'),
        content: Text(msg),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

  _openCamera() async {
    final pickerImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickerImage == null) return;
    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  _openGallery() async {
    final pickerImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickerImage == null) return;
    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'คำนวณค่างวดรถ',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  _openCamera();
                                },
                                title: Text('เปิดกล้อง'),
                                leading: Icon(Icons.camera),
                              ),
                              ListTile(
                                onTap: () {
                                  _openGallery();
                                },
                                title: Text('เปิดแกลอรี่'),
                                leading: Icon(Icons.photo),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: _imageFile == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/img02.png',
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _imageFile!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ราคารภ[บาท]'),
                ),
                TextField(
                  controller: _carPriceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('จำนวนเงินดาวน์[บาท]'),
                ),
                Wrap(
                  //crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 10,
                        groupValue: _downCtrl),
                    Text('10'),
                    Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 20,
                        groupValue: _downCtrl),
                    Text('20'),
                    Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 30,
                        groupValue: _downCtrl),
                    Text('30'),
                    Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 40,
                        groupValue: _downCtrl),
                    Text('40'),
                    Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 50,
                        groupValue: _downCtrl),
                    Text('50'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('รายะเวลาผ่อน[เดือน]'),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: DropdownButton<int>(
                      value: _monthCtrl,
                      isExpanded: true,
                      underline: Container(),
                      onChanged: (int? value) {
                        setState(() {
                          _monthCtrl = value!;
                        });
                      },
                      items: <int>[
                        24,
                        36,
                        48,
                        60,
                        72,
                      ].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value เดือน',
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ราคาดอกเบี้ย[%]'),
                ),
                TextField(
                  controller: _interestCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //Validate UI หากมีปัญหาให้แสดง Dialog แจ้งเตือน
                    if (_carPriceCtrl.text.isEmpty) {
                      _warningDialog('ป้อนราคารถด้วย..!!!');
                    } else if (_interestCtrl.text.isEmpty) {
                      _warningDialog('ป้อนอัตราดอกเบี้ยด้วย..!!!');
                    } else {
                      //พร้อมคำนวณแล้วส่งไปแสดงผลที่หน้า ResultScreenUI
                      //แปลงราคากับอัตราดอกเบี้ยเป็นตัวเลขก่อน
                      double carPrice = double.parse(_carPriceCtrl.text);
                      double interest = double.parse(_interestCtrl.text);

                      //ยอดจัด = ราคารถ - เงินดาวน์
                      double balance = carPrice - (carPrice * _downCtrl / 100);

                      //ดอกเบี้ยที่ต้องจ่ายทั้งหมด = (ยอดจัด * อัตราดอกเบี้ย / 100 / 12) * จำนวนเดือนผ่อน
                      double totalInterest =
                          (balance * interest / 100 / 12) * _monthCtrl;

                      //ยอดที่ต้องผ่อนต่อเดือน = (ยอดจัด + ดอกเบี้ยที่ต้องจ่ายทั้งหมด) / จำนวนเดือนผ่อน
                      double payPerMonth =
                          (balance + totalInterest) / _monthCtrl;

                      //ส่งผลไปแสดงที่หน้า ResultScreenUI โดยเปิดแบบย้อนกลับได้
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResuitScreenUi(
                            carPrice: carPrice,
                            paypermonth: payPerMonth,
                            month: _monthCtrl,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'คำนวณ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _carPriceCtrl.clear();
                      _interestCtrl.clear();
                      _monthCtrl = 24;
                      _downCtrl = 10;
                      _imageFile = null;
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
