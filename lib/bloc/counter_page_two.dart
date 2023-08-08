import 'package:cookbook/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPageTwo extends StatelessWidget {
  const CounterPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final blocContext = ModalRoute.of(context)?.settings.arguments as BuildContext;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: content(blocContext),
    );
  }

  Widget content(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CounterBloc>(context),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  state.count.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
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
            ],
          ));
        },
      ),
    );
  }
}
