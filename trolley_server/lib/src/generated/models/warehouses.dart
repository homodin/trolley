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

abstract class Warehouses
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Warehouses._({
    this.id,
    required this.warehouse,
    required this.defaultNext,
  });

  factory Warehouses({
    int? id,
    required String warehouse,
    required String defaultNext,
  }) = _WarehousesImpl;

  factory Warehouses.fromJson(Map<String, dynamic> jsonSerialization) {
    return Warehouses(
      id: jsonSerialization['id'] as int?,
      warehouse: jsonSerialization['warehouse'] as String,
      defaultNext: jsonSerialization['defaultNext'] as String,
    );
  }

  static final t = WarehousesTable();

  static const db = WarehousesRepository._();

  @override
  int? id;

  String warehouse;

  String defaultNext;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Warehouses]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Warehouses copyWith({
    int? id,
    String? warehouse,
    String? defaultNext,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'warehouse': warehouse,
      'defaultNext': defaultNext,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'warehouse': warehouse,
      'defaultNext': defaultNext,
    };
  }

  static WarehousesInclude include() {
    return WarehousesInclude._();
  }

  static WarehousesIncludeList includeList({
    _i1.WhereExpressionBuilder<WarehousesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WarehousesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WarehousesTable>? orderByList,
    WarehousesInclude? include,
  }) {
    return WarehousesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Warehouses.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Warehouses.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WarehousesImpl extends Warehouses {
  _WarehousesImpl({
    int? id,
    required String warehouse,
    required String defaultNext,
  }) : super._(
          id: id,
          warehouse: warehouse,
          defaultNext: defaultNext,
        );

  /// Returns a shallow copy of this [Warehouses]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Warehouses copyWith({
    Object? id = _Undefined,
    String? warehouse,
    String? defaultNext,
  }) {
    return Warehouses(
      id: id is int? ? id : this.id,
      warehouse: warehouse ?? this.warehouse,
      defaultNext: defaultNext ?? this.defaultNext,
    );
  }
}

class WarehousesTable extends _i1.Table<int?> {
  WarehousesTable({super.tableRelation}) : super(tableName: 'warehouses') {
    warehouse = _i1.ColumnString(
      'warehouse',
      this,
    );
    defaultNext = _i1.ColumnString(
      'defaultNext',
      this,
    );
  }

  late final _i1.ColumnString warehouse;

  late final _i1.ColumnString defaultNext;

  @override
  List<_i1.Column> get columns => [
        id,
        warehouse,
        defaultNext,
      ];
}

class WarehousesInclude extends _i1.IncludeObject {
  WarehousesInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Warehouses.t;
}

class WarehousesIncludeList extends _i1.IncludeList {
  WarehousesIncludeList._({
    _i1.WhereExpressionBuilder<WarehousesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Warehouses.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Warehouses.t;
}

class WarehousesRepository {
  const WarehousesRepository._();

  /// Returns a list of [Warehouses]s matching the given query parameters.
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
  Future<List<Warehouses>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WarehousesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WarehousesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WarehousesTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Warehouses>(
      where: where?.call(Warehouses.t),
      orderBy: orderBy?.call(Warehouses.t),
      orderByList: orderByList?.call(Warehouses.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Warehouses] matching the given query parameters.
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
  Future<Warehouses?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WarehousesTable>? where,
    int? offset,
    _i1.OrderByBuilder<WarehousesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WarehousesTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Warehouses>(
      where: where?.call(Warehouses.t),
      orderBy: orderBy?.call(Warehouses.t),
      orderByList: orderByList?.call(Warehouses.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Warehouses] by its [id] or null if no such row exists.
  Future<Warehouses?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Warehouses>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Warehouses]s in the list and returns the inserted rows.
  ///
  /// The returned [Warehouses]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Warehouses>> insert(
    _i1.Session session,
    List<Warehouses> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Warehouses>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Warehouses] and returns the inserted row.
  ///
  /// The returned [Warehouses] will have its `id` field set.
  Future<Warehouses> insertRow(
    _i1.Session session,
    Warehouses row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Warehouses>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Warehouses]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Warehouses>> update(
    _i1.Session session,
    List<Warehouses> rows, {
    _i1.ColumnSelections<WarehousesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Warehouses>(
      rows,
      columns: columns?.call(Warehouses.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Warehouses]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Warehouses> updateRow(
    _i1.Session session,
    Warehouses row, {
    _i1.ColumnSelections<WarehousesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Warehouses>(
      row,
      columns: columns?.call(Warehouses.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Warehouses]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Warehouses>> delete(
    _i1.Session session,
    List<Warehouses> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Warehouses>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Warehouses].
  Future<Warehouses> deleteRow(
    _i1.Session session,
    Warehouses row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Warehouses>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Warehouses>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WarehousesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Warehouses>(
      where: where(Warehouses.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WarehousesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Warehouses>(
      where: where?.call(Warehouses.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
