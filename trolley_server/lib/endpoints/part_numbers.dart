import 'package:serverpod/serverpod.dart';
import 'package:trolley_server/src/generated/protocol.dart';

class PartNumbers extends Endpoint {
  Future<bool> _partNumberExists(Session session, String partNumber) async {
    final existing = await PartNumber.db.find(
      session,
      where: (t) => t.partNumber.equals(partNumber),
      limit: 1,
    );
    return existing.isNotEmpty;
  }

  Future<List<PartNumber>> getAll(Session session) async {
    return await PartNumber.db.find(
      session,
      where: (p0) => p0.id.notEquals(-1),
    );
  }

  Future<PartNumber?> getById(Session session, int id) async {
    return await PartNumber.db.findById(session, id);
  }

  Future<PartNumber> create(Session session, PartNumber partNumber) async {
    if (await _partNumberExists(session, partNumber.partNumber)) {
      throw Exception('PartNumber with this partNumber already exists.');
    }
    return await PartNumber.db.insertRow(session, partNumber);
  }

  Future<PartNumber?> update(Session session, PartNumber partNumber) async {
    if (!await _partNumberExists(session, partNumber.partNumber)) {
      throw Exception('PartNumber does not exist.');
    }
    return await PartNumber.db.updateRow(session, partNumber);
  }

  Future<PartNumber> delete(Session session, PartNumber part) async {
    if (!await _partNumberExists(session, part.partNumber)) {
      throw Exception('PartNumber does not exist.');
    }
    await PartNumber.db.deleteRow(session, part);
    return part;
  }
}
