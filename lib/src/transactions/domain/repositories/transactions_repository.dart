import 'package:zpay/core/utils/typedef.dart';
import 'package:zpay/src/transactions/domain/entities/transaction.dart';

abstract class TransactionsRepository {

  const TransactionsRepository();

   ResultFuture<List<Transaction>> getTransactionsFromAPI();
   ResultFuture<List<Transaction>> getTransactionsFromCache();

}