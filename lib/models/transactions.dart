import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

class Transactions extends ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void add(Transaction newTransaction) {
    transactions.add(newTransaction);
    notifyListeners();
  }
}
