import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ProfileBox extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String imageUrl;

  const ProfileBox(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkGrey,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ]
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imageUrl),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5),
              Text(
                phoneNumber,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
