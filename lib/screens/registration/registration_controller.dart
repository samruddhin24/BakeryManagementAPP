import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/route_constants.dart';

class RegistrationScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void registerUser() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(RouteConstants.homeScreen);
    } else {
      Get.snackbar(
        'Error',
        'Please fill the form correctly',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return 'Please enter an email address';
    }
    if(!value.contains('@') || !value.contains('.com')){
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateUserName(String? value){
    if(value == null || value.isEmpty){
      return 'Please enter a user name';
    }
    return null;
  }


  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

}