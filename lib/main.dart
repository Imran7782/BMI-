import 'package:bmiapp/about.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BMI(),
    );
  }
}

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String result = '';

  void calBMI() {
    final double weight = double.tryParse(_weightController.text) ?? 0;
    final double height = double.tryParse(_heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      final double bmi = weight / (height * height);
      setState(() {
        if (bmi<18) {
           result = 'Your BMI is: ${bmi}\nYou have weak Health';
        }else if(bmi>18 && bmi<25){
          result = 'Your BMI is: ${bmi}\nYou Have good Health';
        }else{
          result = 'Your BMI is: ${bmi}\nTou have Bad helth';
        }
      });
    } else {
      setState(() {
        result = 'Please enter valid weight and height';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUs()),
              );
            },
            icon: Icon(Icons.health_and_safety, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.blue,
        title: const Text(
          'BMI Application',
          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 300,
            width: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/BMI2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildTextField(_weightController, 'Weight (kg)'),
          const SizedBox(height: 10),
          _buildTextField(_heightController, 'Height (m)'),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: calBMI,
              child: Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
