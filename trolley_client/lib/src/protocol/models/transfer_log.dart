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
import '../models/transaction_types.dart' as _i2;

abstract class TransferLog implements _i1.SerializableModel {
  TransferLog._({
    this.id,
    required this.stillageNumber,
    required this.sourceWarehouse,
    required this.targetWarehouse,
    required this.transactionType,
    required this.contentId,
    required this.employeeName,
    required this.transactionDatetime,
    required this.overrideAuth,
    required this.overrided,
    required this.overrideCode,
    required this.hookInGoodCondition,
    required this.floorMeshInGoodCondition,
    required this.stillageIsInGeneralGoodCondition,
    required this.remainingCycles,
  });

  factory TransferLog({
    int? id,
    required String stillageNumber,
    required String sourceWarehouse,
    required String targetWarehouse,
    required _i2.TransactionType transactionType,
    required String contentId,
    required String employeeName,
    required DateTime transactionDatetime,
    required String overrideAuth,
    required String overrided,
    required String overrideCode,
    required String hookInGoodCondition,
    required String floorMeshInGoodCondition,
    required String stillageIsInGeneralGoodCondition,
    required int remainingCycles,
  }) = _TransferLogImpl;

  factory TransferLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return TransferLog(
      id: jsonSerialization['id'] as int?,
      stillageNumber: jsonSerialization['stillageNumber'] as String,
      sourceWarehouse: jsonSerialization['sourceWarehouse'] as String,
      targetWarehouse: jsonSerialization['targetWarehouse'] as String,
      transactionType: _i2.TransactionType.fromJson(
          (jsonSerialization['transactionType'] as String)),
      contentId: jsonSerialization['contentId'] as String,
      employeeName: jsonSerialization['employeeName'] as String,
      transactionDatetime: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['transactionDatetime']),
      overrideAuth: jsonSerialization['overrideAuth'] as String,
      overrided: jsonSerialization['overrided'] as String,
      overrideCode: jsonSerialization['overrideCode'] as String,
      hookInGoodCondition: jsonSerialization['hookInGoodCondition'] as String,
      floorMeshInGoodCondition:
          jsonSerialization['floorMeshInGoodCondition'] as String,
      stillageIsInGeneralGoodCondition:
          jsonSerialization['stillageIsInGeneralGoodCondition'] as String,
      remainingCycles: jsonSerialization['remainingCycles'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String stillageNumber;

  String sourceWarehouse;

  String targetWarehouse;

  _i2.TransactionType transactionType;

  String contentId;

  String employeeName;

  DateTime transactionDatetime;

  String overrideAuth;

  String overrided;

  String overrideCode;

  String hookInGoodCondition;

  String floorMeshInGoodCondition;

  String stillageIsInGeneralGoodCondition;

  int remainingCycles;

  /// Returns a shallow copy of this [TransferLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TransferLog copyWith({
    int? id,
    String? stillageNumber,
    String? sourceWarehouse,
    String? targetWarehouse,
    _i2.TransactionType? transactionType,
    String? contentId,
    String? employeeName,
    DateTime? transactionDatetime,
    String? overrideAuth,
    String? overrided,
    String? overrideCode,
    String? hookInGoodCondition,
    String? floorMeshInGoodCondition,
    String? stillageIsInGeneralGoodCondition,
    int? remainingCycles,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'stillageNumber': stillageNumber,
      'sourceWarehouse': sourceWarehouse,
      'targetWarehouse': targetWarehouse,
      'transactionType': transactionType.toJson(),
      'contentId': contentId,
      'employeeName': employeeName,
      'transactionDatetime': transactionDatetime.toJson(),
      'overrideAuth': overrideAuth,
      'overrided': overrided,
      'overrideCode': overrideCode,
      'hookInGoodCondition': hookInGoodCondition,
      'floorMeshInGoodCondition': floorMeshInGoodCondition,
      'stillageIsInGeneralGoodCondition': stillageIsInGeneralGoodCondition,
      'remainingCycles': remainingCycles,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TransferLogImpl extends TransferLog {
  _TransferLogImpl({
    int? id,
    required String stillageNumber,
    required String sourceWarehouse,
    required String targetWarehouse,
    required _i2.TransactionType transactionType,
    required String contentId,
    required String employeeName,
    required DateTime transactionDatetime,
    required String overrideAuth,
    required String overrided,
    required String overrideCode,
    required String hookInGoodCondition,
    required String floorMeshInGoodCondition,
    required String stillageIsInGeneralGoodCondition,
    required int remainingCycles,
  }) : super._(
          id: id,
          stillageNumber: stillageNumber,
          sourceWarehouse: sourceWarehouse,
          targetWarehouse: targetWarehouse,
          transactionType: transactionType,
          contentId: contentId,
          employeeName: employeeName,
          transactionDatetime: transactionDatetime,
          overrideAuth: overrideAuth,
          overrided: overrided,
          overrideCode: overrideCode,
          hookInGoodCondition: hookInGoodCondition,
          floorMeshInGoodCondition: floorMeshInGoodCondition,
          stillageIsInGeneralGoodCondition: stillageIsInGeneralGoodCondition,
          remainingCycles: remainingCycles,
        );

  /// Returns a shallow copy of this [TransferLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TransferLog copyWith({
    Object? id = _Undefined,
    String? stillageNumber,
    String? sourceWarehouse,
    String? targetWarehouse,
    _i2.TransactionType? transactionType,
    String? contentId,
    String? employeeName,
    DateTime? transactionDatetime,
    String? overrideAuth,
    String? overrided,
    String? overrideCode,
    String? hookInGoodCondition,
    String? floorMeshInGoodCondition,
    String? stillageIsInGeneralGoodCondition,
    int? remainingCycles,
  }) {
    return TransferLog(
      id: id is int? ? id : this.id,
      stillageNumber: stillageNumber ?? this.stillageNumber,
      sourceWarehouse: sourceWarehouse ?? this.sourceWarehouse,
      targetWarehouse: targetWarehouse ?? this.targetWarehouse,
      transactionType: transactionType ?? this.transactionType,
      contentId: contentId ?? this.contentId,
      employeeName: employeeName ?? this.employeeName,
      transactionDatetime: transactionDatetime ?? this.transactionDatetime,
      overrideAuth: overrideAuth ?? this.overrideAuth,
      overrided: overrided ?? this.overrided,
      overrideCode: overrideCode ?? this.overrideCode,
      hookInGoodCondition: hookInGoodCondition ?? this.hookInGoodCondition,
      floorMeshInGoodCondition:
          floorMeshInGoodCondition ?? this.floorMeshInGoodCondition,
      stillageIsInGeneralGoodCondition: stillageIsInGeneralGoodCondition ??
          this.stillageIsInGeneralGoodCondition,
      remainingCycles: remainingCycles ?? this.remainingCycles,
    );
  }
}
