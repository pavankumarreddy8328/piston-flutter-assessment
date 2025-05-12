
import 'package:dartz/dartz.dart';
import 'package:zpay/core/errors/exceptions.dart';
import 'package:zpay/core/errors/failure.dart';
import 'package:zpay/core/utils/typedef.dart';
import 'package:zpay/src/transactions/data/datasources/transactions_datasource.dart';
import 'package:zpay/src/transactions/domain/entities/transaction.dart';
import 'package:zpay/src/transactions/domain/repositories/transactions_repository.dart';


class TransactionsRepositoryImplementation implements TransactionsRepository {
  final TransactionsDataSource _transactionsDataSource;
 

  TransactionsRepositoryImplementation(this._transactionsDataSource);
  
  @override
  ResultFuture<List<Transaction>> getTransactionsFromAPI() async{
    // TODO: implement getTransactionsFromAPI
   try{
     
     List<Transaction> cachedTransactions  = await _transactionsDataSource.getTransactionsFromAPI();
    return Right(cachedTransactions);
  
   }
    on APIException catch(e){
      return Left(APIFailure.fromException(e));
    }
  }
  
  @override
  ResultFuture<List<Transaction>> getTransactionsFromCache() {
    // TODO: implement getTransactionsFromCache
    throw UnimplementedError();
  }

 
  
  
}
