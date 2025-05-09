import 'package:flutter/material.dart';
import 'package:zpay/screens/transaction_details_page.dart';
import '../models/transaction.dart';
import '../repository/transactions_repository.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final TransactionsRepository _repository = TransactionsRepository();
  List<Transaction> _transactions = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    setState(() => _isLoading = true);
    try {
      _transactions = await _repository.getTransactions();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  final tx = _transactions[index];
                  return ListTile(
                    title: Text(tx.description),
                    subtitle: Text('₹${tx.amount.toStringAsFixed(2)}'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TransactionDetailPage(transaction: tx)));
                    },
                  );
                },
              ),
    );
  }
}
