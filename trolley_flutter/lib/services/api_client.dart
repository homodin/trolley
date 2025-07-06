import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:trolley_client/trolley_client.dart';

class ApiClient {
  late final _client;
  ApiClient() {
    final serverUrl = 'http://10.0.0.14:8080/';

    this._client = Client(serverUrl)
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }

  Client get api => _client;
}
