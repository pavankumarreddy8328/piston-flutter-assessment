import 'package:equatable/equatable.dart';
import 'package:zpay/core/usecase/usecase.dart';
import 'package:zpay/core/utils/typedef.dart';
import 'package:zpay/src/transactions/domain/entities/transaction.dart';
import 'package:zpay/src/transactions/domain/repositories/transactions_repository.dart';

class FetchTransactions extends UsecaseWithParams<void,TransactionParams>{

  const FetchTransactions(this._repository);
  final TransactionsRepository _repository;
  @override
  ResultFuture<List<Transaction>> call(TransactionParams params) async => _repository.getTransactionsFromAPI();

  
}


class TransactionParams extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}