enum OrderStatus{pending,cancelled,delivered,none}

class Order{
  final String id;
  final String date;
  final String title;
  final String price;
  final String image;
  final OrderStatus status;

  Order({
    required this.id,
    required this.date,
    required this.title,
    required this.price,
    required this.image,
    required this.status,
  });
}