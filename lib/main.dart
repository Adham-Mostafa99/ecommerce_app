import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/helper/binding.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'E_commerce',
      home: ControlView(),
    );
  }
}
