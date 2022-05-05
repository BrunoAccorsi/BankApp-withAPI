import 'dart:convert';

import 'package:bytebank/webAPI/webClient.dart';
import 'package:http/http.dart';

import '../../models/transaction.dart';

class TransactionWebClient {
  Future<List<Transaction>> getAll() async {
    final Response response = await client.get(Uri.parse(url));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    Map<String, dynamic> transactionJson = transaction.toJson();

    final Response response = await client.post(Uri.parse(url),
        headers: {'Content-type': 'application/json', 'password': password},
        body: jsonEncode(transactionJson));

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    throw _throwHttpError(response.statusCode);
  }

  Exception _throwHttpError(int statusCode) {
    if (_statusResponse.containsKey(statusCode)) {
      throw Exception(_statusResponse[statusCode]);
    } else {
      throw Exception('There was an error processing the request');
    }
  }

  static final Map<int, String> _statusResponse = {
    409: 'Transaction already sent',
    401: 'Authorization failed',
  };
}
