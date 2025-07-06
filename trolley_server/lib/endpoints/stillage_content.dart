import 'package:serverpod/serverpod.dart';
import 'package:trolley_server/src/generated/models/stillage_contents.dart';
import 'package:trolley_server/src/generated/protocol.dart';

class StillageContentEndpoint extends Endpoint {
  String _createLoadID(String stlNumber) {
    final dt = DateTime.now();
    return '${dt.year}-${dt.month}-${dt.day}-${dt.hour}-${dt.minute}-${dt.second}-${stlNumber}';
  }

  Future<List<Contents?>> loadParts(
      Session session, String stlNumber, List<Contents> content) async {
    //create unique ID for stillage content to be loaded
    final listToCommit = content
        .map((val) => val.copyWith(contentId: _createLoadID(stlNumber)))
        .toList();
    //get last stillage position
    final lastTransaction = (await TransferLog.db.find(session,
            where: (p0) => p0.stillageNumber.equals(stlNumber),
            orderBy: (p0) => p0.transactionDatetime,
            orderDescending: true,
            limit: 1))
        .first;
    //create entry in transaction log with content ID
    await TransferLog.db.insertRow(
        session,
        lastTransaction.copyWith(
            id: null,
            sourceWarehouse: lastTransaction.targetWarehouse,
            targetWarehouse: '',
            contentId: listToCommit.first.contentId,
            transactionType: TransactionType.Loading));
    return await Contents.db.insert(session, content);
  }
  //TODO: Implement part Rejection
  //TODO: Implement part Unloading
}
