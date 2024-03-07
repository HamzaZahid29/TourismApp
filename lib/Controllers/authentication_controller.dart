import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hamza/Utils/app_routes.dart';


class AuthController extends GetxController {

  FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      isLoading(true);
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading(false);
      Get.snackbar(
        'Success',
        'User created successfully',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.toNamed(AppRoutes.homeScreen);
    } catch (error) {
      isLoading(false);
      Get.snackbar(
        'Error',
        'invalid credentials or connection problem',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}