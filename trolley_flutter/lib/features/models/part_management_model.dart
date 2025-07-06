import 'package:flutter_command/flutter_command.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/repositories/operators_repo.dart';
import 'package:trolley_flutter/repositories/parts_repo.dart';

class PartManagementModel {
  late final OperatorsRepo _operatorsRepo;
  late final PartsRepo _partsRepo;
  late Command<PartNumber, PartNumber?> createPart;
  late Command<void, List<PartNumber?>> getPartList;
  late Command<PartNumber, PartNumber?> deletePart;
  late Operators _authenticatedUser;
  PartManagementModel(Operators user,
      {required OperatorsRepo operatorsRepo, required PartsRepo partsRepo})
      : _authenticatedUser = user,
        _operatorsRepo = operatorsRepo,
        _partsRepo = partsRepo {
    createPart = Command.createAsync(_createPart, initialValue: null);
    getPartList = Command.createAsync(_getPartList, initialValue: []);
    deletePart = Command.createAsync(_deletePart, initialValue: null);
  }
  Future<PartNumber?> _createPart(PartNumber part) async {
    if ((await _authenticatedUser) == null) {
      return null;
    }

    return await _partsRepo.createPart(part);
  }

  Future<List<PartNumber?>> _getPartList(void _) async {
    if ((await _authenticatedUser) == null) {
      return [];
    }
    print('model1');
    return await _partsRepo.listParts();
  }

  Future<PartNumber?> _deletePart(PartNumber part) async {
    if ((await _authenticatedUser) == null) {
      return null;
    }
    return await _partsRepo.deletePart(part);
  }
}
