import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.green[200],
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your account balance',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<Balance>(builder: (context, value, child) {
                return Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
