import 'package:bakery_app/constants/app_constants.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/screens/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMobileNumberField extends StatefulWidget {
  const CustomMobileNumberField({super.key});

  @override
  State<CustomMobileNumberField> createState() => _CustomMobileNumberFieldState();
}

class _CustomMobileNumberFieldState extends State<CustomMobileNumberField> {
  final formKey = GlobalKey<FormState>();
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child:  Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
             Positioned(
              left: 10,
                top: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppConstants.loginCode,
                    style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
            ),
            TextFormField(
              textAlign: TextAlign.start,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              style: const TextStyle(
                fontSize: 16,   
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                counterText: '',
                hintText: AppConstants.loginFieldHint,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                contentPadding: EdgeInsets.fromLTRB(40, 15, 10, 15),
                border: InputBorder.none,
              ),
              onChanged: (value){
                controller.updateNumber(value);
              },
              validator: (value){
                if(value == null || value.length != 10){
                  return 'Please enter valid number';
                }
                return null;
              },
            ),
          ],
        ),
      ),

    );
  }
}
