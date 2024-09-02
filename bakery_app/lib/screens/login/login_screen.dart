import 'package:flutter/material.dart';

import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
      CustomTextField(hintText: 'Enter number',),
    );
  }
}
