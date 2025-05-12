import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zpay/core/network/connection_service.dart';
import 'package:zpay/core/services/injection_container.dart';
import 'package:zpay/src/common/presentation/bloc/connectivity_bloc.dart';
import 'package:zpay/src/transactions/domain/entities/transaction.dart';
import 'package:zpay/src/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:zpay/src/transactions/presentation/view/no_internet_page.dart';
import 'package:zpay/src/transactions/presentation/view/transaction_details_page.dart';
import 'package:zpay/src/transactions/presentation/widgets/transaction_tile.dart';
import '../../data/repositories/transactions_repository_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  late final StreamSubscription _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    _connectivitySubscription = sl<ConnectivityService>().connectivityStream
        .listen((isConnected) {
          context.read<ConnectivityBloc>().add(
            ConnectivityChanged(isConnected),
          );
        });
  }

  @override
  void didUpdateWidget(covariant TransactionsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('📦 MyWidget was updated');
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    sl<ConnectivityService>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions',
      style: TextStyle(
        color: Colors.white
      ),

      ),
      
      centerTitle: true,
      ),
      body: BlocListener<ConnectivityBloc, ConnectivityState>(
        listener: (context, state) {
          if (state is Disconnected) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('You are offline')));
          } else {
            // ScaffoldMessenger.of(
            //   context,
            // ).showSnackBar(const SnackBar(content: Text('Back online')));

            context.read<TransactionsBloc>().add(
           FetchTransactionsEvent()
          );
          }
        },
        child: BlocBuilder<TransactionsBloc, TransactionsState>(
         
          builder: (context, state) {
            if (state is TransactionsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransactionsSuccessState) {
              return RefreshIndicator(
                onRefresh:
                    () async {
                      context.read<TransactionsBloc>().add(
                      FetchTransactionsEvent(),
                    );},
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.transactions.length,
                  cacheExtent: 1000,
                  itemBuilder: (context, index) {
                    return TransactionTile(tx: state.transactions[index]);
                  },
                ),
              );
            } else if (state is TransactionsErrorState) {
              return Text(state.message);
            } else if (state is NoInternetState) {
              return NoInternetPage();
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
