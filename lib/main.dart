import 'package:app_bloc2/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  CounterBloc bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: bloc.output,
          initialData: bloc.counter,
          builder: (context, snapshot) => Text("${snapshot.data}"),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(onPressed: (){
            bloc.sinkInput.add('inc');
          }, child: Text("Inc")),
          ElevatedButton(onPressed: (){
            bloc.sinkInput.add('dec');
          }, child: Text("Dec"))
        ],
      ),
    );
  }
}
