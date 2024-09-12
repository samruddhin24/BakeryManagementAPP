import 'dart:ui';

import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/screens/home/home_controller.dart';
import 'package:bakery_app/widgets/banner_slider.dart';
import 'package:bakery_app/widgets/category_slider.dart';
import 'package:bakery_app/widgets/product_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../widgets/searchBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>(tag: ControllerTags.homeController);

    return Scaffold(
        backgroundColor: AppColors.lightWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppConstants.hello,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_cart_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_outlined),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Searchbar(),
              const SizedBox(height: 10),
              const BannerSlider(),
              const SizedBox(height: 20),
              CategorySlider(),
              const SizedBox(height: 20),
              ProductSlider(products: controller.popularCakes, title: 'Popular Cakes'),
              const SizedBox(height: 20),
              ProductSlider(products: controller.specialCakes, title: 'Our Speciality'),
              const SizedBox(height: 20),
              ProductSlider(products: controller.recommended, title: 'Recommended for you'),
            ],
          ),
        ),
      ),
    );
  }
}
