import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/widgets/order_information_customer_details.dart';
import 'package:bakery_app/widgets/order_information_price_summary.dart';
import 'package:bakery_app/widgets/order_information_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';

class OrderInformationScreen extends StatelessWidget {
  const OrderInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  AppConstants.myOrders,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrderInformationCustomerDetails(),
                  const SizedBox(height: 20),
                  OrderInformationProductCard(),
                  const SizedBox(height: 20),
                  OrderInformationPriceSummary(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
