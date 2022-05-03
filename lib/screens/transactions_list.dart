import 'package:bytebank/webAPI/webClients/transaction_webClient.dart';
import 'package:bytebank/widgets/Centered_message.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/progress.dart';

class TransactionsList extends StatelessWidget {
  final loadingMessage = 'Loading Transactions';
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
          future: Future.delayed(Duration(seconds: 1))
              .then((value) => _webClient.getAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress(message: loadingMessage);
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Transaction> transactions =
                      snapshot.data as List<Transaction>;
                  if (transactions.isNotEmpty) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final Transaction transaction = transactions[index];
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: Text(
                              transaction.value.toString(),
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              transaction.contact.accountNumber.toString(),
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: transactions.length,
                    );
                  }
                  return CenteredMessage(
                    'No Transactions Found',
                    icon: Icons.search,
                  );
                }
                return CenteredMessage(
                  'Connection Lost',
                  icon: Icons.cable_rounded,
                );
            }
            return CenteredMessage('Unknow error');
          }),
    );
  }
}
