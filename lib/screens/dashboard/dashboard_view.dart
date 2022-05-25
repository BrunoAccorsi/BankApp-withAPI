import 'package:bytebank/components/localization/i18N_container.dart';
import 'package:bytebank/components/localization/i18nmessages.dart';
import 'package:bytebank/models/name_model.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard/dashboard_i18n.dart';
import 'package:bytebank/screens/deposit_form.dart';
import 'package:bytebank/screens/name.dart';
import 'package:bytebank/widgets/balance_card.dart';
import 'package:bytebank/widgets/transactionsListBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardView extends StatelessWidget {
  final DashBoardLazyViewI18N _i18n;

  const DashBoardView(this._i18n);

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[900],
                ),
              ),
              BlocBuilder<NameCubit, String>(
                builder: (context, state) => Text(
                  '$state',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              color: theme.primary,
              icon: Icon(
                Icons.person,
                size: 32.0,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<NameCubit>(context),
                    child: NameContainer(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  const BalanceCard(),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text(_i18n.deposit),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DepositForm()));
                        },
                      ),
                      ElevatedButton(
                        child: Text(_i18n.newTransaction),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ContactsListContainer()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  _i18n.LastTransactions,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: TransactionsListBuilder(
                      itemCount: 2,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
