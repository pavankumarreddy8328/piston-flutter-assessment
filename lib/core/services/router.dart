import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zpay/src/transactions/presentation/view/transactions_page.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey = 
     GlobalKey<NavigatorState>(debugLabel: 'root');
class AppRouter{
 //Singleton class
  AppRouter._();

  static final AppRouter _instance = AppRouter._();

  static GoRouter get router => _instance._router;

  final _router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        name: '/',
        path: '/',
        builder: (context, state) => const TransactionsPage()
      )
    ]
  );
}