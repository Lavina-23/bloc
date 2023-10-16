import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: Text("OTHER PAGE"),
      ),
      body: Center(
        child: BlocBuilder<Counter, int>(
          bloc: counter,
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(fontSize: 50),
            );
          }, 
        ),
      ),
    );
  }
}