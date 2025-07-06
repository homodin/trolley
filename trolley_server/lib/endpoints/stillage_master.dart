import 'package:serverpod/serverpod.dart';
import 'package:trolley_server/endpoints/movements.dart';
import 'package:trolley_server/src/generated/models/return_states.dart';
import 'package:trolley_server/src/generated/protocol.dart';

class StillageMasterEndpoint extends Endpoint {
  Future<StillageMaster> RegisterNewStillage(
      Session session, StillageMaster stillage) async {
    if ((await StillageMaster.db.findFirstRow(
          session,
          where: (p0) => p0.stillageNumber.equals(stillage.stillageNumber),
        )) !=
        null) {
      return stillage;
    }
    return await StillageMaster.db
        .insertRow(session, stillage)
        .then((val) async {
      await TransferLog.db.insertRow(
          session,
          TransferLog(
              stillageNumber: val.stillageNumber,
              sourceWarehouse: 'none',
              targetWarehouse: 'origin',
              transactionType: TransactionType.Transfer,
              contentId: 'none',
              employeeName: 'none',
              transactionDatetime: DateTime.now(),
              overrideAuth: 'none',
              overrided: 'no',
              overrideCode: 'none',
              hookInGoodCondition: 'yes',
              floorMeshInGoodCondition: 'yes',
              stillageIsInGeneralGoodCondition: 'yes',
              remainingCycles: 3));
      return val;
    });
  }

  Future<StillageMaster?> deleteStillage(
      Session session, StillageMaster stillage) async {
    var stl = await StillageMaster.db.findFirstRow(
      session,
      where: (p0) => p0.stillageNumber.equals(stillage.stillageNumber),
    );
    if (stl != null) {
      return await StillageMaster.db.deleteRow(session, stl);
    }
    return stl;
  }

  Future<List<StillageMaster?>> listStillages(Session session) async {
    return await StillageMaster.db.find(session);
  }
}
