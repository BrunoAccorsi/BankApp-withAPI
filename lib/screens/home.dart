// ignore_for_file: camel_case_types

import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        selectedIndex: _selectedPage,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.monetization_on),
            label: 'Transfer',
          ),
          NavigationDestination(
            icon: Icon(Icons.description),
            label: 'Transaction\nFeed',
          ),
        ],
      ),
      body: <Widget>[
        DashboardContainer(),
        ContactsListContainer(),
        TransactionsList(),
      ][_selectedPage],
    );
  }
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
              shadowColor: Colors.transparent,
            ),
            child: Icon(
              icon,
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
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
