import 'package:hive/hive.dart';
import 'package:zpay/config/constants/db_keys.dart';
import 'package:zpay/core/utils/logger.dart';
import 'package:zpay/src/common/domain/repos/hive_repository.dart';
import 'package:zpay/src/transactions/data/models/transactions_response.dart';

class HiveDataSource implements HiveRepository<TransactionResponse>{

  static const _key = DbKeys.transactions;

  //Product Box 
  late final Box<TransactionResponse> _transactionsBox;

  Future<void> initDataBase() async{
   try{
      Hive.registerAdapter(TransactionResponseAdapter());
      _transactionsBox = await Hive.openBox(_key);
    logger.i('Success on Initializing Database');
   }catch(e){
     logger.e('Error in initialization of Box Database');
   }
  }
  @override
  Future<TransactionResponse?> getAll() async{
    try{
       if(_transactionsBox.isOpen && _transactionsBox.isNotEmpty){
        TransactionResponse? transactionResponse = _transactionsBox.get(_key);
        return transactionResponse;
       }
    }catch(e){
      logger.e("Error in reading Database");
    }
    return null;
  }

  @override
  Future<void> insertItem({required TransactionResponse object}) async{
    try{

    }
    catch(e){
      
    }
  }

  @override
  Future<bool> isDataAvailable() {
    // TODO: implement isDataAvailable
    throw UnimplementedError();
  }
  
}