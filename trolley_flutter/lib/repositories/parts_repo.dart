import 'package:flutter/material.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/services/api_client.dart';

class PartsRepo {
  late final Client _api;
  List<PartNumber?> _partNumbers = [];
  get partList => _partNumbers;

  PartsRepo({required ApiClient apiClient}) : _api = apiClient.api;

  Future<void> refreshPartList() async {
    _partNumbers = await listParts();
  }

  Future<PartNumber?> createPart(PartNumber part) async {
    return await _api.partNumbers.create(part);
  }

  Future<PartNumber?> deletePart(PartNumber part) async {
    return await _api.partNumbers.delete(part);
  }

  Future<List<PartNumber?>> listParts() async {
    return await _api.partNumbers.getAll();
  }
}
