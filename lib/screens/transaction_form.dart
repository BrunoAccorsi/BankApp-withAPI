import 'dart:async';

import 'package:bytebank/models/balance.dart';
import 'package:bytebank/webAPI/webClients/transaction_webClient.dart';
import 'package:bytebank/widgets/Auth_dialog.dart';
import 'package:bytebank/widgets/progress.dart';
import 'package:bytebank/widgets/response_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/contact.dart';
import '../models/transaction.dart';

abstract class TransactionFormState {
  const TransactionFormState();
}

@immutable
class SentState extends TransactionFormState {
  const SentState();
}

@immutable
class SendingState extends TransactionFormState {
  const SendingState();
}

class ShowFormState extends TransactionFormState {
  const ShowFormState();
}

@immutable
class FatalErrorTransactionFormState extends TransactionFormState {
  final String message;
  const FatalErrorTransactionFormState(this.message);
}

class TransactionFormCubit extends Cubit<TransactionFormState> {
  TransactionFormCubit() : super(ShowFormState());

  void save(Transaction transactionCreated, String password,
      BuildContext context) async {
    await _send(transactionCreated, password, context);
    emit(SentState());
  }

  Future<void> _send(Transaction transactionCreated, String password,
      BuildContext context) async {
    emit(SendingState());
    await TransactionWebClient()
        .save(
      transactionCreated,
      password,
    )
        .catchError(
      (e) {
        emit(FatalErrorTransactionFormState('Timeout was reached'));
      },
      test: (e) => e is TimeoutException,
    ).catchError(
      (e) {
        emit(FatalErrorTransactionFormState(e.message));
      },
      test: (e) => e is Exception,
    );
  }
}

class TransactionFormContainer extends StatelessWidget {
  final Contact _contact;
  TransactionFormContainer(this._contact);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) {
          return TransactionFormCubit();
        },
        child: BlocListener<TransactionFormCubit, TransactionFormState>(
          listener: (context, state) {
            if (state is FatalErrorTransactionFormState) {
              _showFailureMessage(context, message: state.message);
            }
            if (state is SentState) {
              Navigator.pop(context);
            }
          },
          child: TransactionFormView(_contact),
        ));
  }

  void _showFailureMessage(BuildContext context,
      {String message = 'Unknow Error'}) {
    showDialog(
        context: context,
        builder: (contextDialog) {
          return FailureDialog(message);
        });
  }
}

class TransactionFormView extends StatelessWidget {
  final Contact contact;

  TransactionFormView(this.contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionFormCubit, TransactionFormState>(
        builder: (context, state) {
      if (state is ShowFormState) {
        return _TrasactionForm(contact);
      }
      if (state is SendingState) {
        return ProgressView();
      }
      if (state is SentState) {
        return ProgressView();
      }
      if (state is FatalErrorTransactionFormState) {
        return _TrasactionForm(contact);
      }
      return Text('UnknownError');
    });
  }

  void saveTransaction(Transaction transactionCreated, String password,
      BuildContext context) async {}

  Future<void> _showSucessfulMessage(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return const SuccessDialog('Transaction sent');
        });
    Navigator.pop(context);
  }
}

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New transaction'),
      ),
      body: const Progress(
        message: 'Sending...',
      ),
    );
  }
}

class _TrasactionForm extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();
  final String transactionId = const Uuid().v4();
  final Contact contact;
  _TrasactionForm(this.contact);

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
              Text(
                contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  contact.accountNumber.toString(),
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
                        if (!_validateTransaction(context, value)) {
                          BlocProvider.of<TransactionFormCubit>(context).emit(
                              FatalErrorTransactionFormState(
                                  'Your balance is not sufficient for this transaction'));
                        } else {
                          showDialog(
                              context: context,
                              builder: (contextDialog) {
                                return AuthDialog(onConfirm: (String password) {
                                  final transactionCreated = Transaction(
                                      transactionId, value, contact);
                                  BlocProvider.of<TransactionFormCubit>(context)
                                      .save(transactionCreated, password,
                                          context);
                                });
                              });
                        }
                      } else {
                        BlocProvider.of<TransactionFormCubit>(context).emit(
                            FatalErrorTransactionFormState(
                                'Transaction value canot be null'));
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

  bool _validateTransaction(BuildContext context, double value) {
    return value < Provider.of<Balance>(context, listen: false).value;
  }
}
