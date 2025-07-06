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
import '../models/operator_type.dart' as _i2;

abstract class Operators implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  _i2.OperatorType opType;

  String clockNumber;

  String password;

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
