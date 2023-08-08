import 'package:cookbook/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.count.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filled(
                        onPressed: () {
                          context.read<CounterBloc>().add(CountDecrement());
                        },
                        icon: const Icon(Icons.remove)),
                    const SizedBox(
                      width: 50,
                    ),
                    IconButton.filled(
                        onPressed: () {
                          context.read<CounterBloc>().add(CountIncrement());
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/pagetwo', arguments: context);
                  },
                  child: const Text("Navigate"),
                )
              ],
            )),
          );
        },
      ),
    );
  }
}
