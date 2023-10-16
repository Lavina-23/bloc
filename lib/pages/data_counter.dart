import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';

class DataCounter extends StatelessWidget {
  const DataCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Counter mycounter = BlocProvider.of<Counter>(context);
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: Container(
        margin: const EdgeInsets.all(20),
        color: Colors.amber,
        child: Container(
          margin: const EdgeInsets.all(20),
          color: Colors.blue,
          child: Center(
            child: BlocBuilder(
              bloc: mycounter,
              builder: (context, state) => Text(
                "$state",
                style: const TextStyle(fontSize: 50, color: Colors.white),
              )
            ),
          ),
        ),
      ),
    );
  }
}