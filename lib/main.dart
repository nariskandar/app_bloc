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
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CounterBloc>(context);
    print("build");

    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, snapshot) => Text("$snapshot")
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {
                bloc.add('inc');
              },
              child: Text("Inc ++")),
          ElevatedButton(
              onPressed: () {
                bloc.add('dec');
              },
              child: Text("Dec --"))
        ],
      ),
    );
  }
}
