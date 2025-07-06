import 'package:flutter_command/flutter_command.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/repositories/warehouse_repo.dart';

class WarehouseModel {
  late final WarehouseRepo _warehouseRepo;
  late Command<Warehouses, bool> deleteWarehouse;
  late Command<void, bool> loadWareshouses;
  late Command<void, List<Warehouses?>> getWarehouses;
  late Command<Warehouses, Warehouses?> createWarehouse;

  List<Warehouses?> _warehouses = [];
  get listWareHouses => _warehouses;

  WarehouseModel({required WarehouseRepo warehouseRepo})
      : _warehouseRepo = warehouseRepo {
    deleteWarehouse =
        Command.createAsync(_deleteWarehouse, initialValue: false);
    getWarehouses = Command.createAsync(_getWarehouses, initialValue: []);
    createWarehouse = Command.createAsync(_createWarehouse, initialValue: null);
  }

  Future<bool> _deleteWarehouse(Warehouses warehouse) async {
    return await _warehouseRepo.deleteWarehouse(warehouse);
  }

  Future<List<Warehouses?>> _getWarehouses(void _) async {
    _warehouses = await _warehouseRepo.getWarehouses(null);
    return _warehouses;
  }

  Future<Warehouses?> _createWarehouse(Warehouses warehouse) async {
    return await _warehouseRepo.createWarehouse(warehouse);
  }
}
