import 'package:serverpod/serverpod.dart';
import 'package:trolley_server/src/generated/protocol.dart';

class WarehousesEndpoint extends Endpoint {
  // Create a new warehouse
  Future<Warehouses?> createWarehouse(
      Session session, Warehouses warehouse) async {
    // Check if warehouse with same id or unique field exists
    var existing = await Warehouses.db.findFirstRow(
      session,
      where: (t) => t.warehouse.equals(warehouse.warehouse),
    );
    if (existing != null) {
      throw Exception('Warehouse with this name already exists.');
    }
    return await Warehouses.db.insertRow(session, warehouse);
  }

  // Read all warehouses
  Future<List<Warehouses>> getWarehouses(Session session) async {
    return await Warehouses.db.find(session);
  }

  // Read a single warehouse by id
  Future<Warehouses?> getWarehouseById(Session session, int id) async {
    return await Warehouses.db.findById(session, id);
  }

  // Update a warehouse
  Future<Warehouses?> updateWarehouse(
      Session session, Warehouses warehouse) async {
    // Check if warehouse exists
    var existing = await Warehouses.db.findFirstRow(
      session,
      where: (p0) => p0.warehouse.equals(warehouse.warehouse),
    );
    if (existing == null) {
      throw Exception('Warehouse does not exist.');
    }
    //check for unique fields
    var duplicate = await Warehouses.db.findFirstRow(
      session,
      where: (t) =>
          t.warehouse.equals(warehouse.warehouse) &
          t.id.notEquals(warehouse.id!),
    );
    if (duplicate != null) {
      throw Exception('Another warehouse with this name already exists.');
    }
    await Warehouses.db.updateRow(session, warehouse);
    return warehouse;
  }

  // Delete a warehouse
  Future<bool> deleteWarehouse(Session session, Warehouses warehouse) async {
    var existing = await Warehouses.db.findFirstRow(
      session,
      where: (p0) => p0.warehouse.equals(warehouse.warehouse),
    );
    if (existing == null) {
      throw Exception('Warehouse does not exist.');
    }
    await Warehouses.db.deleteWhere(session,
        where: (t) => t.warehouse.equals(warehouse.warehouse));
    return true;
  }
}
