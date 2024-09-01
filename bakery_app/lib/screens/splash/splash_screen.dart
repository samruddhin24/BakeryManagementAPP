import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/constants/controller_tags.dart';
import 'package:bakery_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.find(tag: ControllerTags.splashController);
    controller.onReady();
    return  Scaffold(
      body: Stack(
        children: [
          Image.asset(ImageConstants.bg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageConstants.logo,
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 20),
                Text(
                  AppConstants.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold,
                    color: AppColors.primary1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
