import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/user.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userBloc,
          //   builder: (context, state) {
          //     return Text("NAMA : ${state['name']}");
          //   },
          // ),
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userBloc,
          //   builder: (context, state) {
          //     return Text("UMUR : ${state['age']} tahun");
          //   },
          // ),

          BlocSelector<UserBloc, Map<String, dynamic>, String> (
            selector: (state) => state['name'],
            builder: (context, state) {
              return Text("NAMA : $state");
            }
          ),

          BlocSelector<UserBloc, Map<String, dynamic>, int> (
            selector: (state) => state['age'],
            builder: (context, state) {
              return Text("UMUR : $state");
            }
          ),

          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) => userBloc.changeName(value),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  userBloc.changeAge(userBloc.state["age"] - 1);
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  userBloc.changeAge(userBloc.state["age"] + 1);
                },
                icon: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
