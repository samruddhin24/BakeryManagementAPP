import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/screens/products/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_slider_model.dart';

class ProductSlider extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  const ProductSlider({
    required this.products,
    required this.title,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  Get.to(const ProductScreen());
                },
                child: const Row(
                  children: [
                    Text(
                      'View',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppColors.darkGrey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: products.map((product){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProductItem(product: product),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(product.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.yellow, size: 16),
            const SizedBox(width: 4),
            Text(
              product.rating,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 4),
            Text(
              '(${product.reviews})',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Text(
          product.price,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
