import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NIC Decoder',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => InputScreen()),
        GetPage(name: '/result', page: () => ResultScreen()),
      ],
    );
  }
}
