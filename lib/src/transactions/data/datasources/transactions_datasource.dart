import 'package:flutter/foundation.dart';
import 'package:zpay/src/transactions/data/models/transactions_response.dart';
import 'package:zpay/src/transactions/domain/entities/transaction.dart';
import 'package:http/http.dart' as http;
abstract class TransactionsDataSource{
  Future<List<Transaction>> getTransactionsFromAPI();

  Future<List<Transaction>> getTransactionsFromCache();

}

class TransactionsDataImpl implements TransactionsDataSource{
  const TransactionsDataImpl();
  @override
  Future<List<Transaction>> getTransactionsFromAPI() async{
    try{
     Uri url = Uri.parse("https://run.mocky.io/v3/c6115a4f-9a0b-4ef1-8ffa-3d6faafa54f8");
     http.Response response = await http.get(url,
     );
     //Succesfull Response
     if(response.statusCode == 200){
      print(response.body);
      //Using compute function to offload JSON parsing to isolate.
      return compute(parseTransactions, response.body);
     }
     else{
      return [];
     }
   }
   catch(e){
     return [];
  }
  }
  
  @override
  Future<List<Transaction>> getTransactionsFromCache() {
    // TODO: implement getTransactionsFromCache
    throw UnimplementedError();
  }
  
}