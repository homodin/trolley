/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../endpoints/movements.dart' as _i2;
import '../../endpoints/operator_control.dart' as _i3;
import '../../endpoints/part_numbers.dart' as _i4;
import '../../endpoints/stillage_content.dart' as _i5;
import '../../endpoints/stillage_master.dart' as _i6;
import '../../endpoints/warehouses.dart' as _i7;
import 'package:trolley_server/src/generated/models/transfer_log.dart' as _i8;
import 'package:trolley_server/src/generated/models/operators.dart' as _i9;
import 'package:trolley_server/src/generated/models/part_numbers.dart' as _i10;
import 'package:trolley_server/src/generated/models/stillage_contents.dart'
    as _i11;
import 'package:trolley_server/src/generated/models/stillage_master.dart'
    as _i12;
import 'package:trolley_server/src/generated/models/warehouses.dart' as _i13;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'movements': _i2.MovementsEndpoint()
        ..initialize(
          server,
          'movements',
          null,
        ),
      'operatorControl': _i3.OperatorControlEndpoint()
        ..initialize(
          server,
          'operatorControl',
          null,
        ),
      'partNumbers': _i4.PartNumbers()
        ..initialize(
          server,
          'partNumbers',
          null,
        ),
      'stillageContent': _i5.StillageContentEndpoint()
        ..initialize(
          server,
          'stillageContent',
          null,
        ),
      'stillageMaster': _i6.StillageMasterEndpoint()
        ..initialize(
          server,
          'stillageMaster',
          null,
        ),
      'warehouses': _i7.WarehousesEndpoint()
        ..initialize(
          server,
          'warehouses',
          null,
        ),
    };
    connectors['movements'] = _i1.EndpointConnector(
      name: 'movements',
      endpoint: endpoints['movements']!,
      methodConnectors: {
        'getStillagePosition': _i1.MethodConnector(
          name: 'getStillagePosition',
          params: {
            'stillage': _i1.ParameterDescription(
              name: 'stillage',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movements'] as _i2.MovementsEndpoint)
                  .getStillagePosition(
            session,
            params['stillage'],
          ),
        ),
        'acceptStillage': _i1.MethodConnector(
          name: 'acceptStillage',
          params: {
            'transfer': _i1.ParameterDescription(
              name: 'transfer',
              type: _i1.getType<_i8.TransferLog>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movements'] as _i2.MovementsEndpoint).acceptStillage(
            session,
            params['transfer'],
          ),
        ),
        'listStillageStatus': _i1.MethodConnector(
          name: 'listStillageStatus',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movements'] as _i2.MovementsEndpoint)
                  .listStillageStatus(session),
        ),
      },
    );
    connectors['operatorControl'] = _i1.EndpointConnector(
      name: 'operatorControl',
      endpoint: endpoints['operatorControl']!,
      methodConnectors: {
        'createOperator': _i1.MethodConnector(
          name: 'createOperator',
          params: {
            'operator': _i1.ParameterDescription(
              name: 'operator',
              type: _i1.getType<_i9.Operators>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatorControl'] as _i3.OperatorControlEndpoint)
                  .createOperator(
            session,
            params['operator'],
          ),
        ),
        'getOperator': _i1.MethodConnector(
          name: 'getOperator',
          params: {
            'clockNumber': _i1.ParameterDescription(
              name: 'clockNumber',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatorControl'] as _i3.OperatorControlEndpoint)
                  .getOperator(
            session,
            params['clockNumber'],
          ),
        ),
        'updateOperator': _i1.MethodConnector(
          name: 'updateOperator',
          params: {
            'operator': _i1.ParameterDescription(
              name: 'operator',
              type: _i1.getType<_i9.Operators>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatorControl'] as _i3.OperatorControlEndpoint)
                  .updateOperator(
            session,
            params['operator'],
          ),
        ),
        'deleteOperator': _i1.MethodConnector(
          name: 'deleteOperator',
          params: {
            'clockNumber': _i1.ParameterDescription(
              name: 'clockNumber',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatorControl'] as _i3.OperatorControlEndpoint)
                  .deleteOperator(
            session,
            params['clockNumber'],
          ),
        ),
        'listOperators': _i1.MethodConnector(
          name: 'listOperators',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatorControl'] as _i3.OperatorControlEndpoint)
                  .listOperators(session),
        ),
      },
    );
    connectors['partNumbers'] = _i1.EndpointConnector(
      name: 'partNumbers',
      endpoint: endpoints['partNumbers']!,
      methodConnectors: {
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['partNumbers'] as _i4.PartNumbers).getAll(session),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['partNumbers'] as _i4.PartNumbers).getById(
            session,
            params['id'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'partNumber': _i1.ParameterDescription(
              name: 'partNumber',
              type: _i1.getType<_i10.PartNumber>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['partNumbers'] as _i4.PartNumbers).create(
            session,
            params['partNumber'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'partNumber': _i1.ParameterDescription(
              name: 'partNumber',
              type: _i1.getType<_i10.PartNumber>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['partNumbers'] as _i4.PartNumbers).update(
            session,
            params['partNumber'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'part': _i1.ParameterDescription(
              name: 'part',
              type: _i1.getType<_i10.PartNumber>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['partNumbers'] as _i4.PartNumbers).delete(
            session,
            params['part'],
          ),
        ),
      },
    );
    connectors['stillageContent'] = _i1.EndpointConnector(
      name: 'stillageContent',
      endpoint: endpoints['stillageContent']!,
      methodConnectors: {
        'loadParts': _i1.MethodConnector(
          name: 'loadParts',
          params: {
            'stlNumber': _i1.ParameterDescription(
              name: 'stlNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<List<_i11.Contents>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stillageContent'] as _i5.StillageContentEndpoint)
                  .loadParts(
            session,
            params['stlNumber'],
            params['content'],
          ),
        )
      },
    );
    connectors['stillageMaster'] = _i1.EndpointConnector(
      name: 'stillageMaster',
      endpoint: endpoints['stillageMaster']!,
      methodConnectors: {
        'RegisterNewStillage': _i1.MethodConnector(
          name: 'RegisterNewStillage',
          params: {
            'stillage': _i1.ParameterDescription(
              name: 'stillage',
              type: _i1.getType<_i12.StillageMaster>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stillageMaster'] as _i6.StillageMasterEndpoint)
                  .RegisterNewStillage(
            session,
            params['stillage'],
          ),
        ),
        'deleteStillage': _i1.MethodConnector(
          name: 'deleteStillage',
          params: {
            'stillage': _i1.ParameterDescription(
              name: 'stillage',
              type: _i1.getType<_i12.StillageMaster>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stillageMaster'] as _i6.StillageMasterEndpoint)
                  .deleteStillage(
            session,
            params['stillage'],
          ),
        ),
        'listStillages': _i1.MethodConnector(
          name: 'listStillages',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stillageMaster'] as _i6.StillageMasterEndpoint)
                  .listStillages(session),
        ),
      },
    );
    connectors['warehouses'] = _i1.EndpointConnector(
      name: 'warehouses',
      endpoint: endpoints['warehouses']!,
      methodConnectors: {
        'createWarehouse': _i1.MethodConnector(
          name: 'createWarehouse',
          params: {
            'warehouse': _i1.ParameterDescription(
              name: 'warehouse',
              type: _i1.getType<_i13.Warehouses>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['warehouses'] as _i7.WarehousesEndpoint)
                  .createWarehouse(
            session,
            params['warehouse'],
          ),
        ),
        'getWarehouses': _i1.MethodConnector(
          name: 'getWarehouses',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['warehouses'] as _i7.WarehousesEndpoint)
                  .getWarehouses(session),
        ),
        'getWarehouseById': _i1.MethodConnector(
          name: 'getWarehouseById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['warehouses'] as _i7.WarehousesEndpoint)
                  .getWarehouseById(
            session,
            params['id'],
          ),
        ),
        'updateWarehouse': _i1.MethodConnector(
          name: 'updateWarehouse',
          params: {
            'warehouse': _i1.ParameterDescription(
              name: 'warehouse',
              type: _i1.getType<_i13.Warehouses>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['warehouses'] as _i7.WarehousesEndpoint)
                  .updateWarehouse(
            session,
            params['warehouse'],
          ),
        ),
        'deleteWarehouse': _i1.MethodConnector(
          name: 'deleteWarehouse',
          params: {
            'warehouse': _i1.ParameterDescription(
              name: 'warehouse',
              type: _i1.getType<_i13.Warehouses>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['warehouses'] as _i7.WarehousesEndpoint)
                  .deleteWarehouse(
            session,
            params['warehouse'],
          ),
        ),
      },
    );
  }
}
