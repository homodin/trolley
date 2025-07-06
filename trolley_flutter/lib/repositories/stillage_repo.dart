import 'package:flutter/material.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/services/api_client.dart';

class StillageRepo {
  late final Client _api;
  List<StillageMaster?> stillages = [];

  StillageRepo({required ApiClient apiClient}) : _api = apiClient.api;

  Future<void> refreshStillages() async {
    stillages = await listStillages();
  }

  Future<StillageMaster?> addStillage(StillageMaster stillage) async {
    return await _api.stillageMaster.RegisterNewStillage(stillage);
  }

  Future<StillageMaster?> deleteStillage(StillageMaster stillage) async {
    return await _api.stillageMaster.deleteStillage(stillage);
  }

  Future<List<StillageMaster?>> listStillages() {
    return _api.stillageMaster.listStillages();
  }
}
