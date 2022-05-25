// ignore_for_file: camel_case_types

import 'package:bytebank/components/localization/eager_localization.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard/dashboard_container.dart';
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
    final i18n = HomeViewI18N(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        selectedIndex: _selectedPage,
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: i18n.home,
          ),
          NavigationDestination(
            icon: Icon(Icons.monetization_on),
            label: i18n.transfer,
          ),
          NavigationDestination(
            icon: Icon(Icons.description),
            label: i18n.transacionFeed,
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

class HomeViewI18N extends ViewI18N {
  HomeViewI18N(BuildContext context) : super(context);

  String get home => localize({'en': 'Home', 'pt-br': 'Início'});

  String get transfer => localize({'en': 'Transfer', 'pt-br': 'Trasnferir'});

  String get transacionFeed =>
      localize({'en': 'Transaction Feed', 'pt-br': 'Transferências'});
}
