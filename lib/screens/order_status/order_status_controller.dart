import 'package:bakery_app/constants/constants.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../models/ordered_item_model.dart';

class OrderStatusController extends GetxController{

  var orders = <Order>[].obs;
  var filteredOrders = <Order>[].obs;
  var selectedFilter = OrderStatus.pending.obs;
  var selectedTemporaryFilter = OrderStatus.pending.obs;

  void onInit(){
    super.onInit();
    fetchOrders();
  }

  void fetchOrders(){
    var allOrders = [
      Order(id: '#25113', date: '05 January 2024', title: AppConstants.buttercreamCupcake, price: '₹40.00', image: ImageConstants.special3, status: OrderStatus.pending),
      Order(id: '#25114', date: '06 January 2024', title: AppConstants.hazelnutCake, price: '₹1200.00', image: ImageConstants.popular1, status: OrderStatus.delivered),
      Order(id: '#25115', date: '07 January 2024', title: AppConstants.creamDonut, price: '₹65.00', image: ImageConstants.recommended5, status: OrderStatus.cancelled),
    ];

    orders.addAll(allOrders);
    applyFilter();
  }

  void applyFilter(){
    filteredOrders.value = orders.where((order) => order.status == selectedFilter.value).toList();
  }

  void setTemporaryFilter(OrderStatus status) {
    selectedTemporaryFilter.value = status;
  }

  void applyTemporaryFilter(){
    selectedFilter.value = selectedTemporaryFilter.value;
    applyFilter();
  }

}