import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About BMI  (Body Mass Index)",style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          
        ),),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(padding: EdgeInsets.all(10),
            child: Text("""What is BMI? Body Mass Index (BMI) is a numerical value derived from an individual's weight and height. It is commonly used to assess whether a person has a healthy body weight for their height. BMI is an easy and widely used method to categorize individuals into different weight categories: underweight, normal weight, overweight, and obese. BMI Calculation Formula: The formula to calculate BMI is: BMI = weight (kg) ( height (m) ) 2 BMI= (height (m)) 2 weight (kg) ​ Weight: measured in kilograms (kg).\n
Good:
Normal weight (18.5 – 24.9): Generally considered the healthiest range.\n
Caution:
Overweight (25 – 29.9): Increased risk of health issues; lifestyle changes are recommended.\n
Bad:
Obesity (Class 1, 2, and 3) (30 and above): Higher risk of various health conditions, including heart disease, diabetes, and certain cancers; medical intervention may be necessary. """,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
            ),
          )
        ],
      ),
    );
  }
}