import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/repositories/movements_repo.dart';
import 'package:trolley_flutter/repositories/operators_repo.dart';
import 'package:trolley_flutter/repositories/warehouse_repo.dart';

class MovementsModel extends ChangeNotifier {
  final MovementsRepo _movementsRepo;
  final WarehouseRepo _warehouseRepo;
  final OperatorsRepo _operatorsRepo;
  late Command<TransferLog, TransferLog?> acceptStillage;
  late Command<String, TransferLog?> getCurrentStillagePosition;
  late Command<void, List<TransferLog?>> listAllStillagePosition;
  late Command<String, Operators?> getOperators;
  late Command loadWarehouses;
  TransferLog? _currentTransfer;
  TransferLog? get currentTransfer => _currentTransfer;
  set currentTransfer(TransferLog? log) {
    _currentTransfer = log;
    notifyListeners();
  }

  List<TransferLog?> latestLogs = [];

  MovementsModel(
      {required MovementsRepo movementsRepo,
      required WarehouseRepo warehouseRepo,
      required OperatorsRepo operatorRepo})
      : _movementsRepo = movementsRepo,
        _warehouseRepo = warehouseRepo,
        _operatorsRepo = operatorRepo {
    acceptStillage =
        Command.createAsync(_acceptStillageInToWarehouse, initialValue: null);
    getCurrentStillagePosition =
        Command.createAsync(setCurrentTransferLog, initialValue: null);
    listAllStillagePosition =
        Command.createAsync(_listAllStillagePosition, initialValue: []);
    loadWarehouses = Command.createAsync(_loadWarehouses, initialValue: null);
    getOperators = Command.createAsync(_getOperator, initialValue: null);
  }

  Future<Operators?> _getOperator(String code) async {
    return await _operatorsRepo.getOperator(code);
  }

  Future<TransferLog?> setCurrentTransferLog(String stillage) async {
    currentTransfer = await _getCurrentStillagePosition(stillage);
    return currentTransfer;
  }

  Future<void> _loadWarehouses(void _) async {
    await _warehouseRepo.loadWarehouses();
  }

  String? getNextWarehouse(String? warehouse) {
    if (warehouse == null) {
      return null;
    }
    return _warehouseRepo.warehouseList
        .firstWhere((val) => val!.warehouse == warehouse)
        ?.defaultNext;
  }

  Future<TransferLog?> _acceptStillageInToWarehouse(
      TransferLog transfer) async {
    return await _movementsRepo.acceptStillage(transfer);
  }

  Future<TransferLog?> _getCurrentStillagePosition(String stillage) async {
    _currentTransfer = await _movementsRepo.getCurrtentState(stillage);
    return _currentTransfer;
  }

  Future<List<TransferLog?>> _listAllStillagePosition(void _) async =>
      await _movementsRepo.listAllStillagePosition();
}
