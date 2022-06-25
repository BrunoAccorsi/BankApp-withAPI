import 'package:bytebank/components/localization/i18N_container.dart';
import 'package:bytebank/components/localization/i18nmessages.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/name_model.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard/dashboard_i18n.dart';
import 'package:bytebank/screens/deposit_form.dart';
import 'package:bytebank/screens/name.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:bytebank/utils/helper_widget.dart';
import 'package:bytebank/widgets/balance_card.dart';
import 'package:bytebank/widgets/credit_card_widget.dart';
import 'package:bytebank/widgets/elevated_buttom_icon.dart';
import 'package:bytebank/widgets/incomeExpenses.dart';
import 'package:bytebank/widgets/list_item.dart';
import 'package:bytebank/widgets/main_container.dart';
import 'package:bytebank/widgets/transactionsListBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/bxs.dart';
import 'package:iconify_flutter/icons/el.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/fa6_solid.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:provider/provider.dart';

import '../../widgets/menuButtom.dart';

class CreditCard extends StatelessWidget {
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
              Text(
                'My cards',
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
                    onPressed: () {}),
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
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Total Spent',
                                        style: _textTheme.headline2,
                                      ),
                                    ),
                                    Text(
                                      '\$ 5.000',
                                      style: _textTheme.headline3,
                                    ),
                                  ],
                                ),
                              ),
                              addVerticalSpace(18),
                              CreditCardWidget(),
                            ],
                          ),
                          addVerticalSpace(88),
                        ],
                      ),
                    ),
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
                      height: (MediaQuery.of(context).size.height / 2) - 35
                      ,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Card Number',
                                    style: _textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '0000 0000 0000 0000',
                                    style: _textTheme.bodyText1,
                                  ),
                                  Text(
                                    'Copy',
                                    style: _textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: theme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: ElevatedButtomIcon(
                                color: MaterialStateProperty.all<Color>(
                                  theme.primary,
                                ),
                                icon: Ic.baseline_lock,
                                text: 'Block Card',
                                onClick: () {},
                                width: 260,
                                height: 40,
                              ),
                            )
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
                                  child: Text('Last Transactions',
                                      style: _textTheme.headline2?.copyWith(
                                        color: theme.onPrimary,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 16.0, right: 16.00),
                                  child: Iconify(
                                    Eva.search_fill,
                                    color: theme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                height: 200,
                                child: Column(children: [
                                  ListItem(content: {
                                    'title': 'Amazon Marketplace',
                                    'subtitle': '21:00PM',
                                    'value': '1000'
                                  }, icon: Ic.round_store),
                                  ListItem(content: {
                                    'title': 'Steam',
                                    'subtitle': '18:35PM',
                                    'value': '60'
                                  }, icon: Ion.game_controller),
                                  ListItem(content: {
                                    'title': 'McDonalds',
                                    'subtitle': '13:30PM',
                                    'value': '10'
                                  }, icon: Ic.round_store),
                                  ListItem(content: {
                                    'title': 'Walmart',
                                    'subtitle': '18:00PM',
                                    'value': '300'
                                  }, icon: Ic.round_store),
                                ]),
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
