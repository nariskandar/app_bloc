import 'package:app_bloc2/bloc/counter_bloc.dart';
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
    // var bloc = BlocProvider.of<CounterBloc>(context);
    var bloc = context.read<CounterBloc>();
    var cubit = context.read<CounterCubit>();

    print("build");

    return Scaffold(
      body: Center(
        child: BlocConsumer<CounterCubit, int>(
          listenWhen: (prev, curr) => curr > 5 ? true : false,
          listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 300),
              content: Text("Hai"),
            )
          ),
          builder: (context, state) => Text("$state")
        )
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {
                cubit.increment();
              },
              child: Text("Inc ++")),
          ElevatedButton(
              onPressed: () {
                cubit.decrement();
              },
              child: Text("Dec --"))
        ],
      ),
    );
  }
}
