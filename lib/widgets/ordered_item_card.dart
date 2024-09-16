import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import '../models/ordered_item_model.dart';

class OrderedItemCard extends StatelessWidget {
  final Order order;
  const OrderedItemCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              order.image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AppConstants.orderID}${order.id} | ${order.date}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  order.title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.darkGrey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  order.price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppColors.primary1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            orderStatus(order.status),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: orderStatusType(order.status),
            ),
          )
        ],
      ),
    );
  }

  String orderStatus(OrderStatus status){
    switch(status){
      case OrderStatus.pending:
        return AppConstants.pending;
      case OrderStatus.cancelled:
        return AppConstants.cancelled;
      case OrderStatus.delivered:
        return AppConstants.delivered;
      default:
        return '';
    }
  }

  Color orderStatusType(OrderStatus status){
    switch(status){
      case OrderStatus.pending:
        return AppColors.primary1;
      case OrderStatus.cancelled:
        return Colors.red;
      case OrderStatus.delivered:
        return Colors.green;
      default:
        return AppColors.darkGrey;
    }
  }

}
