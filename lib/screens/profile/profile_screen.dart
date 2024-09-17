import 'package:bakery_app/binding/controller_binding.dart';
import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/constants/controller_tags.dart';
import 'package:bakery_app/screens/profile/profile_controller.dart';
import 'package:bakery_app/widgets/custom_navbar.dart';
import 'package:bakery_app/widgets/profile_box.dart';
import 'package:bakery_app/widgets/profile_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller =
        Get.find<ProfileController>(tag: ControllerTags.profileController);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  AppConstants.myProfile,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ProfileBox(
                name: 'Atharva Joshi',
                phoneNumber: '+91-7350125844',
                imageUrl: ImageConstants.cake),
            const SizedBox(height: 20),
            ProfileTabs(
              icon: Icons.person_outline,
              title: AppConstants.editProfile,
              onTap: controller.editProfile,
            ),
            ProfileTabs(
              icon: Icons.shopping_bag_outlined,
              title: AppConstants.myOrders,
              onTap: controller.myOrders,
            ),
            ProfileTabs(
              icon: Icons.article_outlined,
              title: AppConstants.termsAndConditions,
              onTap: (){},
            ),
            ProfileTabs(
              icon: Icons.privacy_tip_outlined,
              title: AppConstants.privacyPolicy,
              onTap: (){},
            ),
            ProfileTabs(
              icon: Icons.help_outline,
              title: AppConstants.helpAndSupport,
              onTap: (){},
            ),
            ProfileTabs(
              icon: Icons.logout,
              title: AppConstants.logout,
              onTap: controller.logout,
              textColor: AppColors.primary1,
              iconColor: AppColors.primary1,
            ),
            ProfileTabs(
              icon: Icons.delete_outline,
              title: AppConstants.deleteAccount,
              onTap: (){},
              textColor: AppColors.red,
              iconColor: AppColors.red,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
