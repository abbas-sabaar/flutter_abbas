import 'package:flutter_abbas/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_abbas/shared/components/components.dart';
import 'package:flutter_abbas/shared/network/local/cache_helper.dart';

/////
////

// base url     :   https://newsapi.org/
//  method(url) :     v2/top-headlines?
// queries      :   country=eg&category=business&apiKey=dbc06a8a43044e2397982881f5388160

// Search

// https://newsapi.org/
// v2/everything?
// q=tesla&apiKey=dbc06a8a43044e2397982881f5388160

// abdullahMansour
// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//98KjkLDr2K1y969xSHEYNq6OAeOk9ys7Wg6EBEPILW4dJI3CdcyIbxavtVwFUzReuIrbKI
//ZqZvQ7lQJcWfTtl6NFZ63BGLVIjabTlf01EBJo6Kr2ovcMyVtcwExFI04S7wZ68Cm0tVGL

String? token;

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

void printFullText(text) {
  final pattern = RegExp('.{1,800}'); // 800 si the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
// 'https://letsenhance.io/static/334225cab5be263aad8e3894809594ce/75c5a/MainAfter.jpg';
