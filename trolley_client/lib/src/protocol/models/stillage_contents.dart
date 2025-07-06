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
import '../models/content_type.dart' as _i2;

abstract class Contents implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String contentId;

  String partNumber;

  int quantity;

  String employeeName;

  DateTime transactionDatetime;

  _i2.ContentType contentType;

  String reason;

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
