import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zpay/core/network/connection_helper.dart';
import 'package:zpay/core/services/injection_container.dart';
import 'package:zpay/core/utils/typedef.dart';
import 'package:zpay/src/transactions/domain/entities/transaction.dart';
import 'package:zpay/src/transactions/domain/usecases/fetch_transactions.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final FetchTransactions _fetchTransactions;
  List<Transaction> transactions = [];
  TransactionsBloc({required FetchTransactions fetchTransactions})
    : _fetchTransactions = fetchTransactions,

      super(TransactionsInitial()) {
    on<FetchTransactionsEvent>(_getTransactions);
  }

  Future<void> _getTransactions(
    FetchTransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(const TransactionsLoadingState());

    final bool isConnected = await sl<InternetConnectionHelper>().checkInternetConnection();


    if(isConnected){
    final result = await _fetchTransactions(TransactionParams());

    result.fold(
      (failure) {
        emit(TransactionsErrorState(failure.errorMessage));
        //Here it fetches from cache
      },
      (success) {
        print("Length of :: ${success.length}");

        if (transactions != success) {
          transactions = success;
          emit(TransactionsSuccessState(success));
        }
      },
    ); 
  }

  else{
    //If not connected to internet
    emit(NoInternetState());
  }
  }
}
