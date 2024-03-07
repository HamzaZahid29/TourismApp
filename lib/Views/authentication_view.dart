import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hamza/Utils/app_routes.dart';

import '../Controllers/authentication_controller.dart';
import '../Utils/AppColors.dart';
import '../Widgets/auth_widgets.dart';

class AuthenticationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTextField('Enter your email', TextInputType.emailAddress, false, emailController),
                  AuthFieldGap(),
                  AuthTextField('Enter your password', TextInputType.visiblePassword, true,passwordController),
                  AuthFieldGap(),
                  Obx(
                      ()=>  SubmitBtn( authController.isLoading.value,'Submit', (){
                      authController.createUserWithEmailAndPassword(emailController.text,passwordController.text);
                        // Get.toNamed(AppRoutes.homeScreen);
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
