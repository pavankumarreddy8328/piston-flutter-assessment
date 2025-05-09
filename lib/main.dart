import 'package:flutter/material.dart';
import 'screens/transactions_page.dart';

void main() {
  runApp(const ZephyrPayApp());
}

class ZephyrPayApp extends StatelessWidget {
  const ZephyrPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ZephyrPay', theme: ThemeData(primarySwatch: Colors.blue), home: const TransactionsPage());
  }
}
