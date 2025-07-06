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

abstract class Warehouses implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String warehouse;

  String defaultNext;

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
