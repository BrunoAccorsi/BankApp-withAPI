import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/deposit_form.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:bytebank/widgets/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bytebank')),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('Deposit to account'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DepositForm()));
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text('New Transaction'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TransactionForm(Contact('teste', 1000))));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
