import 'package:get/get.dart';
import 'package:bakery_app/screens/screens.dart';
import 'package:bakery_app/constants/constants.dart';


class AppRoutes{
  static final routes = [
    GetPage(name: RouteConstants.cartScreen, page: ()=> const CartScreen()),
    GetPage(name: RouteConstants.categoriesScreen, page: ()=> const CategoriesScreen()),
    GetPage(name: RouteConstants.favouritesScreen, page: ()=> const FavouritesScreen()),
    GetPage(name: RouteConstants.homeScreen, page: ()=> const HomeScreen()),
    GetPage(name: RouteConstants.introScreen, page: ()=> const IntroScreen()),
    GetPage(name: RouteConstants.loginScreen, page: ()=>  LoginScreen()),
    GetPage(name: RouteConstants.orderStatusScreen, page: ()=> const OrderStatusScreen()),
    GetPage(name: RouteConstants.otpScreen, page: ()=> const OtpScreen()),
    GetPage(name: RouteConstants.descriptionScreen, page: ()=> const DescriptionScreen()),
    GetPage(name: RouteConstants.productScreen, page: ()=> const ProductScreen()),
    GetPage(name: RouteConstants.profileScreen, page: ()=> const ProfileScreen()),
    GetPage(name: RouteConstants.registerScreen, page: ()=> const RegistrationScreen()),
    GetPage(name: RouteConstants.splashScreen, page: ()=> const SplashScreen()),
  ];
}