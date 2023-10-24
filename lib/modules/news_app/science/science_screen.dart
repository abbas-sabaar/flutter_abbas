import 'package:flutter/material.dart';
import 'package:flutter_abbas/layout/news_app/cubit/cubit.dart';
import 'package:flutter_abbas/layout/news_app/cubit/states.dart';
import 'package:flutter_abbas/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsSates>(
      listener: (context, states) {},
      builder: (context, states) {
        var list = NewsCubit.get(context).science;
        return articleBuilder(list, context);
      },
    );
  }
}
