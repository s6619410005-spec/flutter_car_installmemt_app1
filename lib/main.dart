import 'package:flutter/material.dart';
import 'package:flutter_car_installmemt_app/view/splash_screen_ui.dart';

void main() {
  runApp(const FlutterCarInstallmentApp());
}

class FlutterCarInstallmentApp extends StatelessWidget {
  const FlutterCarInstallmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Car Installment App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const SplashScreenUi(),
    );
  }
}
