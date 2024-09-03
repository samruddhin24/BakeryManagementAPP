import 'package:bakery_app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../constants/route_constants.dart';

class SplashController extends GetxController{

  @override
  onReady(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.offNamed(RouteConstants.introScreen);
    });
  }
}