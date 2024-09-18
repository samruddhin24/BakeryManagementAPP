import 'package:bakery_app/constants/constants.dart';
import 'package:get/get.dart';
import '../../models/introduction_screen_model.dart';

class IntroductionScreenController extends GetxController {
  var currentPage = 0.obs;

  List<IntroductionModel> introModels = [
    IntroductionModel(
      description: AppConstants.introPage1Heading,
      subDescription: AppConstants.introPage1SubHeading,
      image: ImageConstants.intro01,
    ),
    IntroductionModel(
      description: AppConstants.introPage2Heading,
      subDescription: AppConstants.introPage2SubHeading,
      image: ImageConstants.intro02,
    ),
    IntroductionModel(
      description: AppConstants.introPage3Heading,
      subDescription: AppConstants.introPage3SubHeading,
      image: ImageConstants.intro03,
    ),
  ];

  void nextPage() {
    if (currentPage.value < introModels.length - 1) {
      currentPage.value++;
      // update();
    } else {
      Get.offNamed(RouteConstants.loginScreen);
    }
  }

  void skipToLastPage() {
    Get.offNamed(RouteConstants.loginScreen, arguments: introModels.last);
  }
}