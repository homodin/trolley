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
import 'package:serverpod/protocol.dart' as _i2;
import 'models/content_type.dart' as _i3;
import 'models/operator_type.dart' as _i4;
import 'models/operators.dart' as _i5;
import 'models/part_numbers.dart' as _i6;
import 'models/return_states.dart' as _i7;
import 'models/stillage_contents.dart' as _i8;
import 'models/stillage_master.dart' as _i9;
import 'models/transaction_types.dart' as _i10;
import 'models/transfer_log.dart' as _i11;
import 'models/warehouses.dart' as _i12;
import 'package:trolley_server/src/generated/models/transfer_log.dart' as _i13;
import 'package:trolley_server/src/generated/models/operators.dart' as _i14;
import 'package:trolley_server/src/generated/models/part_numbers.dart' as _i15;
import 'package:trolley_server/src/generated/models/stillage_contents.dart'
    as _i16;
import 'package:trolley_server/src/generated/models/stillage_master.dart'
    as _i17;
import 'package:trolley_server/src/generated/models/warehouses.dart' as _i18;
export 'models/content_type.dart';
export 'models/operator_type.dart';
export 'models/operators.dart';
export 'models/part_numbers.dart';
export 'models/return_states.dart';
export 'models/stillage_contents.dart';
export 'models/stillage_master.dart';
export 'models/transaction_types.dart';
export 'models/transfer_log.dart';
export 'models/warehouses.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'contents',
      dartName: 'Contents',
      schema: 'public',
      module: 'trolley',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'contents_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'contentId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'partNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'quantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'employeeName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'transactionDatetime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'contentType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ContentType',
        ),
        _i2.ColumnDefinition(
          name: 'reason',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'contents_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'operator',
      dartName: 'Operators',
      schema: 'public',
      module: 'trolley',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'operator_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'opType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:OperatorType',
        ),
        _i2.ColumnDefinition(
          name: 'clockNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'operator_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'part_number',
      dartName: 'PartNumber',
      schema: 'public',
      module: 'trolley',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'part_number_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'partNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'commonDescription',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'pathToPic',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'part_number_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'stillage_master',
      dartName: 'StillageMaster',
      schema: 'public',
      module: 'trolley',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'stillage_master_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'stillageNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'stillage_master_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'transfer_log',
      dartName: 'TransferLog',
      schema: 'public',
      module: 'trolley',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'transfer_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'stillageNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'sourceWarehouse',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'targetWarehouse',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'transactionType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TransactionType',
        ),
        _i2.ColumnDefinition(
          name: 'contentId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'employeeName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'transactionDatetime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'overrideAuth',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'overrided',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'overrideCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'hookInGoodCondition',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'floorMeshInGoodCondition',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'stillageIsInGeneralGoodCondition',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'remainingCycles',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'transfer_log_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'warehouses',
      dartName: 'Warehouses',
      schema: 'public',
      module: 'trolley',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'warehouses_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'warehouse',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'defaultNext',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'warehouses_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.ContentType) {
      return _i3.ContentType.fromJson(data) as T;
    }
    if (t == _i4.OperatorType) {
      return _i4.OperatorType.fromJson(data) as T;
    }
    if (t == _i5.Operators) {
      return _i5.Operators.fromJson(data) as T;
    }
    if (t == _i6.PartNumber) {
      return _i6.PartNumber.fromJson(data) as T;
    }
    if (t == _i7.ReturnStates) {
      return _i7.ReturnStates.fromJson(data) as T;
    }
    if (t == _i8.Contents) {
      return _i8.Contents.fromJson(data) as T;
    }
    if (t == _i9.StillageMaster) {
      return _i9.StillageMaster.fromJson(data) as T;
    }
    if (t == _i10.TransactionType) {
      return _i10.TransactionType.fromJson(data) as T;
    }
    if (t == _i11.TransferLog) {
      return _i11.TransferLog.fromJson(data) as T;
    }
    if (t == _i12.Warehouses) {
      return _i12.Warehouses.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.ContentType?>()) {
      return (data != null ? _i3.ContentType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.OperatorType?>()) {
      return (data != null ? _i4.OperatorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Operators?>()) {
      return (data != null ? _i5.Operators.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.PartNumber?>()) {
      return (data != null ? _i6.PartNumber.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ReturnStates?>()) {
      return (data != null ? _i7.ReturnStates.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Contents?>()) {
      return (data != null ? _i8.Contents.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.StillageMaster?>()) {
      return (data != null ? _i9.StillageMaster.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TransactionType?>()) {
      return (data != null ? _i10.TransactionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TransferLog?>()) {
      return (data != null ? _i11.TransferLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Warehouses?>()) {
      return (data != null ? _i12.Warehouses.fromJson(data) : null) as T;
    }
    if (t == List<_i13.TransferLog?>) {
      return (data as List)
          .map((e) => deserialize<_i13.TransferLog?>(e))
          .toList() as T;
    }
    if (t == List<_i14.Operators>) {
      return (data as List).map((e) => deserialize<_i14.Operators>(e)).toList()
          as T;
    }
    if (t == List<_i15.PartNumber>) {
      return (data as List).map((e) => deserialize<_i15.PartNumber>(e)).toList()
          as T;
    }
    if (t == List<_i16.Contents?>) {
      return (data as List).map((e) => deserialize<_i16.Contents?>(e)).toList()
          as T;
    }
    if (t == List<_i16.Contents>) {
      return (data as List).map((e) => deserialize<_i16.Contents>(e)).toList()
          as T;
    }
    if (t == List<_i17.StillageMaster?>) {
      return (data as List)
          .map((e) => deserialize<_i17.StillageMaster?>(e))
          .toList() as T;
    }
    if (t == List<_i18.Warehouses>) {
      return (data as List).map((e) => deserialize<_i18.Warehouses>(e)).toList()
          as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i3.ContentType) {
      return 'ContentType';
    }
    if (data is _i4.OperatorType) {
      return 'OperatorType';
    }
    if (data is _i5.Operators) {
      return 'Operators';
    }
    if (data is _i6.PartNumber) {
      return 'PartNumber';
    }
    if (data is _i7.ReturnStates) {
      return 'ReturnStates';
    }
    if (data is _i8.Contents) {
      return 'Contents';
    }
    if (data is _i9.StillageMaster) {
      return 'StillageMaster';
    }
    if (data is _i10.TransactionType) {
      return 'TransactionType';
    }
    if (data is _i11.TransferLog) {
      return 'TransferLog';
    }
    if (data is _i12.Warehouses) {
      return 'Warehouses';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ContentType') {
      return deserialize<_i3.ContentType>(data['data']);
    }
    if (dataClassName == 'OperatorType') {
      return deserialize<_i4.OperatorType>(data['data']);
    }
    if (dataClassName == 'Operators') {
      return deserialize<_i5.Operators>(data['data']);
    }
    if (dataClassName == 'PartNumber') {
      return deserialize<_i6.PartNumber>(data['data']);
    }
    if (dataClassName == 'ReturnStates') {
      return deserialize<_i7.ReturnStates>(data['data']);
    }
    if (dataClassName == 'Contents') {
      return deserialize<_i8.Contents>(data['data']);
    }
    if (dataClassName == 'StillageMaster') {
      return deserialize<_i9.StillageMaster>(data['data']);
    }
    if (dataClassName == 'TransactionType') {
      return deserialize<_i10.TransactionType>(data['data']);
    }
    if (dataClassName == 'TransferLog') {
      return deserialize<_i11.TransferLog>(data['data']);
    }
    if (dataClassName == 'Warehouses') {
      return deserialize<_i12.Warehouses>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Operators:
        return _i5.Operators.t;
      case _i6.PartNumber:
        return _i6.PartNumber.t;
      case _i8.Contents:
        return _i8.Contents.t;
      case _i9.StillageMaster:
        return _i9.StillageMaster.t;
      case _i11.TransferLog:
        return _i11.TransferLog.t;
      case _i12.Warehouses:
        return _i12.Warehouses.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'trolley';
}
