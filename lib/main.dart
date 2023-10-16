import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/other/other.dart';
import 'package:learn_bloc/pages/homepage.dart';
import 'package:learn_bloc/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = MyRouter();
  final Counter mycounter = Counter();

  @override
  Widget build(BuildContext context) {

    // Global access
    return BlocProvider(
      create:(context) => Counter(),
      child: MaterialApp(
        home: Homepage(),
      ),


      // Named route access
      // initialRoute: "/",
      // routes: {
      //   "/" : (context) => BlocProvider.value(
      //     value: mycounter,
      //     child: Homepage(),
      //   ),
      //   "/other" : (context) =>BlocProvider.value(
      //     value: mycounter,
      //     child: OtherPage(),
      //   ),
      // },

      // Generated route access
      // onGenerateRoute: router.onRoute,

    );
  }
}