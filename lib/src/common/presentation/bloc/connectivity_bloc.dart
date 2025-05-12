import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(Connected()) {
    on<ConnectivityChanged>((event, emit) {
        if (event.isConnected) {
        emit(Connected());
      } else {
        emit(Disconnected());
      }
    });
  }
}
