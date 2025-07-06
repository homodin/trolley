import 'package:flutter/material.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/services/api_client.dart';

class OperatorsRepo {
  late final Client _api;

  List<Operators?> _operatorList = [];

  Future<void> refreshList() async {
    _operatorList = await listOperators();
  }

  OperatorsRepo({required ApiClient apiClient}) : _api = apiClient.api;

  Future<Operators?> getOperator(String clockNumber) async {
    return await _api.operatorControl.getOperator(clockNumber);
  }

  Future<List<Operators?>> listOperators() async =>
      await _api.operatorControl.listOperators();

  Future<Operators?> createOperator(Operators operator) async =>
      await _api.operatorControl.createOperator(operator);
  Future<Operators?> updateOperator(Operators operator) async =>
      await _api.operatorControl.updateOperator(operator);
}
