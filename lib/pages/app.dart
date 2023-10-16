import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/theme.dart';
import 'package:learn_bloc/pages/homepage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // ThemeBloc mytheme = context.read<ThemeBloc>();
    return BlocBuilder<ThemeBloc, bool>(
      // bloc: mytheme,
      bloc: context.read<ThemeBloc>(),
      builder: (context, state) {
        return MaterialApp(
          theme: state == true ? ThemeData.light():ThemeData.dark(),
          home: const Homepage(),
        );
      },
    );
  }
}
