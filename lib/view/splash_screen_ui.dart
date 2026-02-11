import 'package:flutter/material.dart';
import 'car_installment_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CarInstallmentUi()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFC5EBC5),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 3),
            Image.asset(
              "assets/images/piccar01.png",
              width: screenWidth * 0.50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.directions_car,
                size: screenWidth * 0.30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Car Installment",
              style: TextStyle(
                fontSize: screenWidth * 0.085,
                color: const Color(0xFFC5EBC5),
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              "คำนวณค่างวดรถยนต์",
              style: TextStyle(
                fontSize: screenWidth * 0.065,
                color: const Color(0xFFC5EBC5),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 4,
            ),
            const Spacer(flex: 2),
            Text(
              "Created by Stidaa_05 SAU",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: const Color(0xffC5EBC5),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: screenWidth * 0.040,
                color: const Color(0xFFC5EBC5),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
