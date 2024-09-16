import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/models/ordered_item_model.dart';
import 'package:bakery_app/screens/order_status/order_status_controller.dart';
import 'package:bakery_app/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FilterButton extends StatelessWidget {
  final OrderStatus status;
  final String title;

  const FilterButton({super.key, required this.status, required this.title});

  @override
  Widget build(BuildContext context) {
    OrderStatusController controller = Get.find<OrderStatusController>(
        tag: ControllerTags.orderStatusController);

    return Obx(() {
      return RadioListTile<OrderStatus>(
        value: status,
        groupValue: controller.selectedFilter.value,
        onChanged: (value) {
          controller.selectedFilter.value = value!;
        },
        title: Text(
          title,
          style: TextStyle(
            color: status == controller.selectedFilter.value
                ? AppColors.primary1
                : AppColors.black,
          ),
        ),
        activeColor: AppColors.primary1,
      );
    });
  }

  static void FilterBox(BuildContext context) {
    OrderStatusController controller = Get.find<OrderStatusController>(
        tag: ControllerTags.orderStatusController);


      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: AppColors.white,
        isScrollControlled: true,
        builder: (BuildContext) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close),
                  ),
                ),
                Text(
                  AppConstants.filter,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                FilterButton(
                    status: OrderStatus.pending, title: AppConstants.pending),
                FilterButton(
                    status: OrderStatus.cancelled,
                    title: AppConstants.cancelled),
                FilterButton(
                    status: OrderStatus.delivered,
                    title: AppConstants.delivered),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Apply',
                  onPressed: () {
                    controller.applyFilter();
                    Get.back();
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Reset',
                  onPressed: () {
                    controller.resetFilter();
                    Get.back();
                  },
                ),
              ],
            ),
          );
        },
      );
  }
}
