import 'package:bytebank/webAPI/webClients/transaction_webClient.dart';
import 'package:bytebank/widgets/Centered_message.dart';
import 'package:bytebank/widgets/main_container.dart';
import 'package:bytebank/widgets/transactionsListBuilder.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/progress.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: MainContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TransactionsListBuilder(),
        ),
      ),
    );
  }
}
