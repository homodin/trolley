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

abstract class PartNumber
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PartNumber._({
    this.id,
    required this.partNumber,
    required this.description,
    required this.commonDescription,
    required this.pathToPic,
  });

  factory PartNumber({
    int? id,
    required String partNumber,
    required String description,
    required String commonDescription,
    required String pathToPic,
  }) = _PartNumberImpl;

  factory PartNumber.fromJson(Map<String, dynamic> jsonSerialization) {
    return PartNumber(
      id: jsonSerialization['id'] as int?,
      partNumber: jsonSerialization['partNumber'] as String,
      description: jsonSerialization['description'] as String,
      commonDescription: jsonSerialization['commonDescription'] as String,
      pathToPic: jsonSerialization['pathToPic'] as String,
    );
  }

  static final t = PartNumberTable();

  static const db = PartNumberRepository._();

  @override
  int? id;

  String partNumber;

  String description;

  String commonDescription;

  String pathToPic;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PartNumber]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PartNumber copyWith({
    int? id,
    String? partNumber,
    String? description,
    String? commonDescription,
    String? pathToPic,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'partNumber': partNumber,
      'description': description,
      'commonDescription': commonDescription,
      'pathToPic': pathToPic,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'partNumber': partNumber,
      'description': description,
      'commonDescription': commonDescription,
      'pathToPic': pathToPic,
    };
  }

  static PartNumberInclude include() {
    return PartNumberInclude._();
  }

  static PartNumberIncludeList includeList({
    _i1.WhereExpressionBuilder<PartNumberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PartNumberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PartNumberTable>? orderByList,
    PartNumberInclude? include,
  }) {
    return PartNumberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PartNumber.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PartNumber.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PartNumberImpl extends PartNumber {
  _PartNumberImpl({
    int? id,
    required String partNumber,
    required String description,
    required String commonDescription,
    required String pathToPic,
  }) : super._(
          id: id,
          partNumber: partNumber,
          description: description,
          commonDescription: commonDescription,
          pathToPic: pathToPic,
        );

  /// Returns a shallow copy of this [PartNumber]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PartNumber copyWith({
    Object? id = _Undefined,
    String? partNumber,
    String? description,
    String? commonDescription,
    String? pathToPic,
  }) {
    return PartNumber(
      id: id is int? ? id : this.id,
      partNumber: partNumber ?? this.partNumber,
      description: description ?? this.description,
      commonDescription: commonDescription ?? this.commonDescription,
      pathToPic: pathToPic ?? this.pathToPic,
    );
  }
}

class PartNumberTable extends _i1.Table<int?> {
  PartNumberTable({super.tableRelation}) : super(tableName: 'part_number') {
    partNumber = _i1.ColumnString(
      'partNumber',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    commonDescription = _i1.ColumnString(
      'commonDescription',
      this,
    );
    pathToPic = _i1.ColumnString(
      'pathToPic',
      this,
    );
  }

  late final _i1.ColumnString partNumber;

  late final _i1.ColumnString description;

  late final _i1.ColumnString commonDescription;

  late final _i1.ColumnString pathToPic;

  @override
  List<_i1.Column> get columns => [
        id,
        partNumber,
        description,
        commonDescription,
        pathToPic,
      ];
}

class PartNumberInclude extends _i1.IncludeObject {
  PartNumberInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => PartNumber.t;
}

class PartNumberIncludeList extends _i1.IncludeList {
  PartNumberIncludeList._({
    _i1.WhereExpressionBuilder<PartNumberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PartNumber.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PartNumber.t;
}

class PartNumberRepository {
  const PartNumberRepository._();

  /// Returns a list of [PartNumber]s matching the given query parameters.
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
  Future<List<PartNumber>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PartNumberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PartNumberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PartNumberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PartNumber>(
      where: where?.call(PartNumber.t),
      orderBy: orderBy?.call(PartNumber.t),
      orderByList: orderByList?.call(PartNumber.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [PartNumber] matching the given query parameters.
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
  Future<PartNumber?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PartNumberTable>? where,
    int? offset,
    _i1.OrderByBuilder<PartNumberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PartNumberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<PartNumber>(
      where: where?.call(PartNumber.t),
      orderBy: orderBy?.call(PartNumber.t),
      orderByList: orderByList?.call(PartNumber.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [PartNumber] by its [id] or null if no such row exists.
  Future<PartNumber?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<PartNumber>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [PartNumber]s in the list and returns the inserted rows.
  ///
  /// The returned [PartNumber]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PartNumber>> insert(
    _i1.Session session,
    List<PartNumber> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PartNumber>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PartNumber] and returns the inserted row.
  ///
  /// The returned [PartNumber] will have its `id` field set.
  Future<PartNumber> insertRow(
    _i1.Session session,
    PartNumber row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PartNumber>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PartNumber]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PartNumber>> update(
    _i1.Session session,
    List<PartNumber> rows, {
    _i1.ColumnSelections<PartNumberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PartNumber>(
      rows,
      columns: columns?.call(PartNumber.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PartNumber]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PartNumber> updateRow(
    _i1.Session session,
    PartNumber row, {
    _i1.ColumnSelections<PartNumberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PartNumber>(
      row,
      columns: columns?.call(PartNumber.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PartNumber]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PartNumber>> delete(
    _i1.Session session,
    List<PartNumber> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PartNumber>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PartNumber].
  Future<PartNumber> deleteRow(
    _i1.Session session,
    PartNumber row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PartNumber>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PartNumber>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PartNumberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PartNumber>(
      where: where(PartNumber.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PartNumberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PartNumber>(
      where: where?.call(PartNumber.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
