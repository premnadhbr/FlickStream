import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(value: 0)) {
    on<BottomNavigationEvent>(bottomNavigationEvent);
  }

  FutureOr<void> bottomNavigationEvent(
      BottomNavigationEvent event, Emitter<HomeState> emit) {
    emit(HomeInitial(value: event.value));
  }
}
