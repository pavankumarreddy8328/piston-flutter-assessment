import 'package:get_it/get_it.dart';
import 'package:zpay/core/network/connection_helper.dart';
import 'package:zpay/core/network/connection_service.dart';
import 'package:zpay/src/common/presentation/bloc/connectivity_bloc.dart';
import 'package:zpay/src/transactions/data/datasources/transactions_datasource.dart';
import 'package:zpay/src/transactions/data/repositories/transactions_repository_implementation.dart';
import 'package:zpay/src/transactions/domain/repositories/transactions_repository.dart';
import 'package:zpay/src/transactions/domain/usecases/fetch_transactions.dart';
import 'package:zpay/src/transactions/presentation/bloc/transactions_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl
  //InternetChecker
  ..registerSingleton(InternetConnectionHelper())
  ..registerLazySingleton(() => ConnectivityService())
  ..registerLazySingleton(() => ConnectivityBloc())
  //AppLogic
  ..registerFactory(() => TransactionsBloc(fetchTransactions: sl()))
  //Usecases
  ..registerLazySingleton(()=>FetchTransactions(sl()))
  //Repositores
  ..registerLazySingleton<TransactionsRepository>(()=>TransactionsRepositoryImplementation(sl()))
  //DataSources
  ..registerLazySingleton<TransactionsDataSource>(() => TransactionsDataImpl());
}