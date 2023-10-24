import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_abbas/models/shop_app/shop_login_model.dart';
import 'package:flutter_abbas/modules/shop_app/login/shop_cubit/shop_states.dart';
import 'package:flutter_abbas/shared/components/constants.dart';
import 'package:flutter_abbas/shared/network/end_points.dart';
import 'package:flutter_abbas/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialStates());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingStates());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      // print(loginModel!.status);
      // print(loginModel!.data!.token);
      // print(loginModel!.message);
      emit(ShopLoginSuccessStates(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorStates(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changPasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopChangPasswordVisibilityStates());
  }
}
