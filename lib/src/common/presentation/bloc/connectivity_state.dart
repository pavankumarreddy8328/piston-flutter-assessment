part of 'connectivity_bloc.dart';

sealed class ConnectivityState extends Equatable {
  const ConnectivityState();
  
  @override
  List<Object> get props => [];
}



class Connected extends ConnectivityState {}

class Disconnected extends ConnectivityState {}