import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {

    //inc
    on<IncrementEvent>((event, emit) {
      emit(state is CounterLoaded
          ? CounterLoaded(state.number + event.number)
          : CounterLoaded(event.number));
    });

    //dec
    on<DecrementEvent>((event, emit) {
      emit(state is CounterLoaded
          ? CounterLoaded(state.number - 1)
          : const CounterLoaded(-1));
    });
  }
}
