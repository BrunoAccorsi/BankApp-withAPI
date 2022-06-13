import 'package:bytebank/components/constants_theme.dart';
import 'package:bytebank/components/localization/locale.dart';
import 'package:bytebank/components/localization/i18n_view.dart';
import 'package:bytebank/components/theme.dart';
import 'package:bytebank/components/theme_manager.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/transactions.dart';
import 'package:bytebank/screens/dashboard/dashboard_container.dart';
import 'package:bytebank/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Balance(0),
          ),
          ChangeNotifierProvider(
            create: (context) => Transactions(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeManager(),
          )
        ],
        child: const Bytebank(),
      ));
    },
    blocObserver: LogObserver(),
  );
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} > $change');
    super.onChange(bloc, change);
  }
}

class Bytebank extends StatelessWidget {
  const Bytebank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeManager>(context, listen: true).themeMode,
      home: LocalizationContainer(
        child: DashboardContainer(),
      ),
    );
  }
}
