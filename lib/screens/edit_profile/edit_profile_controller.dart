import 'dart:io';
import 'package:bakery_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  File? imageFile;
  final ImagePicker picker = ImagePicker();
  final defaultImage = ImageConstants.popular1;

  Future<File?> pickImageFromGallery() async {
    final chosenFile = await picker.pickImage(source: ImageSource.gallery);
    if (chosenFile != null) {
      return File(chosenFile.path);
    }
    return null;
  }

  Future<File?> pickImageFromCamera() async {
    final chosenFile = await picker.pickImage(source: ImageSource.camera);
    if (chosenFile != null) {
      return File(chosenFile.path);
    }
    return null;
  }

  void setDefaultImage(Function(File?) onImagePicked) {
    onImagePicked(null);
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an address';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length != 10) {
      return 'Please enter a 10-digit number';
    }
    return null;
  }

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a user name';
    }
    return null;
  }

  void updateProfile(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      Get.toNamed(RouteConstants.profileScreen);
      Get.snackbar('Success', 'Profile has been updated',
          snackPosition: SnackPosition.BOTTOM,
      );
    }else{
      Get.snackbar('Error', 'Please fill the form correctly',
      snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void dispose(){
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }
}
