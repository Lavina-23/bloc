import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CUBIT APPS"),
      ),
      body: const Column(
        children: [
          Center(
            child: Text(
              "...",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove)
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              )
            ],
          ),
        ],
      ),
    );
  }
}