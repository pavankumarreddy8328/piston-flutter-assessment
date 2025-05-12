part of 'transactions_bloc.dart';

sealed class TransactionsState extends Equatable {
  const TransactionsState();
  
  @override
  List<Object> get props => [];
}

final class TransactionsInitial extends TransactionsState {}


class TransactionsSuccessState extends TransactionsState{
  const TransactionsSuccessState(this.transactions);
  final List<Transaction> transactions;
  
  @override
  // TODO: implement props
  List<Object> get props => [transactions];
}

class TransactionsLoadingState extends TransactionsState{
  const TransactionsLoadingState();
}

class TransactionsErrorState extends TransactionsState{
  final String message;

  const TransactionsErrorState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
  
}

class NoInternetState extends TransactionsState{
  const NoInternetState();
}