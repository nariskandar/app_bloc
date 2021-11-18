import 'package:app_bloc2/counter/counter_bloc.dart';
import 'package:app_bloc2/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => CounterCubit())
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<CounterBloc, CounterState> (
          listenWhen: (prev, curr) => curr.number > 5 ? true : false,
          listener: (context, snapshot) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 500),
              content: Text("Upper 5"),
            )
          ),
          builder: (context, snapshot) =>  Text("${snapshot.number}", style: TextStyle(
            fontSize: 700
          ),),
        )
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
              child: Text("Inc")),
          ElevatedButton(
              onPressed: () => context.read<CounterBloc>().add(DecrementEvent()),
              child: Text("Dec"))
        ],
      ),
    );
  }
}
