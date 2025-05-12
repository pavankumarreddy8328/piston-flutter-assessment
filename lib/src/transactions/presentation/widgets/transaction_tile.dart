import 'package:flutter/material.dart';
import 'package:zpay/core/utils/helper_functions.dart';
import 'package:zpay/src/transactions/domain/entities/transaction.dart';
import 'package:zpay/src/transactions/presentation/view/transaction_details_page.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.tx});
  final Transaction tx;
  @override
  Widget build(BuildContext context) {
   
    return RepaintBoundary(
      child: ListTile(
        title: Text(tx.description,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w400
        ),
        ),
        
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('₹ ${tx.returnAmount()}',
            style: TextStyle(
              fontSize: 16,
              color: HelperFunctions.creditOrDebit(tx.amount) ? Colors.green : Colors.red
            ),
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TransactionDetailPage(transaction: tx),
            ),
          );
        },
      ),
    );
  }


 
}
