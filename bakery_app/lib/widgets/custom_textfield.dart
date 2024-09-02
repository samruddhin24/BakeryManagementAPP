import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      maxLength: 10,
      decoration: InputDecoration(
        hintText: hintText,
        prefixText: '+91 ',
        prefixStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )
      ),
      validator: (value){
        if(value == null || value.isEmpty){
          return 'Please enter your number';
        }else if(value.length != 10){
          return 'Mobile number must be 10 digits';
        }
        return null;
      },
    );
  }
}
