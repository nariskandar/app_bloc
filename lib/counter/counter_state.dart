part of 'counter_bloc.dart';

@immutable
abstract class CounterState{
  final int number;

  const CounterState(this.number);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);

  // @override
  // List<Object> get props => [];
}

class CounterLoaded extends CounterState {
  const CounterLoaded(int number) : super(number);
  // @override
  // List<Object?> get props => throw UnimplementedError();

}