import 'package:get/get.dart';

class MethodController extends GetxController {
  // variabel nilai
  //Reactive
  RxInt nilai = 0.obs;

  RxBool obscure = true.obs;

  //Non Reactive
  int counter = 0;

  //buat variabel utk menampung hasil
  RxInt hasil = 0.obs;

  void increment() {
    nilai++;
  }

  void decrement() {
    if (nilai >= 1) {
      nilai--;
    }
  }

  void plusplus() {
    counter++;

    update();
  }

  void minusminus() {
    if (counter >= 1) {
      counter--;
    }

    update();
  }

  void isObscure() {
    obscure.value = !obscure.value;
  }

  // NOTE fungsi hitung luas
  void hitungLuas(int panjang, int lebar) {
    // variabel yg menampung proses hitung luas
    int luas = panjang * lebar;

    hasil.value = luas;
  }
}
