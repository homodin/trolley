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
import '../models/operator_type.dart' as _i2;

abstract class Operators
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Operators._({
    this.id,
    required this.name,
    required this.opType,
    required this.clockNumber,
    required this.password,
  });

  factory Operators({
    int? id,
    required String name,
    required _i2.OperatorType opType,
    required String clockNumber,
    required String password,
  }) = _OperatorsImpl;

  factory Operators.fromJson(Map<String, dynamic> jsonSerialization) {
    return Operators(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      opType:
          _i2.OperatorType.fromJson((jsonSerialization['opType'] as String)),
      clockNumber: jsonSerialization['clockNumber'] as String,
      password: jsonSerialization['password'] as String,
    );
  }

  static final t = OperatorsTable();

  static const db = OperatorsRepository._();

  @override
  int? id;

  String name;

  _i2.OperatorType opType;

  String clockNumber;

  String password;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Operators]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Operators copyWith({
    int? id,
    String? name,
    _i2.OperatorType? opType,
    String? clockNumber,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'opType': opType.toJson(),
      'clockNumber': clockNumber,
      'password': password,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'opType': opType.toJson(),
      'clockNumber': clockNumber,
      'password': password,
    };
  }

  static OperatorsInclude include() {
    return OperatorsInclude._();
  }

  static OperatorsIncludeList includeList({
    _i1.WhereExpressionBuilder<OperatorsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OperatorsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OperatorsTable>? orderByList,
    OperatorsInclude? include,
  }) {
    return OperatorsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Operators.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Operators.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OperatorsImpl extends Operators {
  _OperatorsImpl({
    int? id,
    required String name,
    required _i2.OperatorType opType,
    required String clockNumber,
    required String password,
  }) : super._(
          id: id,
          name: name,
          opType: opType,
          clockNumber: clockNumber,
          password: password,
        );

  /// Returns a shallow copy of this [Operators]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Operators copyWith({
    Object? id = _Undefined,
    String? name,
    _i2.OperatorType? opType,
    String? clockNumber,
    String? password,
  }) {
    return Operators(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      opType: opType ?? this.opType,
      clockNumber: clockNumber ?? this.clockNumber,
      password: password ?? this.password,
    );
  }
}

class OperatorsTable extends _i1.Table<int?> {
  OperatorsTable({super.tableRelation}) : super(tableName: 'operator') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    opType = _i1.ColumnEnum(
      'opType',
      this,
      _i1.EnumSerialization.byName,
    );
    clockNumber = _i1.ColumnString(
      'clockNumber',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnEnum<_i2.OperatorType> opType;

  late final _i1.ColumnString clockNumber;

  late final _i1.ColumnString password;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        opType,
        clockNumber,
        password,
      ];
}

class OperatorsInclude extends _i1.IncludeObject {
  OperatorsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Operators.t;
}

class OperatorsIncludeList extends _i1.IncludeList {
  OperatorsIncludeList._({
    _i1.WhereExpressionBuilder<OperatorsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Operators.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Operators.t;
}

class OperatorsRepository {
  const OperatorsRepository._();

  /// Returns a list of [Operators]s matching the given query parameters.
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
  Future<List<Operators>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OperatorsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OperatorsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OperatorsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Operators>(
      where: where?.call(Operators.t),
      orderBy: orderBy?.call(Operators.t),
      orderByList: orderByList?.call(Operators.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Operators] matching the given query parameters.
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
  Future<Operators?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OperatorsTable>? where,
    int? offset,
    _i1.OrderByBuilder<OperatorsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OperatorsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Operators>(
      where: where?.call(Operators.t),
      orderBy: orderBy?.call(Operators.t),
      orderByList: orderByList?.call(Operators.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Operators] by its [id] or null if no such row exists.
  Future<Operators?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Operators>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Operators]s in the list and returns the inserted rows.
  ///
  /// The returned [Operators]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Operators>> insert(
    _i1.Session session,
    List<Operators> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Operators>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Operators] and returns the inserted row.
  ///
  /// The returned [Operators] will have its `id` field set.
  Future<Operators> insertRow(
    _i1.Session session,
    Operators row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Operators>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Operators]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Operators>> update(
    _i1.Session session,
    List<Operators> rows, {
    _i1.ColumnSelections<OperatorsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Operators>(
      rows,
      columns: columns?.call(Operators.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Operators]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Operators> updateRow(
    _i1.Session session,
    Operators row, {
    _i1.ColumnSelections<OperatorsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Operators>(
      row,
      columns: columns?.call(Operators.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Operators]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Operators>> delete(
    _i1.Session session,
    List<Operators> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Operators>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Operators].
  Future<Operators> deleteRow(
    _i1.Session session,
    Operators row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Operators>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Operators>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OperatorsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Operators>(
      where: where(Operators.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OperatorsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Operators>(
      where: where?.call(Operators.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
