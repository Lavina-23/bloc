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
  // int? current;
  // int? next;

  void tambahData () {
    emit(state + 1);
  }

  void kurangData () {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
    // current = change.currentState;
    // next = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  CounterCubit mycounter  = CounterCubit(initialData : 0);
  
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
                  child: Column(
                    children: [
                      Text(
                        "${snapshot.data}",
                        style: const TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      // Text(
                      //   "Current : ${mycounter.current}",
                      //   style: TextStyle(
                      //     fontSize: 50,
                      //   ),
                      // ),
                      // Text(
                      //   "Next : ${mycounter.next}",
                      //   style: TextStyle(
                      //     fontSize: 50,
                      //   ),
                      // )
                    ],
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