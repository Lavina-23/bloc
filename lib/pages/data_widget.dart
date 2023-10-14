import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Counter mycounter = BlocProvider.of<Counter>(context);
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: Center(
        child:BlocBuilder(
          bloc: mycounter,
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            );
          }
        )
      ),
    );
  }
}