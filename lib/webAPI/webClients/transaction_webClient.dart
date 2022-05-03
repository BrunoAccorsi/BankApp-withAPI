import 'dart:convert';

import 'package:bytebank/webAPI/webClient.dart';
import 'package:http/http.dart';

import '../../models/transaction.dart';

class TransactionWebClient {
  Future<List<Transaction>> getAll() async {
    final Response response =
        await client.get(Uri.parse(url)).timeout(Duration(seconds: 2));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionJson = transaction.toJson();

    final Response response = await client.post(Uri.parse(url),
        headers: {'Content-type': 'application/json', 'password': '1000'},
        body: jsonEncode(transactionJson));

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
