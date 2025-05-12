
import 'package:equatable/equatable.dart';

class Transaction extends Equatable{
  final String id;
  final String description;
  final double amount;
  final DateTime date;

  Transaction({required this.id, required this.description, required this.amount, required this.date});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(id: json['id'], description: json['description'], amount: json['amount'], date: DateTime.parse(json['date']));
  }
  

  String returnAmount(){
    return amount.toStringAsFixed(2);
  }
   Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "amount": amount,
        "date": date.toIso8601String(),
    };

     @override
      // TODO: implement props
      List<Object?> get props => [id,description,amount,date];
}



