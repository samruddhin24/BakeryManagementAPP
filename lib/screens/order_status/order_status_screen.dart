import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/models/ordered_item_model.dart';
import 'package:bakery_app/screens/order_status/order_status_controller.dart';
import 'package:bakery_app/widgets/Pop-Ups/filter_button.dart';
import 'package:bakery_app/widgets/ordered_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusScreen extends StatelessWidget {
  OrderStatusController controller = Get.find<OrderStatusController>(
      tag: ControllerTags.orderStatusController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(RouteConstants.homeScreen);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  AppConstants.myOrders,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
          Obx(() {
            String title;
            switch (controller.selectedFilter.value) {
              case OrderStatus.cancelled:
                title = AppConstants.cancelled;
                break;
              case OrderStatus.pending:
                title = AppConstants.pending;
                break;
              case OrderStatus.delivered:
                title = AppConstants.delivered;
                break;
              default:
                title = AppConstants.pending;
                break;
            }
            return Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary1,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.grey,
                ),
              ],
            );
          }),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: controller.filteredOrders.length,
                itemBuilder: (context,index){
                  return OrderedItemCard(order: controller.filteredOrders[index]);
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        FilterButton.FilterBox(context);
      },
      backgroundColor: AppColors.primary1,
        child: const Icon(Icons.filter_alt_outlined),
      ),
    );
  }
}
