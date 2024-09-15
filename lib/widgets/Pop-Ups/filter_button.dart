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
        groupValue: controller.selectedTemporaryFilter.value,
        onChanged: (value) {
          controller.selectedTemporaryFilter(value!);
        },
        title: Text(
          title,
          style: TextStyle(
            color: status == controller.selectedTemporaryFilter.value
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

    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            FilterButton(status: OrderStatus.pending, title: AppConstants.pending),
            FilterButton(status: OrderStatus.cancelled, title: AppConstants.cancelled),
            FilterButton(status: OrderStatus.delivered, title: AppConstants.delivered),
            const SizedBox(height: 20),
            CustomButton(text: 'Apply', onPressed: (){
              controller.applyTemporaryFilter();
              Get.back();
            })
          ],
        ),
      ),
    ));
  }
}
