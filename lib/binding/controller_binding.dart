import 'package:get/get.dart';
import 'package:bakery_app/screens/screens.dart';
import 'package:bakery_app/constants/constants.dart';

class ControllerBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CartController>(()=> CartController(),
    tag: ControllerTags.cartController, fenix: true);

    Get.lazyPut<CategoriesController>(()=> CategoriesController(),
    tag: ControllerTags.categoriesController, fenix: true);

    Get.lazyPut<FavouritesController>(()=> FavouritesController(),
    tag: ControllerTags.favouritesController, fenix: true);

    Get.lazyPut<HomeController>(()=> HomeController(),
    tag: ControllerTags.homeController, fenix: true);

    Get.lazyPut<IntroductionScreenController>(()=> IntroductionScreenController(),
    tag: ControllerTags.introController, fenix: true);

    Get.lazyPut<LoginController>(()=> LoginController(),
    tag: ControllerTags.loginController, fenix: true);

    Get.lazyPut<OrderStatusController>(()=> OrderStatusController(),
    tag: ControllerTags.orderStatusController, fenix: true);

    Get.lazyPut<OrderInformationController>(()=> OrderInformationController(),
    tag: ControllerTags.orderInformationController, fenix: true);

    Get.lazyPut<OtpController>(()=> OtpController(),
    tag: ControllerTags.otpController, fenix: true);

    Get.lazyPut<ProductController>(()=> ProductController(),
    tag: ControllerTags.productController, fenix: true);

    Get.lazyPut<DescriptionController>(()=> DescriptionController(),
    tag: ControllerTags.productDescriptionController, fenix: true);

    Get.lazyPut<ProfileController>(()=> ProfileController(),
    tag: ControllerTags.profileController, fenix: true);

    Get.lazyPut<RegistrationScreenController>(()=> RegistrationScreenController(),
    tag: ControllerTags.registrationController, fenix: true);

    Get.lazyPut<SplashController>(()=> SplashController(),
    tag: ControllerTags.splashController, fenix: true);
  }
}