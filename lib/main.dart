import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zpay/core/services/injection_container.dart';
import 'package:zpay/core/services/router.dart';
import 'package:zpay/src/common/presentation/bloc/connectivity_bloc.dart';
import 'package:zpay/src/transactions/presentation/bloc/transactions_bloc.dart';
import 'src/transactions/presentation/view/transactions_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const ZephyrPayApp());
}

class ZephyrPayApp extends StatelessWidget {
  const ZephyrPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<TransactionsBloc>(),
          ),
          BlocProvider(create: (context) => sl<ConnectivityBloc>()),
        ],
        child: MaterialApp.router(
          title: 'ZephyrPay',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(
              color: Colors.white
            )

          ),
          scaffoldBackgroundColor: Colors.black
          ),

          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
