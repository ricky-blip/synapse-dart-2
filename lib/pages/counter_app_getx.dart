import 'package:dart_flutter_state/controller/method_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterAppGetXPages extends StatelessWidget {
  const CounterAppGetXPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //memanggil controller getX
    final mController = Get.put(MethodController());

    return Scaffold(
      appBar: AppBar(
        title: Text("State Management GetX"),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //NOTE Cara 1 Memakai Obx
              Obx(
                () => Text(
                  mController.nilai.string,
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      mController.decrement();
                    },
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      mController.increment();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //NOTE FormField dengan Obx
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Obx(
                  () => TextFormField(
                    obscureText: mController.obscure.value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          mController.isObscure();
                        },
                        icon: Icon(
                          mController.obscure.value == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
