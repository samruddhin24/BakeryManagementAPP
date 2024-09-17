import 'package:bakery_app/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;

  const ProfileTabs(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.textColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: iconColor ?? AppColors.black,),
      title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: textColor ?? AppColors.black),),
      trailing: const Icon(Icons.arrow_forward_ios,size: 16),
      onTap: onTap,
    );
  }
}
