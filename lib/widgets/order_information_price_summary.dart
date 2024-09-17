import 'dart:ui';

import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/screens/order_information/order_information_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderInformationPriceSummary extends StatelessWidget {
  final OrderInformationController controller = Get.find<OrderInformationController>(tag: ControllerTags.orderInformationController);
  @override
  Widget build(BuildContext context) {
    return Obx((){
      final priceSummary = controller.priceSummary.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                AppConstants.priceSummary,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 4,
                  spreadRadius: 2,
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppConstants.itemTotal,
                      style: const TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '₹${priceSummary.itemTotal}',
                      style: const TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppConstants.gstCharge,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    Text(
                      '₹${priceSummary.gstCharge}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.grandTotal,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(${AppConstants.paymentMode} ${priceSummary.paymentMode})',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₹${priceSummary.grandTotal}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
