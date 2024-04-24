import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState2> {
  CounterBloc() : super(const CounterState2(counter: 0)) {
    on<IncrementCounterEvent>((event, emit) {
      var newValue = state.counter + 1;
      emit(CounterState2(counter: newValue));
    });

    on<DecrementCounterEvent>((event, emit) {
      var newValue = state.counter - 1;
      emit(CounterState2(counter: newValue));
    });
  }
}
