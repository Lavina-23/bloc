import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/bloc/theme.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc mycounter = context.read<CounterBloc>();
    ThemeBloc mytheme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Multi bloc listener
            MultiBlocListener(
              listeners: [
                BlocListener<ThemeBloc, bool>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("TEMA GELAP AKTIF"),
                        duration: Duration(seconds: 1), 
                      )
                    );
                  },
                  listenWhen: (previous, current) {
                    if (current == false) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ),
                BlocListener<CounterBloc, int>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("DIATAS 10"),
                        duration: Duration(seconds: 1),
                      )
                    );
                  },
                  listenWhen: (previous, current) {
                    if (current > 10) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ),
              ],
              child: BlocBuilder<CounterBloc, int>(
                bloc: mycounter,
                builder: (context, state) {
                  return Text(
                    "$state",
                    style: const TextStyle(fontSize: 50),
                  );
                },
              ),
            ),

            // Nested bloc listener
            // BlocListener<ThemeBloc, bool>(
            //   listener: (context, state) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         content: Text("TEMA GELAP AKTIF"),
            //         duration: Duration(seconds: 1), 
            //       )
            //     );
            //   },
            //   listenWhen: (previous, current) {
            //     if (current == false) {
            //       return true;
            //     } else {
            //       return false;
            //     }
            //   },
            //   child: BlocListener<CounterBloc, int>(
            //     listener: (context, state) {
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         content: Text("DIATAS 10"),
            //         duration: Duration(seconds: 1),
            //       ));
            //     },
            //     listenWhen: (previous, current) {
            //       if (current > 10) {
            //         return true;
            //       } else {
            //         return false;
            //       }
            //     },
            //     child: BlocBuilder<CounterBloc, int>(
            //       bloc: mycounter,
            //       builder: (context, state) {
            //         return Text(
            //           "$state",
            //           style: const TextStyle(fontSize: 50),
            //         );
            //       },
            //     ),
            //   ),
            // )
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    mycounter.remove();
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    mycounter.add();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        mytheme.changeTheme();
      }),
    );
  }
}
