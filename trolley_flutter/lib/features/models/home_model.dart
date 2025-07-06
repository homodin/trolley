import 'package:flutter/material.dart';
import 'package:trolley_client/trolley_client.dart';

class HomeModel extends ChangeNotifier {
  final Client _api;
  HomeModel({required Client api}) : _api = api;
  String getHost() => _api.host;

  Future<Operators?> getOperator(String clockNumber) async {
    final op = await _api.operatorControl.getOperator(clockNumber);
    switch (op!.opType) {
      case (OperatorType.Engineer ||
            OperatorType.Maintenance ||
            OperatorType.Supervisor ||
            OperatorType.TeamLeader):
        return op;
        break;
      default:
        return null;
    }
  }
}
