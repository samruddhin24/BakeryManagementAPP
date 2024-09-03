import 'package:bakery_app/binding/controller_binding.dart';
import 'package:bakery_app/constants/app_constants.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/routes/app_routes.dart';
import 'package:bakery_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.title,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: ControllerBinding(),
      initialRoute: RouteConstants.splashScreen,
      getPages: AppRoutes.routes,
    );
  }
}





