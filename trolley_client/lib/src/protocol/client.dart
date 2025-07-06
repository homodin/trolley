/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:trolley_client/src/protocol/models/transfer_log.dart' as _i3;
import 'package:trolley_client/src/protocol/models/operators.dart' as _i4;
import 'package:trolley_client/src/protocol/models/part_numbers.dart' as _i5;
import 'package:trolley_client/src/protocol/models/stillage_contents.dart'
    as _i6;
import 'package:trolley_client/src/protocol/models/stillage_master.dart' as _i7;
import 'package:trolley_client/src/protocol/models/warehouses.dart' as _i8;
import 'protocol.dart' as _i9;

/// {@category Endpoint}
class EndpointMovements extends _i1.EndpointRef {
  EndpointMovements(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'movements';

  _i2.Future<_i3.TransferLog?> getStillagePosition(String stillage) =>
      caller.callServerEndpoint<_i3.TransferLog?>(
        'movements',
        'getStillagePosition',
        {'stillage': stillage},
      );

  _i2.Future<_i3.TransferLog> acceptStillage(_i3.TransferLog transfer) =>
      caller.callServerEndpoint<_i3.TransferLog>(
        'movements',
        'acceptStillage',
        {'transfer': transfer},
      );

  _i2.Future<List<_i3.TransferLog?>> listStillageStatus() =>
      caller.callServerEndpoint<List<_i3.TransferLog?>>(
        'movements',
        'listStillageStatus',
        {},
      );
}

/// {@category Endpoint}
class EndpointOperatorControl extends _i1.EndpointRef {
  EndpointOperatorControl(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'operatorControl';

  _i2.Future<_i4.Operators?> createOperator(_i4.Operators operator) =>
      caller.callServerEndpoint<_i4.Operators?>(
        'operatorControl',
        'createOperator',
        {'operator': operator},
      );

  _i2.Future<_i4.Operators?> getOperator(String clockNumber) =>
      caller.callServerEndpoint<_i4.Operators?>(
        'operatorControl',
        'getOperator',
        {'clockNumber': clockNumber},
      );

  _i2.Future<_i4.Operators?> updateOperator(_i4.Operators operator) =>
      caller.callServerEndpoint<_i4.Operators?>(
        'operatorControl',
        'updateOperator',
        {'operator': operator},
      );

  _i2.Future<bool> deleteOperator(String clockNumber) =>
      caller.callServerEndpoint<bool>(
        'operatorControl',
        'deleteOperator',
        {'clockNumber': clockNumber},
      );

  _i2.Future<List<_i4.Operators>> listOperators() =>
      caller.callServerEndpoint<List<_i4.Operators>>(
        'operatorControl',
        'listOperators',
        {},
      );
}

/// {@category Endpoint}
class EndpointPartNumbers extends _i1.EndpointRef {
  EndpointPartNumbers(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'partNumbers';

  _i2.Future<List<_i5.PartNumber>> getAll() =>
      caller.callServerEndpoint<List<_i5.PartNumber>>(
        'partNumbers',
        'getAll',
        {},
      );

  _i2.Future<_i5.PartNumber?> getById(int id) =>
      caller.callServerEndpoint<_i5.PartNumber?>(
        'partNumbers',
        'getById',
        {'id': id},
      );

  _i2.Future<_i5.PartNumber> create(_i5.PartNumber partNumber) =>
      caller.callServerEndpoint<_i5.PartNumber>(
        'partNumbers',
        'create',
        {'partNumber': partNumber},
      );

  _i2.Future<_i5.PartNumber?> update(_i5.PartNumber partNumber) =>
      caller.callServerEndpoint<_i5.PartNumber?>(
        'partNumbers',
        'update',
        {'partNumber': partNumber},
      );

  _i2.Future<_i5.PartNumber> delete(_i5.PartNumber part) =>
      caller.callServerEndpoint<_i5.PartNumber>(
        'partNumbers',
        'delete',
        {'part': part},
      );
}

/// {@category Endpoint}
class EndpointStillageContent extends _i1.EndpointRef {
  EndpointStillageContent(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'stillageContent';

  _i2.Future<List<_i6.Contents?>> loadParts(
    String stlNumber,
    List<_i6.Contents> content,
  ) =>
      caller.callServerEndpoint<List<_i6.Contents?>>(
        'stillageContent',
        'loadParts',
        {
          'stlNumber': stlNumber,
          'content': content,
        },
      );
}

/// {@category Endpoint}
class EndpointStillageMaster extends _i1.EndpointRef {
  EndpointStillageMaster(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'stillageMaster';

  _i2.Future<_i7.StillageMaster> RegisterNewStillage(
          _i7.StillageMaster stillage) =>
      caller.callServerEndpoint<_i7.StillageMaster>(
        'stillageMaster',
        'RegisterNewStillage',
        {'stillage': stillage},
      );

  _i2.Future<_i7.StillageMaster?> deleteStillage(_i7.StillageMaster stillage) =>
      caller.callServerEndpoint<_i7.StillageMaster?>(
        'stillageMaster',
        'deleteStillage',
        {'stillage': stillage},
      );

  _i2.Future<List<_i7.StillageMaster?>> listStillages() =>
      caller.callServerEndpoint<List<_i7.StillageMaster?>>(
        'stillageMaster',
        'listStillages',
        {},
      );
}

/// {@category Endpoint}
class EndpointWarehouses extends _i1.EndpointRef {
  EndpointWarehouses(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'warehouses';

  _i2.Future<_i8.Warehouses?> createWarehouse(_i8.Warehouses warehouse) =>
      caller.callServerEndpoint<_i8.Warehouses?>(
        'warehouses',
        'createWarehouse',
        {'warehouse': warehouse},
      );

  _i2.Future<List<_i8.Warehouses>> getWarehouses() =>
      caller.callServerEndpoint<List<_i8.Warehouses>>(
        'warehouses',
        'getWarehouses',
        {},
      );

  _i2.Future<_i8.Warehouses?> getWarehouseById(int id) =>
      caller.callServerEndpoint<_i8.Warehouses?>(
        'warehouses',
        'getWarehouseById',
        {'id': id},
      );

  _i2.Future<_i8.Warehouses?> updateWarehouse(_i8.Warehouses warehouse) =>
      caller.callServerEndpoint<_i8.Warehouses?>(
        'warehouses',
        'updateWarehouse',
        {'warehouse': warehouse},
      );

  _i2.Future<bool> deleteWarehouse(_i8.Warehouses warehouse) =>
      caller.callServerEndpoint<bool>(
        'warehouses',
        'deleteWarehouse',
        {'warehouse': warehouse},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i9.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    movements = EndpointMovements(this);
    operatorControl = EndpointOperatorControl(this);
    partNumbers = EndpointPartNumbers(this);
    stillageContent = EndpointStillageContent(this);
    stillageMaster = EndpointStillageMaster(this);
    warehouses = EndpointWarehouses(this);
  }

  late final EndpointMovements movements;

  late final EndpointOperatorControl operatorControl;

  late final EndpointPartNumbers partNumbers;

  late final EndpointStillageContent stillageContent;

  late final EndpointStillageMaster stillageMaster;

  late final EndpointWarehouses warehouses;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'movements': movements,
        'operatorControl': operatorControl,
        'partNumbers': partNumbers,
        'stillageContent': stillageContent,
        'stillageMaster': stillageMaster,
        'warehouses': warehouses,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
