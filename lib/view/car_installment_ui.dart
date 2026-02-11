import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarInstallmentUi extends StatefulWidget {
  const CarInstallmentUi({super.key});

  @override
  State<CarInstallmentUi> createState() => _CarInstallmentUiState();
}

class _CarInstallmentUiState extends State<CarInstallmentUi> {
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _interestCtrl = TextEditingController();
  int _downPercent = 10;
  String _selectedMonth = "24 เดือน";
  String _resultAmount = "0.00";

  final List<String> _monthList = [
    "24 เดือน",
    "36 เดือน",
    "48 เดือน",
    "60 เดือน",
    "72 เดือน"
  ];

  void _calculate() {
    if (_priceCtrl.text.isEmpty || _interestCtrl.text.isEmpty) return;
    double price = double.parse(_priceCtrl.text);
    double rate = double.parse(_interestCtrl.text);
    int months = int.parse(_selectedMonth.split(' ')[0]);

    double finance = price - (price * _downPercent / 100);
    double totalInterest = (finance * (rate / 100)) * (months / 12);
    double monthly = (finance + totalInterest) / months;

    setState(() {
      _resultAmount = NumberFormat("#,###.00").format(monthly);
    });
  }

  void _resetAll() {
    setState(() {
      _priceCtrl.clear();
      _interestCtrl.clear();
      _downPercent = 10;
      _selectedMonth = "24 เดือน";
      _resultAmount = "0.00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9FF),
      appBar: AppBar(
        title: const Text("CI Calculator",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF58B351),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Text("คำนวณค่างวดรถ",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF58B351), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/piccar02.png",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 180,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_not_supported,
                        size: 50, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            _buildLabel("ราคารถ (บาท)"),
            TextField(
              controller: _priceCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "0.00", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            _buildLabel("จำนวนเงินดาวน์ (%)"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [10, 20, 30, 40, 50]
                  .map((v) => Row(
                        children: [
                          Radio<int>(
                            value: v,
                            groupValue: _downPercent,
                            activeColor: Colors.black,
                            onChanged: (val) =>
                                setState(() => _downPercent = val!),
                          ),
                          Text("$v",
                              style: TextStyle(
                                  fontWeight: _downPercent == v
                                      ? FontWeight.w900
                                      : FontWeight.normal,
                                  fontSize: 16)),
                        ],
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            _buildLabel("ระยะเวลาผ่อน (เดือน)"),
            DropdownButtonFormField<String>(
              value: _selectedMonth,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: _monthList
                  .map((m) => DropdownMenuItem(
                      value: m,
                      child: Text(m,
                          style: const TextStyle(fontWeight: FontWeight.bold))))
                  .toList(),
              onChanged: (val) => setState(() => _selectedMonth = val!),
            ),
            const SizedBox(height: 20),
            _buildLabel("อัตราดอกเบี้ย (%/ปี)"),
            TextField(
              controller: _interestCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "0.00", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF53AF4E),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      padding: const EdgeInsets.symmetric(vertical: 18)),
                  child: const Text("คำนวณ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                )),
                const SizedBox(width: 15),
                Expanded(
                    child: ElevatedButton(
                  onPressed: _resetAll,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5722),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      padding: const EdgeInsets.symmetric(vertical: 18)),
                  child: const Text("ยกเลิก",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                )),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  border: Border.all(color: const Color(0xFF58B351), width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const Text("ค่างวดรถต่อเดือนเป็นเงิน",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  FittedBox(
                    child: Text(_resultAmount,
                        style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF5252))),
                  ),
                  const Text("บาทต่อเดือน",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(text,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
        ));
  }
}
