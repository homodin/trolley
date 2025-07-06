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

abstract class StillageMaster implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String stillageNumber;

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
