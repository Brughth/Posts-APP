import 'package:demo2/counter_with_bloc/logic/bloc/counter_bloc.dart';
import 'package:demo2/counter_with_cubit/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen2 extends StatelessWidget {
  const CounterScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    // CounterBloc bloc = CounterBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App With Bloc"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState2>(
              // bloc: bloc,
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
          ),
          Center(
            child: Text(
              context.read<CounterCubit>().state.counter.toString(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () {
              // bloc.add(IncrementCounterEvent());
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              // bloc.add(DecrementCounterEvent());
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
