import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/screens/registration/registration_controller.dart';
import 'package:bakery_app/widgets/custom_button.dart';
import 'package:bakery_app/widgets/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final RegistrationScreenController controller =
    // Get.find<RegistrationScreenController>(tag: ControllerTags.registrationController);
    // controller.onReady();
    final RegistrationScreenController controller = Get.put(RegistrationScreenController());
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                child: Image.asset(
                  ImageConstants.login,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          children: [
                            Text(
                              AppConstants.register,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              AppConstants.registerSubHeading,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.darkGrey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomInputField(
                              hintText: AppConstants.usernameFieldHint,
                              icon: Icons.person_outline,
                              controller: controller.nameController,
                            ),
                            const SizedBox(height: 20),
                            CustomInputField(
                              hintText: AppConstants.emailFieldHint,
                              icon: Icons.email_outlined,
                              controller: controller.emailController,
                              isEmail: true,
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                                text: AppConstants.register,
                                onPressed: controller.registerUser),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
