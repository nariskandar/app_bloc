import 'dart:async';

class CounterBloc {
  int _counter = 0;
  int get counter => _counter;

  StreamController _inputController = StreamController();
  StreamSink get sinkInput => _inputController.sink;

  StreamController _outputController = StreamController();
  StreamSink get sinkOutput => _outputController.sink;

  Stream get output => _outputController.stream;

  CounterBloc() {
    _inputController.stream.listen((event) {
      event == 'inc' ? _counter++ : _counter--;
      sinkOutput.add(_counter);
    });
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
