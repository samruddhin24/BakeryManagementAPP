import 'package:bakery_app/constants/constants.dart';
import 'package:get/get.dart';
import '../login/login_screen.dart';
import 'intro_model.dart';

class IntroController extends GetxController {
  var currentPage = 0.obs;

  List<IntroModel> introModels = [
    IntroModel(
      description: AppConstants.introPage1Heading,
      subDescription: AppConstants.introPage1SubHeading,
      image: ImageConstants.intro01, // Update with actual asset path
    ),
    IntroModel(
      description: AppConstants.introPage2Heading,
      subDescription: AppConstants.introPage2SubHeading,
      image: ImageConstants.intro02, // Update with actual asset path
    ),
    IntroModel(
      description: AppConstants.introPage3Heading,
      subDescription: AppConstants.introPage3SubHeading,
      image: ImageConstants.intro03, // Update with actual asset path
    ),
  ];

  //method to increment page count
  void nextPage() {
    if (currentPage.value < introModels.length - 1) {
      currentPage.value++;
      update();
    } else {
      Get.offNamed(RouteConstants.loginScreen);
    }
  }

  //method to skip intro page and go directly to login page
  void skipToLastPage() {
    Get.offNamed(RouteConstants.loginScreen, arguments: introModels.last);
  }
}