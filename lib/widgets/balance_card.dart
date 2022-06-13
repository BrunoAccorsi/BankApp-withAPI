import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Your account balance',
              style: _textTheme.headline2,
            ),
          ),
          Consumer<Balance>(builder: (context, value, child) {
            return Text(
              value.toString(),
              style: _textTheme.headline3,
            );
          }),
        ],
      ),
    );
  }
}
