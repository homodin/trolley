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
import '../models/content_type.dart' as _i2;

abstract class Contents
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Contents._({
    this.id,
    required this.contentId,
    required this.partNumber,
    required this.quantity,
    required this.employeeName,
    required this.transactionDatetime,
    required this.contentType,
    required this.reason,
  });

  factory Contents({
    int? id,
    required String contentId,
    required String partNumber,
    required int quantity,
    required String employeeName,
    required DateTime transactionDatetime,
    required _i2.ContentType contentType,
    required String reason,
  }) = _ContentsImpl;

  factory Contents.fromJson(Map<String, dynamic> jsonSerialization) {
    return Contents(
      id: jsonSerialization['id'] as int?,
      contentId: jsonSerialization['contentId'] as String,
      partNumber: jsonSerialization['partNumber'] as String,
      quantity: jsonSerialization['quantity'] as int,
      employeeName: jsonSerialization['employeeName'] as String,
      transactionDatetime: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['transactionDatetime']),
      contentType: _i2.ContentType.fromJson(
          (jsonSerialization['contentType'] as String)),
      reason: jsonSerialization['reason'] as String,
    );
  }

  static final t = ContentsTable();

  static const db = ContentsRepository._();

  @override
  int? id;

  String contentId;

  String partNumber;

  int quantity;

  String employeeName;

  DateTime transactionDatetime;

  _i2.ContentType contentType;

  String reason;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Contents]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Contents copyWith({
    int? id,
    String? contentId,
    String? partNumber,
    int? quantity,
    String? employeeName,
    DateTime? transactionDatetime,
    _i2.ContentType? contentType,
    String? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'contentId': contentId,
      'partNumber': partNumber,
      'quantity': quantity,
      'employeeName': employeeName,
      'transactionDatetime': transactionDatetime.toJson(),
      'contentType': contentType.toJson(),
      'reason': reason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'contentId': contentId,
      'partNumber': partNumber,
      'quantity': quantity,
      'employeeName': employeeName,
      'transactionDatetime': transactionDatetime.toJson(),
      'contentType': contentType.toJson(),
      'reason': reason,
    };
  }

  static ContentsInclude include() {
    return ContentsInclude._();
  }

  static ContentsIncludeList includeList({
    _i1.WhereExpressionBuilder<ContentsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ContentsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContentsTable>? orderByList,
    ContentsInclude? include,
  }) {
    return ContentsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Contents.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Contents.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ContentsImpl extends Contents {
  _ContentsImpl({
    int? id,
    required String contentId,
    required String partNumber,
    required int quantity,
    required String employeeName,
    required DateTime transactionDatetime,
    required _i2.ContentType contentType,
    required String reason,
  }) : super._(
          id: id,
          contentId: contentId,
          partNumber: partNumber,
          quantity: quantity,
          employeeName: employeeName,
          transactionDatetime: transactionDatetime,
          contentType: contentType,
          reason: reason,
        );

  /// Returns a shallow copy of this [Contents]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Contents copyWith({
    Object? id = _Undefined,
    String? contentId,
    String? partNumber,
    int? quantity,
    String? employeeName,
    DateTime? transactionDatetime,
    _i2.ContentType? contentType,
    String? reason,
  }) {
    return Contents(
      id: id is int? ? id : this.id,
      contentId: contentId ?? this.contentId,
      partNumber: partNumber ?? this.partNumber,
      quantity: quantity ?? this.quantity,
      employeeName: employeeName ?? this.employeeName,
      transactionDatetime: transactionDatetime ?? this.transactionDatetime,
      contentType: contentType ?? this.contentType,
      reason: reason ?? this.reason,
    );
  }
}

class ContentsTable extends _i1.Table<int?> {
  ContentsTable({super.tableRelation}) : super(tableName: 'contents') {
    contentId = _i1.ColumnString(
      'contentId',
      this,
    );
    partNumber = _i1.ColumnString(
      'partNumber',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
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
    contentType = _i1.ColumnEnum(
      'contentType',
      this,
      _i1.EnumSerialization.byName,
    );
    reason = _i1.ColumnString(
      'reason',
      this,
    );
  }

  late final _i1.ColumnString contentId;

  late final _i1.ColumnString partNumber;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnString employeeName;

  late final _i1.ColumnDateTime transactionDatetime;

  late final _i1.ColumnEnum<_i2.ContentType> contentType;

  late final _i1.ColumnString reason;

  @override
  List<_i1.Column> get columns => [
        id,
        contentId,
        partNumber,
        quantity,
        employeeName,
        transactionDatetime,
        contentType,
        reason,
      ];
}

class ContentsInclude extends _i1.IncludeObject {
  ContentsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Contents.t;
}

class ContentsIncludeList extends _i1.IncludeList {
  ContentsIncludeList._({
    _i1.WhereExpressionBuilder<ContentsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Contents.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Contents.t;
}

class ContentsRepository {
  const ContentsRepository._();

  /// Returns a list of [Contents]s matching the given query parameters.
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
  Future<List<Contents>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContentsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ContentsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContentsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Contents>(
      where: where?.call(Contents.t),
      orderBy: orderBy?.call(Contents.t),
      orderByList: orderByList?.call(Contents.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Contents] matching the given query parameters.
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
  Future<Contents?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContentsTable>? where,
    int? offset,
    _i1.OrderByBuilder<ContentsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContentsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Contents>(
      where: where?.call(Contents.t),
      orderBy: orderBy?.call(Contents.t),
      orderByList: orderByList?.call(Contents.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Contents] by its [id] or null if no such row exists.
  Future<Contents?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Contents>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Contents]s in the list and returns the inserted rows.
  ///
  /// The returned [Contents]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Contents>> insert(
    _i1.Session session,
    List<Contents> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Contents>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Contents] and returns the inserted row.
  ///
  /// The returned [Contents] will have its `id` field set.
  Future<Contents> insertRow(
    _i1.Session session,
    Contents row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Contents>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Contents]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Contents>> update(
    _i1.Session session,
    List<Contents> rows, {
    _i1.ColumnSelections<ContentsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Contents>(
      rows,
      columns: columns?.call(Contents.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Contents]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Contents> updateRow(
    _i1.Session session,
    Contents row, {
    _i1.ColumnSelections<ContentsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Contents>(
      row,
      columns: columns?.call(Contents.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Contents]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Contents>> delete(
    _i1.Session session,
    List<Contents> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Contents>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Contents].
  Future<Contents> deleteRow(
    _i1.Session session,
    Contents row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Contents>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Contents>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ContentsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Contents>(
      where: where(Contents.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContentsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Contents>(
      where: where?.call(Contents.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
