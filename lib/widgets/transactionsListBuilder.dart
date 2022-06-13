import 'package:bytebank/utils/helper_widget.dart';
import 'package:bytebank/webAPI/webClients/transaction_webClient.dart';
import 'package:bytebank/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fa6_solid.dart';

import '../models/transaction.dart';
import 'Centered_message.dart';

class TransactionsListBuilder extends StatelessWidget {
  final loadingMessage = 'Loading Transactions';
  final TransactionWebClient _webClient = TransactionWebClient();
  final int? itemCount;

  TransactionsListBuilder({
    Key? key,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<Transaction>>(
              future: Future.delayed(const Duration(seconds: 1))
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
                        int? quantity = transactions.length;
                        if (itemCount != null &&
                            itemCount! < transactions.length) {
                          quantity = itemCount;
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final Transaction transaction = transactions[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: const Iconify(
                                          Fa6Solid.money_bill_transfer,
                                        ),
                                      )),
                                  addHorizontalSpace(11),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Transfer Sent',
                                        style: _textTheme.bodyText1?.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Account Number: ${transaction.contact.accountNumber.toString()}',
                                        style: _textTheme.bodyText1
                                            ?.copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        'may 24',
                                        style: _textTheme.bodyText1?.copyWith(
                                            color: theme.primary,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '\$ ${transaction.value.toString()}',
                                        style: _textTheme.bodyText1?.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                            // return Card(
                            //   child: ListTile(
                            //     leading: const Icon(Icons.monetization_on),
                            //     title: Text(
                            //       '\$ ${transaction.value.toString()}',
                            //       style: const TextStyle(
                            //         fontSize: 24.0,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //     subtitle: Text(
                            //       'Account Number: ${transaction.contact.accountNumber.toString()}',
                            //       style: const TextStyle(
                            //         fontSize: 16.0,
                            //       ),
                            //     ),
                            //   ),
                            // );
                          },
                          itemCount: quantity,
                        );
                      }
                      return const CenteredMessage(
                        'No Transactions Found',
                        icon: Icons.search,
                      );
                    }
                    return const CenteredMessage(
                      'Connection Lost',
                      icon: Icons.cable_rounded,
                    );
                }
                return const CenteredMessage('Unknow error');
              }),
        ),
      ],
    );
  }
}
