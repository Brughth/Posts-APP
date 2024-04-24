import 'package:demo2/auth/presentation/pages/register_screen.dart';
import 'package:demo2/counter_with_bloc/logic/bloc/counter_bloc.dart';
import 'package:demo2/counter_with_cubit/logic/cubit/counter_cubit.dart';
import 'package:demo2/counter_with_cubit/presentation/counter_screen.dart';
import 'package:demo2/genderize/presentation/genderize_screen.dart';
import 'package:demo2/posts/presentation/pages/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_with_bloc/presentation/counter_screent2.dart';

class ApplicationScree extends StatelessWidget {
  const ApplicationScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state1) {
            return BlocBuilder<CounterBloc, CounterState2>(
              builder: (context, state2) {
                return Text(
                    "Formation Flutter LH ${state1.counter}/${state2.counter}");
              },
            );
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Authentication"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          ListTile(
            title: const Text("Post App"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PostScreen(),
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          ListTile(
            title: const Text("Genderize"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const GenderizeScreen(),
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          ListTile(
            title: const Text("Counter App With Cubit"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CounterScreen(),
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          ListTile(
            title: const Text("Counter App With Bloc"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CounterScreen2(),
              ));
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
