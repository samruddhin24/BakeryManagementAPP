import 'dart:ui';

import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/screens/order_information/order_information_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderInformationProductCard extends StatelessWidget {
  final OrderInformationController controller =
      Get.find<OrderInformationController>(
          tag: ControllerTags.orderInformationController);


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final order = controller.orderDetails.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                '${AppConstants.orderID}${order.orderId}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 4,
                  spreadRadius: 2,
                )
              ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    ImageConstants.popular1,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.product,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            order.orderDate,
                            style: const TextStyle(
                              color: AppColors.darkGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            order.status,
                            style: const TextStyle(
                              color: AppColors.primary1,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '₹${order.price}',
                        style: const TextStyle(
                          color: AppColors.primary1,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
