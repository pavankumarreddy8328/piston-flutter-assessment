import 'package:flutter/material.dart';
import 'package:zpay/core/utils/helper_functions.dart';
import 'package:zpay/src/transactions/domain/entities/transaction.dart';

class TransactionDetailPage extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        
        title: const Text('Transaction Details',
      style: TextStyle(
        color: Colors.white
      ),
      ),
      centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(HelperFunctions.formatCustomDate(transaction.date.toString()),
                 style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                 
                ),),

                SizedBox(
                  height: 12,
                ),
            Card(
              color: Colors.blueGrey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Note:  ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
            
                          TextSpan(
                            text: transaction.description,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                  height: 12,
                ),
                    Text(
                      'ID: ${transaction.id}',
                      style: const TextStyle(fontSize: 18),
                    ),
             SizedBox(
                  height: 12,
                ),
                    Text('Amount: ₹${transaction.amount.toStringAsFixed(2)}',
                     style: TextStyle(
                      fontSize: 20,
                     
                    ),),
                     SizedBox(
                  height: 12,
                ),
                   RichText(text: 
                   TextSpan(
                    children: [
                      TextSpan(
                            text: "Type:  ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),

                       TextSpan(
                        text: " ${creditOrDebitString(transaction.amount)}",
                    style: TextStyle(
                      fontSize: 20,
                      color:  HelperFunctions.creditOrDebit(transaction.amount) ? Colors.green : Colors.red
                    ), ),
                    ]
                   )),
                    SizedBox(
                  height: 12,
                ),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String creditOrDebitString(double amount){
    if(amount > 0){
      return "Credit";
    }
    else{
      return "Debit";
    }
  }
}
