//Adding a function to return List of Transactions from the Map
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:zpay/src/transactions/domain/entities/transaction.dart';
part 'transactions_response.g.dart';

List<Transaction> parseTransactions(String responseBody) {
  return transactionResponseFromJson(responseBody).transactions;
}

TransactionResponse transactionResponseFromJson(String str) => TransactionResponse.fromJson(json.decode(str));

String transactionResponseToJson(TransactionResponse data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class TransactionResponse {
    @HiveField(0)
    List<Transaction> transactions;

    TransactionResponse({
        required this.transactions,
    });

    factory TransactionResponse.fromJson(Map<String, dynamic> json) => TransactionResponse(
        transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
    };
}