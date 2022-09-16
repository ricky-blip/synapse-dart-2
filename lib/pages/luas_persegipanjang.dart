import 'package:flutter/material.dart';

class LuasPersegiPanjangPages extends StatefulWidget {
  @override
  State<LuasPersegiPanjangPages> createState() =>
      _LuasPersegiPanjangPagesState();
}

class _LuasPersegiPanjangPagesState extends State<LuasPersegiPanjangPages> {
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
        title: Text("Luas Persegi Panjang"),
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
                          // NOTE panggil validator
                          if (formKeyValidator.currentState!.validate()) {
                            //function Hitung
                            hitungLuas(
                              num.parse(panjang.text),
                              num.parse(lebar.text),
                            );
                          }
                        },
                        child: Center(
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
            SizedBox(height: 20),
            //NOTE Hasil
            Text(
              "Hasil : $hasil",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
