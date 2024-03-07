import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageController extends GetxController {
  final picker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);
  RxString imageName = ''.obs;
  RxString imageUrl = ''.obs;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> uploadImage() async {
    if (image.value == null) {
      return;
    }

    try {
      Get.snackbar(
        'Uploading',
        '',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      final fileName = imageName.value.isNotEmpty ? imageName.value : 'image';

      final Reference storageReference =
      FirebaseStorage.instance.ref().child('images/$fileName');
      final UploadTask uploadTask = storageReference.putFile(image.value!);
      await uploadTask.whenComplete(() async {
        Get.snackbar(
          'Uploading',
          'Data added to Firestore successfully',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
        print('upload complete');
        final downloadURL = await storageReference.getDownloadURL();
        imageUrl.value = downloadURL;
        Get.snackbar(
          'Success',
          'Image Uploaded successfully',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> completeUpload(String title) async {
    try {
      if (imageUrl.value.isEmpty) {
        print('No image uploaded.');
        return;
      }

      await FirebaseFirestore.instance.collection('your_collection').add({
        'title': title,
        'imageUrl': imageUrl.value,
      });

      Get.snackbar(
        'Success',
        'Data added to Firestore successfully',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Error uploading data to Firestore: $e');
    }
  }
}

