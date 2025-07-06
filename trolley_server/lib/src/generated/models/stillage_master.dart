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

abstract class StillageMaster
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  StillageMaster._({
    this.id,
    required this.stillageNumber,
  });

  factory StillageMaster({
    int? id,
    required String stillageNumber,
  }) = _StillageMasterImpl;

  factory StillageMaster.fromJson(Map<String, dynamic> jsonSerialization) {
    return StillageMaster(
      id: jsonSerialization['id'] as int?,
      stillageNumber: jsonSerialization['stillageNumber'] as String,
    );
  }

  static final t = StillageMasterTable();

  static const db = StillageMasterRepository._();

  @override
  int? id;

  String stillageNumber;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [StillageMaster]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StillageMaster copyWith({
    int? id,
    String? stillageNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'stillageNumber': stillageNumber,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'stillageNumber': stillageNumber,
    };
  }

  static StillageMasterInclude include() {
    return StillageMasterInclude._();
  }

  static StillageMasterIncludeList includeList({
    _i1.WhereExpressionBuilder<StillageMasterTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StillageMasterTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StillageMasterTable>? orderByList,
    StillageMasterInclude? include,
  }) {
    return StillageMasterIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StillageMaster.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StillageMaster.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StillageMasterImpl extends StillageMaster {
  _StillageMasterImpl({
    int? id,
    required String stillageNumber,
  }) : super._(
          id: id,
          stillageNumber: stillageNumber,
        );

  /// Returns a shallow copy of this [StillageMaster]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StillageMaster copyWith({
    Object? id = _Undefined,
    String? stillageNumber,
  }) {
    return StillageMaster(
      id: id is int? ? id : this.id,
      stillageNumber: stillageNumber ?? this.stillageNumber,
    );
  }
}

class StillageMasterTable extends _i1.Table<int?> {
  StillageMasterTable({super.tableRelation})
      : super(tableName: 'stillage_master') {
    stillageNumber = _i1.ColumnString(
      'stillageNumber',
      this,
    );
  }

  late final _i1.ColumnString stillageNumber;

  @override
  List<_i1.Column> get columns => [
        id,
        stillageNumber,
      ];
}

class StillageMasterInclude extends _i1.IncludeObject {
  StillageMasterInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => StillageMaster.t;
}

class StillageMasterIncludeList extends _i1.IncludeList {
  StillageMasterIncludeList._({
    _i1.WhereExpressionBuilder<StillageMasterTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StillageMaster.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => StillageMaster.t;
}

class StillageMasterRepository {
  const StillageMasterRepository._();

  /// Returns a list of [StillageMaster]s matching the given query parameters.
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
  Future<List<StillageMaster>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StillageMasterTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StillageMasterTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StillageMasterTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<StillageMaster>(
      where: where?.call(StillageMaster.t),
      orderBy: orderBy?.call(StillageMaster.t),
      orderByList: orderByList?.call(StillageMaster.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [StillageMaster] matching the given query parameters.
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
  Future<StillageMaster?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StillageMasterTable>? where,
    int? offset,
    _i1.OrderByBuilder<StillageMasterTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StillageMasterTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<StillageMaster>(
      where: where?.call(StillageMaster.t),
      orderBy: orderBy?.call(StillageMaster.t),
      orderByList: orderByList?.call(StillageMaster.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [StillageMaster] by its [id] or null if no such row exists.
  Future<StillageMaster?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<StillageMaster>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [StillageMaster]s in the list and returns the inserted rows.
  ///
  /// The returned [StillageMaster]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<StillageMaster>> insert(
    _i1.Session session,
    List<StillageMaster> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<StillageMaster>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [StillageMaster] and returns the inserted row.
  ///
  /// The returned [StillageMaster] will have its `id` field set.
  Future<StillageMaster> insertRow(
    _i1.Session session,
    StillageMaster row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StillageMaster>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StillageMaster]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StillageMaster>> update(
    _i1.Session session,
    List<StillageMaster> rows, {
    _i1.ColumnSelections<StillageMasterTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<StillageMaster>(
      rows,
      columns: columns?.call(StillageMaster.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StillageMaster]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StillageMaster> updateRow(
    _i1.Session session,
    StillageMaster row, {
    _i1.ColumnSelections<StillageMasterTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StillageMaster>(
      row,
      columns: columns?.call(StillageMaster.t),
      transaction: transaction,
    );
  }

  /// Deletes all [StillageMaster]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StillageMaster>> delete(
    _i1.Session session,
    List<StillageMaster> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StillageMaster>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StillageMaster].
  Future<StillageMaster> deleteRow(
    _i1.Session session,
    StillageMaster row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StillageMaster>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StillageMaster>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StillageMasterTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StillageMaster>(
      where: where(StillageMaster.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StillageMasterTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<StillageMaster>(
      where: where?.call(StillageMaster.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
