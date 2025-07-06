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

abstract class PartNumber implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String partNumber;

  String description;

  String commonDescription;

  String pathToPic;

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
