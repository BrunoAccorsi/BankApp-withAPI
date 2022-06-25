import 'package:bytebank/components/localization/i18N_container.dart';
import 'package:bytebank/components/localization/i18nmessages.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/name_model.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/credit_card.dart';
import 'package:bytebank/screens/dashboard/dashboard_i18n.dart';
import 'package:bytebank/screens/deposit_form.dart';
import 'package:bytebank/screens/name.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:bytebank/utils/helper_widget.dart';
import 'package:bytebank/widgets/balance_card.dart';
import 'package:bytebank/widgets/incomeExpenses.dart';
import 'package:bytebank/widgets/main_container.dart';
import 'package:bytebank/widgets/transactionsListBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/el.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/fa6_solid.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:provider/provider.dart';

import '../../widgets/menuButtom.dart';

class DashBoardView extends StatelessWidget {
  final DashBoardLazyViewI18N _i18n;

  const DashBoardView(this._i18n);

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    TextTheme _textTheme = Theme.of(context).textTheme;
    final _hideBalance = Provider.of<Balance>(context, listen: true);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Welcome, ', style: _textTheme.headline2),
              BlocBuilder<NameCubit, String>(
                builder: (context, state) =>
                    Text('$state', style: _textTheme.headline1),
              ),
            ],
          ),
          actions: [
            IconButton(
                icon: Iconify(
                  _hideBalance.hide ? El.eye_open : El.eye_close,
                  size: 24.0,
                  color: theme.onPrimary,
                ),
                onPressed: () {
                  Provider.of<Balance>(context, listen: false).toggleHide();
                }),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Iconify(
                    Bi.person_fill,
                    color: theme.primary,
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
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Image(
                    image: AssetImage('assets/background_dashboard.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BalanceCard(),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TransactionsList()));
                                },
                                child: Text(
                                  'See More',
                                  style: _textTheme.button,
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(88),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Wrap(
                          spacing: 8,
                          children: <Widget>[
                            MenuButton(
                              icon: Healthicons.coins,
                              text: _i18n.deposit,
                              onClick: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DepositForm()));
                              },
                            ),
                            MenuButton(
                              icon: Fa6Solid.money_bill_transfer,
                              text: _i18n.newTransaction,
                              onClick: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ContactsListContainer()));
                              },
                            ),
                            MenuButton(
                              icon: HeroiconsSolid.credit_card,
                              text: 'My cards',
                              onClick: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreditCard()));
                              },
                            ),
                            MenuButton(
                              icon: Fluent.send_28_filled,
                              text: 'Payment',
                              onClick: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    addVerticalSpace(16),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24)),
                        color: theme.onSecondaryContainer,
                      ),
                      width: double.infinity,
                      height: (MediaQuery.of(context).size.height / 2) - 35,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'This Month',
                                style: _textTheme.headline2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IncomeExpenses(
                                    type: 'Income', value: '\$ 5.000'),
                                addHorizontalSpace(24),
                                IncomeExpenses(
                                    type: 'Expanse', value: '\$ 5.000'),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
                Positioned(
                  top: 112,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      MainContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 16.00),
                                  child: Text(_i18n.LastTransactions,
                                      style: _textTheme.headline2?.copyWith(
                                        color: theme.onPrimaryContainer,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 16.0, right: 16.00),
                                  child: Iconify(
                                    Eva.search_fill,
                                    color: theme.outline,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                height: 200,
                                child: TransactionsListBuilder(
                                  itemCount: 4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
