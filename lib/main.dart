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
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  void tambahData () {
    emit(state + 1);
  }

  void kurangData () {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  CounterCubit mycounter  = CounterCubit(initialData: 60);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CUBIT APPS"),
      ),
      body: Column(
        children: [
          StreamBuilder (
            initialData: mycounter.initialData,
            stream: mycounter.stream,
            builder: (context, snapshot) {
                return Center(
                  child: Text(
                    "${snapshot.data}",
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                );
              }
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  mycounter.kurangData();
                },
                icon: Icon(Icons.remove)
              ),
              IconButton(
                onPressed: () {
                  mycounter.tambahData();
                },
                icon: Icon(Icons.add),
              )
            ],
          ),
        ],
      ),
    );
  }
}