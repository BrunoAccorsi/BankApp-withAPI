import 'dart:async';

import 'package:bytebank/webAPI/webClients/transaction_webClient.dart';
import 'package:bytebank/widgets/Auth_dialog.dart';
import 'package:bytebank/widgets/progress.dart';
import 'package:bytebank/widgets/response_dialog.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/contact.dart';
import '../models/transaction.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  const TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();
  final String transactionId = Uuid().v4();

  bool _sending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Progress(),
                ),
                visible: _sending,
              ),
              Text(
                widget.contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: const TextStyle(fontSize: 24.0),
                  decoration: const InputDecoration(labelText: 'Value'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Transfer'),
                    onPressed: () {
                      final double? value =
                          double.tryParse(_valueController.text);
                      if (value != null) {
                        showDialog(
                            context: context,
                            builder: (contextDialog) {
                              return AuthDialog(onConfirm: (String password) {
                                final transactionCreated = Transaction(
                                    transactionId, value, widget.contact);
                                saveTransaction(
                                    transactionCreated, password, context);
                              });
                            });
                      } else {
                        _showFailureMessage(context,
                            message: 'Transaction value canot be null');
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveTransaction(Transaction transactionCreated, String password,
      BuildContext context) async {
    setState(() {
      _sending = true;
    });
    await _send(transactionCreated, password, context);

    await _showSucessfulMessage(context);
  }

  Future<void> _send(Transaction transactionCreated, String password,
      BuildContext context) async {
    await _webClient
        .save(
      transactionCreated,
      password,
    )
        .catchError(
      (e) {
        _showFailureMessage(context, message: 'Timeout was reached');
      },
      test: (e) => e is TimeoutException,
    ).catchError(
      (e) {
        _showFailureMessage(context, message: e.message);
      },
      test: (e) => e is Exception,
    ).whenComplete(
      () => setState(() {
        _sending = false;
      }),
    );
  }

  Future<void> _showSucessfulMessage(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return SuccessDialog('Transaction sent');
        });
    Navigator.pop(context);
  }

  void _showFailureMessage(BuildContext context,
      {String message = 'Unknow Error'}) {
    setState(() {
      _sending = false;
    });
    showDialog(
        context: context,
        builder: (contextDialog) {
          return FailureDialog(message);
        });
  }
}
