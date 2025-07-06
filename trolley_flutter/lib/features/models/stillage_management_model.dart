import 'package:flutter_command/flutter_command.dart';
import 'package:trolley_client/trolley_client.dart';
import 'package:trolley_flutter/repositories/operators_repo.dart';
import 'package:trolley_flutter/repositories/stillage_repo.dart';

class StillageManagementModel {
  late final StillageRepo _stillageRepo;
  late final OperatorsRepo _operatorsRepo;
  late Command<StillageMaster, StillageMaster?> createStillage;
  late Command<StillageMaster, StillageMaster?> deleteStillage;
  late Command<void, List<StillageMaster?>> listStillages;
  Operators _authenticatedOperator;
  StillageManagementModel(Operators user,
      {required StillageRepo stillageRepo,
      required OperatorsRepo operatorsRepo})
      : _authenticatedOperator = user,
        _stillageRepo = stillageRepo,
        _operatorsRepo = operatorsRepo {
    createStillage = Command.createAsync(_createStillage, initialValue: null);
    deleteStillage = Command.createAsync(_deleteStillage, initialValue: null);
    listStillages = Command.createAsync(_listStillages, initialValue: []);
  }

  Future<StillageMaster?> _createStillage(StillageMaster stillage) async {
    if ((await _operatorsRepo
            .getOperator(_authenticatedOperator.clockNumber)) ==
        null) {
      return null;
    }
    return await _stillageRepo.addStillage(stillage);
  }

  Future<StillageMaster?> _deleteStillage(StillageMaster stillage) async {
    if ((await _operatorsRepo
            .getOperator(_authenticatedOperator.clockNumber)) ==
        null) {
      return null;
    }
    return await _stillageRepo.deleteStillage(stillage);
  }

  Future<List<StillageMaster?>> _listStillages(void _) async {
    _stillageRepo.refreshStillages();
    return await _stillageRepo.stillages;
  }
}
