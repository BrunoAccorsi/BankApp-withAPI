import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/interceptor.dart';

final Client client =
    InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const url = 'http://192.168.0.109:8080/transactions';
