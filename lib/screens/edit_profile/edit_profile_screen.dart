import 'dart:io';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/screens/edit_profile/edit_profile_controller.dart';
import 'package:bakery_app/screens/login/login_controller.dart';
import 'package:bakery_app/widgets/custom_button.dart';
import 'package:bakery_app/widgets/custom_input_field.dart';
import 'package:bakery_app/widgets/edit_profile_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfileController controller = Get.find<EditProfileController>(
      tag: ControllerTags.editProfileController);
  File? selectedImage;
  final String defaultImage = ImageConstants.popular1;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        AppConstants.myProfile,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  EditProfileImagePicker(
                      selectedImage: selectedImage,
                      defaultImage: defaultImage,
                      onImageSelected: (File? image) {
                        setState(() {
                          selectedImage = image;
                        });
                      }),
                  const SizedBox(height: 40),
                  CustomInputField(
                    hintText: AppConstants.usernameFieldHint,
                    icon: Icons.person_outline,
                    controller: controller.nameController,
                    validator: controller.validateUserName,
                  ),
                  const SizedBox(height: 40),
                  CustomInputField(
                    hintText: AppConstants.loginFieldHint,
                    icon: Icons.phone,
                    controller: controller.phoneController,
                    validator: controller.validatePhoneNumber,
                  ),
                  const SizedBox(height: 40),
                  CustomInputField(
                    hintText: AppConstants.addressFieldHint,
                    icon: Icons.location_on_outlined,
                    controller: controller.addressController,
                    validator: controller.validateAddress,
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                      text: AppConstants.update,
                      onPressed: () {
                        if(formKey.currentState?.validate() ?? false){
                          controller.updateProfile(formKey);
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
