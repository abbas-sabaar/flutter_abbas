import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_abbas/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_abbas/layout/shop_app/shop_layout.dart';
import 'package:flutter_abbas/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_abbas/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:flutter_abbas/shared/bloc_observer.dart';
import 'package:flutter_abbas/shared/components/constants.dart';
import 'package:flutter_abbas/shared/cubit/cubit.dart';
import 'package:flutter_abbas/shared/cubit/states.dart';
import 'package:flutter_abbas/shared/network/local/cache_helper.dart';
import 'package:flutter_abbas/shared/network/remote/dio_helper.dart';
import 'package:flutter_abbas/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/news_app/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;
  Widget widget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print(token);

  if (onBoarding != null) {
    if (token != null)
      widget = ShopLayout();
    else
      widget = ShopLoginScreen();
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  MyApp({this.isDark, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusiness()..getSports()..getScience(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()..changeAppMod(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (context) => ShopCubit()..getHomeData()..getCategories()..getFavorites(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
