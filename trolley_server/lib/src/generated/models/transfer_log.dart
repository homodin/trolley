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
import '../models/transaction_types.dart' as _i2;

abstract class TransferLog
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = TransferLogTable();

  static const db = TransferLogRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static TransferLogInclude include() {
    return TransferLogInclude._();
  }

  static TransferLogIncludeList includeList({
    _i1.WhereExpressionBuilder<TransferLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TransferLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TransferLogTable>? orderByList,
    TransferLogInclude? include,
  }) {
    return TransferLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TransferLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TransferLog.t),
      include: include,
    );
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

class TransferLogTable extends _i1.Table<int?> {
  TransferLogTable({super.tableRelation}) : super(tableName: 'transfer_log') {
    stillageNumber = _i1.ColumnString(
      'stillageNumber',
      this,
    );
    sourceWarehouse = _i1.ColumnString(
      'sourceWarehouse',
      this,
    );
    targetWarehouse = _i1.ColumnString(
      'targetWarehouse',
      this,
    );
    transactionType = _i1.ColumnEnum(
      'transactionType',
      this,
      _i1.EnumSerialization.byName,
    );
    contentId = _i1.ColumnString(
      'contentId',
      this,
    );
    employeeName = _i1.ColumnString(
      'employeeName',
      this,
    );
    transactionDatetime = _i1.ColumnDateTime(
      'transactionDatetime',
      this,
    );
    overrideAuth = _i1.ColumnString(
      'overrideAuth',
      this,
    );
    overrided = _i1.ColumnString(
      'overrided',
      this,
    );
    overrideCode = _i1.ColumnString(
      'overrideCode',
      this,
    );
    hookInGoodCondition = _i1.ColumnString(
      'hookInGoodCondition',
      this,
    );
    floorMeshInGoodCondition = _i1.ColumnString(
      'floorMeshInGoodCondition',
      this,
    );
    stillageIsInGeneralGoodCondition = _i1.ColumnString(
      'stillageIsInGeneralGoodCondition',
      this,
    );
    remainingCycles = _i1.ColumnInt(
      'remainingCycles',
      this,
    );
  }

  late final _i1.ColumnString stillageNumber;

  late final _i1.ColumnString sourceWarehouse;

  late final _i1.ColumnString targetWarehouse;

  late final _i1.ColumnEnum<_i2.TransactionType> transactionType;

  late final _i1.ColumnString contentId;

  late final _i1.ColumnString employeeName;

  late final _i1.ColumnDateTime transactionDatetime;

  late final _i1.ColumnString overrideAuth;

  late final _i1.ColumnString overrided;

  late final _i1.ColumnString overrideCode;

  late final _i1.ColumnString hookInGoodCondition;

  late final _i1.ColumnString floorMeshInGoodCondition;

  late final _i1.ColumnString stillageIsInGeneralGoodCondition;

  late final _i1.ColumnInt remainingCycles;

  @override
  List<_i1.Column> get columns => [
        id,
        stillageNumber,
        sourceWarehouse,
        targetWarehouse,
        transactionType,
        contentId,
        employeeName,
        transactionDatetime,
        overrideAuth,
        overrided,
        overrideCode,
        hookInGoodCondition,
        floorMeshInGoodCondition,
        stillageIsInGeneralGoodCondition,
        remainingCycles,
      ];
}

class TransferLogInclude extends _i1.IncludeObject {
  TransferLogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TransferLog.t;
}

class TransferLogIncludeList extends _i1.IncludeList {
  TransferLogIncludeList._({
    _i1.WhereExpressionBuilder<TransferLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TransferLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TransferLog.t;
}

class TransferLogRepository {
  const TransferLogRepository._();

  /// Returns a list of [TransferLog]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<TransferLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TransferLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TransferLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TransferLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TransferLog>(
      where: where?.call(TransferLog.t),
      orderBy: orderBy?.call(TransferLog.t),
      orderByList: orderByList?.call(TransferLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TransferLog] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<TransferLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TransferLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<TransferLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TransferLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TransferLog>(
      where: where?.call(TransferLog.t),
      orderBy: orderBy?.call(TransferLog.t),
      orderByList: orderByList?.call(TransferLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TransferLog] by its [id] or null if no such row exists.
  Future<TransferLog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TransferLog>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TransferLog]s in the list and returns the inserted rows.
  ///
  /// The returned [TransferLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TransferLog>> insert(
    _i1.Session session,
    List<TransferLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TransferLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TransferLog] and returns the inserted row.
  ///
  /// The returned [TransferLog] will have its `id` field set.
  Future<TransferLog> insertRow(
    _i1.Session session,
    TransferLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TransferLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TransferLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TransferLog>> update(
    _i1.Session session,
    List<TransferLog> rows, {
    _i1.ColumnSelections<TransferLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TransferLog>(
      rows,
      columns: columns?.call(TransferLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TransferLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TransferLog> updateRow(
    _i1.Session session,
    TransferLog row, {
    _i1.ColumnSelections<TransferLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TransferLog>(
      row,
      columns: columns?.call(TransferLog.t),
      transaction: transaction,
    );
  }

  /// Deletes all [TransferLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TransferLog>> delete(
    _i1.Session session,
    List<TransferLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TransferLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TransferLog].
  Future<TransferLog> deleteRow(
    _i1.Session session,
    TransferLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TransferLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TransferLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TransferLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TransferLog>(
      where: where(TransferLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TransferLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TransferLog>(
      where: where?.call(TransferLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
