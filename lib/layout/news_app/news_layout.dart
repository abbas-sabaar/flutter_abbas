import 'package:flutter/material.dart';
import 'package:flutter_abbas/layout/news_app/cubit/cubit.dart';
import 'package:flutter_abbas/layout/news_app/cubit/states.dart';
import 'package:flutter_abbas/modules/news_app/search/search_screen.dart';
import 'package:flutter_abbas/shared/components/components.dart';
import 'package:flutter_abbas/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsSates>(
      listener: (context, states) {},
      builder: (context, states) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeAppMod();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItme,
          ),
        );
      },
    );
  }
}
