import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/repositories/operators_repo.dart';

class OperatorManagementModel extends ChangeNotifier {
  late final OperatorsRepo _operatorsRepo;
  late Command<Operators, Operators?> createOperator;
  late Command<void, void> refreshOpList;
  List<Operators?> staticList = [];

  OperatorManagementModel({required OperatorsRepo operatorsRepo})
      : _operatorsRepo = operatorsRepo {
    createOperator = Command.createAsync(_createOperator, initialValue: null);
    refreshOpList = Command.createAsync(_getOperatorList, initialValue: null);
  }

  Future<Operators?> _createOperator(Operators operator) async {
    return await _operatorsRepo.createOperator(operator);
  }

  Future<void> _getOperatorList(void _) async {
    await _operatorsRepo.refreshList();
    staticList = await _operatorsRepo.listOperators();
    notifyListeners();
  }
}
