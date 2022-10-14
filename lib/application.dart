import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webspark_test/bloc/progress/progress_bloc.dart';
import 'package:flutter_webspark_test/presentation/screens/home_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          /// Creating a new instance of the ProgressBloc and providing it to the widget tree.
          BlocProvider(create: (context) {
            return ProgressBloc();
          })
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ));
  }
}
