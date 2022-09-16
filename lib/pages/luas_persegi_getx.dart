import 'package:dart_flutter_state/controller/method_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class LuasPersegiGetXPages extends StatelessWidget {
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
        title: Text("Luas Persegi GetX"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            //NOTE Title
            const Text(
              "Hitung Luas Persegi Panjang",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 20),
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
                    padding: const EdgeInsets.all(10),
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
                          // NOTE panggil validator
                          if (formKeyValidator.currentState!.validate()) {
                            //function Hitung
                            mController.hitungLuas(
                              int.parse(panjang.text),
                              int.parse(lebar.text),
                            );
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Hitung",
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
            const SizedBox(height: 20),
            //NOTE Hasil
            Obx(
              () => Text(
                "Hasil : ${mController.hasil}",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
