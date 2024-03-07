import 'package:flutter/material.dart';

import '../Utils/AppColors.dart';

class AuthTextField extends StatelessWidget {
  String title;
  final TextInputType keyboardType;
  bool obscureText;
  final TextEditingController? controller;

  AuthTextField(
      this.title, this.keyboardType, this.obscureText, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: title,
        contentPadding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 10.0), // Internal padding
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Colors.grey[500]!), // Grey shade 700 border when not focused
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey[800]!), // Grey shade 800 border when focused
        ),
      ),
      keyboardType: keyboardType, // Keyboard type set to email
      style: TextStyle(color: Colors.black), // Text color set to black
    );
  }
}

class AuthFieldGap extends StatelessWidget {
  const AuthFieldGap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
    );
  }
}

class SubmitBtn extends StatelessWidget {
  bool isLoading;
  String title;
  Function function;


  SubmitBtn(this.isLoading, this.title, this.function);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor, // Background color
        foregroundColor: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8), // Adjust border radius as needed
        ),
        elevation: 0, // Elevation
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child:isLoading ?CircularProgressIndicator(color: Colors.white,): Text(title),
      ),
    );
  }
}
