import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/bloc/theme.dart';
import 'package:learn_bloc/pages/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Multi bloc ptovider
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
        ],
        child: App(),
      );

    // Nested bloc provider
    // return BlocProvider(
    //   create: (context) => mytheme,
    //   child: BlocBuilder<ThemeBloc, bool>(
    //     bloc: mytheme,
    //     builder: (context, state) {
    //       return MaterialApp(
    //         theme: state == true ? ThemeData.light():ThemeData.dark(),
    //         home: BlocProvider(
    //           create: (context) => CounterBloc(),
    //           child: Homepage(),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
