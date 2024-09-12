import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/models/product_slider_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
List<ProductModel> popularCakes = [];
List<ProductModel> specialCakes = [];
List<ProductModel> recommended = [];

@override
  void onInit(){
  fetchProducts();
  super.onInit();
}

void fetchProducts(){
  popularCakes = [
    ProductModel(imagePath: ImageConstants.popular1, name: AppConstants.hazelnutCake, price: ' ₹1200.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.popular2, name: AppConstants.butterscotchCake, price: ' ₹500.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.popular3, name: AppConstants.chocolateCake, price: ' ₹650.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.popular4, name: AppConstants.freshFruitCake, price: ' ₹700.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.popular5, name: AppConstants.paanLayeredCake, price: ' ₹500.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.popular6, name: AppConstants.cherryForestCake, price: ' ₹650.00', rating: '5.0', reviews: '25'),
  ];

  specialCakes = [
    ProductModel(imagePath: ImageConstants.special1, name: AppConstants.donutCombo, price: ' ₹120.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.special2, name: AppConstants.chocolateBurger, price: ' ₹100.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.special3, name: AppConstants.buttercreamCupcake, price: ' ₹40.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.special4, name: AppConstants.oreoCheesePastry, price: ' ₹85.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.special5, name: AppConstants.creamDonut, price: ' ₹65.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.special6, name: AppConstants.candyFloss, price: ' ₹1000.00', rating: '5.0', reviews: '25'),
  ];

  recommended = [
    ProductModel(imagePath: ImageConstants.recommended1, name: AppConstants.kajuHoneyStick, price: ' ₹200.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.recommended2, name: AppConstants.whiteBread, price: ' ₹45.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.recommended3, name: AppConstants.potatoChips, price: ' ₹40.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.recommended4, name: AppConstants.nachos, price: ' ₹60.00', rating: '5.0', reviews: '25'),
    ProductModel(imagePath: ImageConstants.recommended5, name: AppConstants.bhujia, price: ' ₹50.00', rating: '5.0', reviews: '25'),
  ];
}


}