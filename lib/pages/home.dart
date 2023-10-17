import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/user.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc myuser = context.read<UserBloc>();

    // Extention method
    // 1. CounterBloc mycounter = context.read<CounterBloc>(); // hanya bisa build sekali
    // 2. CounterBloc mycounter = context.watch<CounterBloc>(); // bisa build berkali kali, tapi semuanya jadi direbuild juga
    
    // 3. String nameUser = context.select<UserBloc, String>((value) => value.state["name"],);
    // 3. int ageUser = context.select<UserBloc, int>((value) => value.state["age"],);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                String nameUser = context.select<UserBloc, String>((value) => value.state["name"],);
                return Text("NAMA : $nameUser");
              }
            ),
            Builder(
              builder: (context) {
                int ageUser = context.select<UserBloc, int>((value) => value.state["age"],);
                return Text("UMUR : $ageUser");
              }
            ),

            // Builder(
            //   builder: (context) {
            //     CounterBloc mycounter = context.watch<CounterBloc>();
            //     return Text(
            //       "${mycounter.state}",
            //       style: const TextStyle(fontSize: 100),
            //     );
            //   }
            // ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => myuser.changeAge(context.read<UserBloc>().state["age"] - 1),
                  icon: const Icon(Icons.remove)
                ),
                IconButton(
                  onPressed: () => myuser.changeAge(context.read<UserBloc>().state["age"] + 1),
                  icon: const Icon(Icons.add)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}