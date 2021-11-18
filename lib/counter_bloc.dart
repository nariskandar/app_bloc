import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  int _counter = 0;

  void increment () => emit(_counter++);
  void decrement () => emit(_counter--);

}
