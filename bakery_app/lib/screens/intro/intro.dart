import 'package:bakery_app/screens/intro/intro_controller.dart';
import 'package:bakery_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../widgets/custom_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<IntroController>(
          init: IntroController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        controller.currentPage.value =
                            2; // Skip to the last page
                      },
                      child: const Text('Skip'),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: ClipOval(
                      key: ValueKey<String>(controller
                          .introModels[controller.currentPage.value].image),
                      child: Image.asset(
                        controller
                            .introModels[controller.currentPage.value].image,
                        width: 350,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Text(
                      key: ValueKey<String>(controller
                          .introModels[controller.currentPage.value]
                          .description),
                      controller.introModels[controller.currentPage.value]
                          .description,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Text(
                      key: ValueKey<String>(controller
                          .introModels[controller.currentPage.value]
                          .description),
                      controller.introModels[controller.currentPage.value]
                          .subDescription,
                      // textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, color: AppColors.primary2),
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: controller.currentPage.value ==
                            controller.introModels.length - 1
                        ? 'Login'
                        : 'Next',
                    onPressed: () {
                      controller.nextPage();
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.introModels.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 8,
                        width: controller.currentPage.value == index ? 16 : 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: controller.currentPage.value == index
                              ? AppColors.primary1
                              : AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
