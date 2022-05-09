// ignore_for_file: file_names

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 5),
);

const url = 'http://192.168.0.109:8080/transactions';
