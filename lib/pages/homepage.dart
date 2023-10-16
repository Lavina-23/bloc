import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/pages/data_counter.dart';

class Homepage extends StatelessWidget {
  const Homepage ({super.key});

  @override
  Widget build(BuildContext context) {
  Counter mycounter = BlocProvider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("DEPENDENCY INJECTION"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material (
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  mycounter.decrement();
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.remove, color: Colors.white,),
                ),
              ),
            ),
            DataCounter(),
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  mycounter.increment();
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon (Icons.add, color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
