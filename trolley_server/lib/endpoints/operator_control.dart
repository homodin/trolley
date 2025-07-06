import 'package:serverpod/serverpod.dart';
import 'package:trolley_server/src/generated/protocol.dart';

class OperatorControlEndpoint extends Endpoint {
  // Create Operator
  Future<Operators?> createOperator(Session session, Operators operator) async {
    // Check if operator with the same clockNumber exists
    var existing = await Operators.db.findFirstRow(
      session,
      where: (t) => t.clockNumber.equals(operator.clockNumber),
    );
    if (existing != null) {
      throw Exception('Operator with this clockNumber already exists.');
    }
    return await Operators.db.insertRow(session, operator);
  }

  // Read Operator by clockNumber
  Future<Operators?> getOperator(Session session, String clockNumber) async {
    return await Operators.db.findFirstRow(
      session,
      where: (t) => t.clockNumber.equals(clockNumber),
    );
  }

  // Update Operator by clockNumber
  Future<Operators?> updateOperator(Session session, Operators operator) async {
    // Validate existence
    var existing = await Operators.db.findFirstRow(
      session,
      where: (t) => t.clockNumber.equals(operator.clockNumber),
    );
    if (existing == null) {
      throw Exception('Operator not found.');
    }
    operator.id = existing.id;
    await Operators.db.updateRow(session, operator);
    return operator;
  }

  // Delete Operator by clockNumber
  Future<bool> deleteOperator(Session session, String clockNumber) async {
    var existing = await Operators.db.findFirstRow(
      session,
      where: (t) => t.clockNumber.equals(clockNumber),
    );
    if (existing == null) {
      throw Exception('Operator not found.');
    }
    await Operators.db.deleteRow(session, existing);
    return true;
  }

  // List all Operators
  Future<List<Operators>> listOperators(Session session) async {
    return await Operators.db.find(session);
  }
}
