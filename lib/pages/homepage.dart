import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/pages/data_widget.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  Counter mycounter = Counter();

  @override
  Widget build(BuildContext context) {
    Counter mycounter = BlocProvider.of<Counter>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("BLOC PROVIDER"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // minus
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {
                      mycounter.decrement();
                    },
                    child: const SizedBox(
                      height: 100,
                      width: 70,
                      child: Center(
                        child: Icon(Icons.remove, color: Colors.white,),
                      ),
                    ),
                  ),
                ),
                // data
                DataWidget(),
                // plus
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {
                      mycounter.increment();
                    },
                    child: const SizedBox(
                      height: 100,
                      width: 70,
                      child: Center(
                        child: Icon(Icons.add, color: Colors.white,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
