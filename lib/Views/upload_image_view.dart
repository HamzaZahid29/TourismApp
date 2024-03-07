import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hamza/Utils/AppColors.dart';
import 'package:hamza/Widgets/auth_widgets.dart';

import '../Controllers/uploadimage_controller.dart';
class UploadImage extends StatelessWidget {

  UploadImageController uploadImageController = Get.put(UploadImageController());
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Simply put name and pick image and press done'),
                    AuthTextField('Enter your place', TextInputType.emailAddress, false, textEditingController),
                    IconButton(onPressed: (){
                      uploadImageController.pickImage();
                    },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)), icon: Icon(Icons.upload),),
                    IconButton(onPressed: (){
                      uploadImageController.uploadImage();
                    }, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)), icon: Icon(Icons.open_in_new),),

                    IconButton(onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)), icon: Icon(Icons.done),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  UploadImage();
}
