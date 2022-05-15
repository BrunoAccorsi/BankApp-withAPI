import 'package:bytebank/components/theme.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/transactions.dart';
import 'package:bytebank/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Balance(0),
      ),
      ChangeNotifierProvider(
        create: (context) => Transactions(),
      )
    ],
    child: const Bytebank(),
  ));
}

class Bytebank extends StatelessWidget {
  const Bytebank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: byteBankTheme,
      home: const Home(),
    );
  }
}
