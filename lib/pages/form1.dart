import 'package:dart_flutter_state/pages/form2.dart';
import 'package:flutter/material.dart';

class Form1Pages extends StatefulWidget {
  @override
  State<Form1Pages> createState() => _Form1PagesState();
}

class _Form1PagesState extends State<Form1Pages> {
  //Controller TextFormField, texteditingcontroller => utk menerima value di textfield / textformfield
  TextEditingController panjang = TextEditingController();
  TextEditingController lebar = TextEditingController();

  //buat variabel utk menampung hasil
  num hasil = 0;

  //key utk form agar bisa di form itu ada statenya, misal validasi
  final formKeyValidator = GlobalKey<FormState>();

  // fungsi hitung luas
  void hitungLuas(num panjang, num lebar) {
    // variabel yg menampung proses hitung luas
    num luas = panjang * lebar;

    // gantikan / asign nilai dari variabel hasil yg ada di atas, dgn hasil dari
    // perhitungan luas yg diwadahkan pd variabek luas
    setState(() {
      hasil = luas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form 1"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            //NOTE Title
            Text(
              "Hitung Luas Persegi Panjang",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            SizedBox(height: 20),
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
                          // panggil validator
                          if (formKeyValidator.currentState!.validate()) {
                            // panggil function hitungLuas
                            hitungLuas(
                              num.parse(panjang.text),
                              num.parse(lebar.text),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (contex) => Form2Pages(
                                  panjangYgDiterima: panjang.text,
                                  lebarYgDiterima: lebar.text,
                                  hasilYgDiterima: hasil,
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
