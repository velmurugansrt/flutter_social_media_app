import 'dart:async';
import 'package:bloc/bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeInitialState get initialState => HomeInitialState();
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {}
}
