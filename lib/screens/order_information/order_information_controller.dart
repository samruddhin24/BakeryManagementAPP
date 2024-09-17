import 'package:bakery_app/models/order_information_model.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';

class OrderInformationController extends GetxController {
  var customerDetails = CustomerDetails(
    name: 'Atharva Joshi',
    phoneNumber: '7350125844',
    address: 'School of Hospitality',
  ).obs;

  var orderDetails = OrderDetails(
    orderId: "211054",
    product: AppConstants.hazelnutCake,
    orderDate: "17-09-2024",
    price: 1200.00,
    status: "Pending",
  ).obs;

  var priceSummary = PriceSummary(
    itemTotal: 1140.00,
    gstCharge: 60.00,
    grandTotal: 1200.00,
    paymentMode: 'UPI',
  ).obs;
}
