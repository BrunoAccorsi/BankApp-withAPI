// ignore_for_file: camel_case_types

import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 16, color: Colors.white60),
              ),
              const Text(
                'Bruno',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shape: CircleBorder(),
                primary: Colors.green[400],
                shadowColor: Colors.transparent,
              ),
              child: Icon(
                Icons.person,
                color: Colors.white60,
                size: 32.0,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                _FeatureItem(
                    name: 'Transfer',
                    icon: Icons.monetization_on,
                    onClick: () {
                      _showContactsList(context);
                    }),
                _FeatureItem(
                  name: 'Transaction\nFeed',
                  icon: Icons.description,
                  onClick: () => _showTransactionsList(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }
}

void _showContactsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ContactsList(),
    ),
  );
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    this.name = 'undefined',
    this.icon,
    required this.onClick,
  }) : assert(icon != null);

  final String name;
  final IconData? icon;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: CircleBorder(),
              padding: EdgeInsets.all(24),
              primary: Colors.lightGreen[300],
              shadowColor: Colors.transparent,
            ),
            child: Icon(
              icon,
              color: Colors.white60,
              size: 32.0,
            ),
            onPressed: () => onClick(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
