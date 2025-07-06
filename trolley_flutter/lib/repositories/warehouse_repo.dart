import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/services/api_client.dart';

class WarehouseRepo {
  late final Client _api;
  List<Warehouses?> _warehouses = [];
  Future<List<Warehouses?>> getWarehouses(void _) async {
    _warehouses = await _getWarehoese();
    return _warehouses;
  }

  List<Warehouses?> get warehouseList => _warehouses;

  Future<void> loadWarehouses() async {
    _warehouses = await _getWarehoese();
  }

  WarehouseRepo(ApiClient client) : _api = client.api;
  Future<List<Warehouses?>> _getWarehoese() async {
    return await _api.warehouses.getWarehouses();
  }

  Future<Warehouses?> createWarehouse(Warehouses warehouse) async {
    await _api.warehouses.createWarehouse(warehouse);
  }

  Future<bool> deleteWarehouse(Warehouses warehouse) async {
    try {
      await _api.warehouses.deleteWarehouse(warehouse);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}
