import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_abbas/shared/components/components.dart';
import 'package:flutter_abbas/shared/cubit/cubit.dart';
import 'package:flutter_abbas/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var tasks = AppCubit.get(context).newTasks;
        return tasksBuilder(
          tasks: tasks,
        );
      },
    );
  }
}
