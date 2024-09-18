import 'dart:io';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/screens/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditProfileImagePicker extends StatelessWidget {
  const EditProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(ImageConstants.popular1),
          ),
          Positioned(
            bottom: 0,
            right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkGrey,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
