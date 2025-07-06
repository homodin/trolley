import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/services/api_client.dart';

class MovementsRepo {
  late final Client _api;
  MovementsRepo({required ApiClient apiCLient}) : _api = apiCLient.api {}

  Future<TransferLog?> acceptStillage(TransferLog? transfer) async {
    if (transfer == null) {
      return null;
    }
    return await _api.movements.acceptStillage(transfer!);
  }

  Future<TransferLog?> getCurrtentState(String stillage) async {
    if (stillage == null) {
      return null;
    }
    return await _api.movements.getStillagePosition(stillage);
  }

  Future<List<TransferLog?>> listAllStillagePosition() async {
    return await _api.movements.listStillageStatus();
  }
}
