// ignore_for_file: file_names

import 'dart:convert';

import 'package:bytebank/webAPI/webClient.dart';
import 'package:http/http.dart';

const MESSAGES_URI =
    'https://gist.githubusercontent.com/BrunoAccorsi/3af64e243997941c939687238927f8a5/raw/93fd4492474801d040a8b08a9b3d2e095de25e44/';

class I18NWebClient {
  final String _viewKey;

  I18NWebClient(this._viewKey);

  Future<Map<String, dynamic>> getAll() async {
    final Response response =
        await client.get(Uri.parse("$MESSAGES_URI$_viewKey.json"));
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}
