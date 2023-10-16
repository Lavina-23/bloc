import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/404/404.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/other/other.dart';
import 'package:learn_bloc/pages/homepage.dart';

// Generated route access

class MyRouter {
  final Counter mycounter = Counter();
  
  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: mycounter,
            child: Homepage(),
          ),
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: mycounter,
            child: OtherPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: mycounter,
            child: NotFoundPage(),
          ),
        );
    }
  }
}