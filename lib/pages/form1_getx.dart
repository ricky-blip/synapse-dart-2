import 'package:dart_flutter_state/pages/form2_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/method_controller.dart';

class Form1GetXPages extends StatelessWidget {
  //Controller TextFormField, texteditingcontroller => utk menerima value di textfield / textformfield
  TextEditingController panjang = TextEditingController();
  TextEditingController lebar = TextEditingController();

  //key utk form agar bisa di form itu ada statenya, misal validasi
  final formKeyValidator = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //memanggil controller getX
    final mController = Get.put(MethodController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Form 1 GetX"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            //NOTE Title
            Text(
              "Hitung Luas Persegi Panjang GetX",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            //NOTE Form untuk Validator
            Form(
              key: formKeyValidator,
              child: Column(
                children: [
                  //NOTE Column Text Field
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFormField(
                          //NOTE Validator
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan Panjang";
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: panjang,
                          decoration:
                              InputDecoration(hintText: "Masukkan Panjang"),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          //NOTE Validator
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan Lebar";
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: lebar,
                          decoration:
                              InputDecoration(hintText: "Masukkan Lebar"),
                        ),
                      ],
                    ),
                  ),
                  //NOTE Button Proses Hitung
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Ink(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          // panggil validator
                          if (formKeyValidator.currentState!.validate()) {
                            // panggil function hitungLuas
                            mController.hitungLuas(
                              int.parse(panjang.text),
                              int.parse(lebar.text),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (contex) => Form2GetXPages(
                                  panjangYgDiterima: panjang.text,
                                  lebarYgDiterima: lebar.text,
                                  hasilYgDiterima: mController.hasil.value,
                                ),
                              ),
                            );
                          }
                        },
                        child: Center(
                          child: Text(
                            "Kirim Data",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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
