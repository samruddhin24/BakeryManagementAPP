class CustomerDetails {
  final String name;
  final String phoneNumber;
  final String address;

  CustomerDetails({
    required this.name,
    required this.phoneNumber,
    required this.address,
  });
}

class OrderDetails {
  final String orderId;
  final String product;
  final String orderDate;
  final double price;
  final String status;

  OrderDetails({
    required this.orderId,
    required this.product,
    required this.orderDate,
    required this.price,
    required this.status,
  });
}

class PriceSummary {
  final double itemTotal;
  final double gstCharge;
  final double grandTotal;
  final String paymentMode;

  PriceSummary({
    required this.itemTotal,
    required this.gstCharge,
    required this.grandTotal,
    required this.paymentMode,
  });
}
