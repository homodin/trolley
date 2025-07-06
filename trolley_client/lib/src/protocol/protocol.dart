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
import 'models/content_type.dart' as _i2;
import 'models/operator_type.dart' as _i3;
import 'models/operators.dart' as _i4;
import 'models/part_numbers.dart' as _i5;
import 'models/return_states.dart' as _i6;
import 'models/stillage_contents.dart' as _i7;
import 'models/stillage_master.dart' as _i8;
import 'models/transaction_types.dart' as _i9;
import 'models/transfer_log.dart' as _i10;
import 'models/warehouses.dart' as _i11;
import 'package:trolley_client/src/protocol/models/transfer_log.dart' as _i12;
import 'package:trolley_client/src/protocol/models/operators.dart' as _i13;
import 'package:trolley_client/src/protocol/models/part_numbers.dart' as _i14;
import 'package:trolley_client/src/protocol/models/stillage_contents.dart'
    as _i15;
import 'package:trolley_client/src/protocol/models/stillage_master.dart'
    as _i16;
import 'package:trolley_client/src/protocol/models/warehouses.dart' as _i17;
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
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.ContentType) {
      return _i2.ContentType.fromJson(data) as T;
    }
    if (t == _i3.OperatorType) {
      return _i3.OperatorType.fromJson(data) as T;
    }
    if (t == _i4.Operators) {
      return _i4.Operators.fromJson(data) as T;
    }
    if (t == _i5.PartNumber) {
      return _i5.PartNumber.fromJson(data) as T;
    }
    if (t == _i6.ReturnStates) {
      return _i6.ReturnStates.fromJson(data) as T;
    }
    if (t == _i7.Contents) {
      return _i7.Contents.fromJson(data) as T;
    }
    if (t == _i8.StillageMaster) {
      return _i8.StillageMaster.fromJson(data) as T;
    }
    if (t == _i9.TransactionType) {
      return _i9.TransactionType.fromJson(data) as T;
    }
    if (t == _i10.TransferLog) {
      return _i10.TransferLog.fromJson(data) as T;
    }
    if (t == _i11.Warehouses) {
      return _i11.Warehouses.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ContentType?>()) {
      return (data != null ? _i2.ContentType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.OperatorType?>()) {
      return (data != null ? _i3.OperatorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Operators?>()) {
      return (data != null ? _i4.Operators.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.PartNumber?>()) {
      return (data != null ? _i5.PartNumber.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ReturnStates?>()) {
      return (data != null ? _i6.ReturnStates.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Contents?>()) {
      return (data != null ? _i7.Contents.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.StillageMaster?>()) {
      return (data != null ? _i8.StillageMaster.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TransactionType?>()) {
      return (data != null ? _i9.TransactionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TransferLog?>()) {
      return (data != null ? _i10.TransferLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Warehouses?>()) {
      return (data != null ? _i11.Warehouses.fromJson(data) : null) as T;
    }
    if (t == List<_i12.TransferLog?>) {
      return (data as List)
          .map((e) => deserialize<_i12.TransferLog?>(e))
          .toList() as T;
    }
    if (t == List<_i13.Operators>) {
      return (data as List).map((e) => deserialize<_i13.Operators>(e)).toList()
          as T;
    }
    if (t == List<_i14.PartNumber>) {
      return (data as List).map((e) => deserialize<_i14.PartNumber>(e)).toList()
          as T;
    }
    if (t == List<_i15.Contents?>) {
      return (data as List).map((e) => deserialize<_i15.Contents?>(e)).toList()
          as T;
    }
    if (t == List<_i15.Contents>) {
      return (data as List).map((e) => deserialize<_i15.Contents>(e)).toList()
          as T;
    }
    if (t == List<_i16.StillageMaster?>) {
      return (data as List)
          .map((e) => deserialize<_i16.StillageMaster?>(e))
          .toList() as T;
    }
    if (t == List<_i17.Warehouses>) {
      return (data as List).map((e) => deserialize<_i17.Warehouses>(e)).toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.ContentType) {
      return 'ContentType';
    }
    if (data is _i3.OperatorType) {
      return 'OperatorType';
    }
    if (data is _i4.Operators) {
      return 'Operators';
    }
    if (data is _i5.PartNumber) {
      return 'PartNumber';
    }
    if (data is _i6.ReturnStates) {
      return 'ReturnStates';
    }
    if (data is _i7.Contents) {
      return 'Contents';
    }
    if (data is _i8.StillageMaster) {
      return 'StillageMaster';
    }
    if (data is _i9.TransactionType) {
      return 'TransactionType';
    }
    if (data is _i10.TransferLog) {
      return 'TransferLog';
    }
    if (data is _i11.Warehouses) {
      return 'Warehouses';
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
      return deserialize<_i2.ContentType>(data['data']);
    }
    if (dataClassName == 'OperatorType') {
      return deserialize<_i3.OperatorType>(data['data']);
    }
    if (dataClassName == 'Operators') {
      return deserialize<_i4.Operators>(data['data']);
    }
    if (dataClassName == 'PartNumber') {
      return deserialize<_i5.PartNumber>(data['data']);
    }
    if (dataClassName == 'ReturnStates') {
      return deserialize<_i6.ReturnStates>(data['data']);
    }
    if (dataClassName == 'Contents') {
      return deserialize<_i7.Contents>(data['data']);
    }
    if (dataClassName == 'StillageMaster') {
      return deserialize<_i8.StillageMaster>(data['data']);
    }
    if (dataClassName == 'TransactionType') {
      return deserialize<_i9.TransactionType>(data['data']);
    }
    if (dataClassName == 'TransferLog') {
      return deserialize<_i10.TransferLog>(data['data']);
    }
    if (dataClassName == 'Warehouses') {
      return deserialize<_i11.Warehouses>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
