import 'package:bytebank/components/localization/i18nmessages.dart';

class DashBoardLazyViewI18N {
  final I18NMessages _messages;
  DashBoardLazyViewI18N(this._messages);

  String get deposit => _messages.get('deposit');

  String get newTransaction => _messages.get('newTransaction');

  String get LastTransactions => _messages.get('lastTransactions');
}
