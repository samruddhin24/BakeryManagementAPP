import 'package:bakery_app/constants/constants.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  void editProfile(){
    Get.toNamed(RouteConstants.editProfileScreen);
  }

  void myOrders(){
    Get.toNamed(RouteConstants.orderStatusScreen);
  }

  //screen for privacy policy,support remaining.

  void logout(){
    Get.toNamed(RouteConstants.loginScreen);
  }

  void deleteAccount(){
    //delete account logic
  }
}