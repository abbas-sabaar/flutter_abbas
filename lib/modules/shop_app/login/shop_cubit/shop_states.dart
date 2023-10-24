import 'package:flutter_abbas/models/shop_app/shop_login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialStates extends ShopLoginStates {}

class ShopLoginLoadingStates extends ShopLoginStates {}

class ShopLoginSuccessStates extends ShopLoginStates {
  final ShopLoginModel loginModel;
  ShopLoginSuccessStates(this.loginModel);
}

class ShopLoginErrorStates extends ShopLoginStates {
  final error;
  ShopLoginErrorStates(this.error);
}

class ShopChangPasswordVisibilityStates extends ShopLoginStates {}
