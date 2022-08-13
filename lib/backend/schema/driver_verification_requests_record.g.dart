// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_verification_requests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DriverVerificationRequestsRecord>
    _$driverVerificationRequestsRecordSerializer =
    new _$DriverVerificationRequestsRecordSerializer();

class _$DriverVerificationRequestsRecordSerializer
    implements StructuredSerializer<DriverVerificationRequestsRecord> {
  @override
  final Iterable<Type> types = const [
    DriverVerificationRequestsRecord,
    _$DriverVerificationRequestsRecord
  ];
  @override
  final String wireName = 'DriverVerificationRequestsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DriverVerificationRequestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.requestDriverRef;
    if (value != null) {
      result
        ..add('request_driver_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.requestDatetime;
    if (value != null) {
      result
        ..add('request_datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  DriverVerificationRequestsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DriverVerificationRequestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'request_driver_ref':
          result.requestDriverRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'request_datetime':
          result.requestDatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$DriverVerificationRequestsRecord
    extends DriverVerificationRequestsRecord {
  @override
  final DocumentReference<Object?>? requestDriverRef;
  @override
  final DateTime? requestDatetime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DriverVerificationRequestsRecord(
          [void Function(DriverVerificationRequestsRecordBuilder)? updates]) =>
      (new DriverVerificationRequestsRecordBuilder()..update(updates))._build();

  _$DriverVerificationRequestsRecord._(
      {this.requestDriverRef, this.requestDatetime, this.ffRef})
      : super._();

  @override
  DriverVerificationRequestsRecord rebuild(
          void Function(DriverVerificationRequestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DriverVerificationRequestsRecordBuilder toBuilder() =>
      new DriverVerificationRequestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DriverVerificationRequestsRecord &&
        requestDriverRef == other.requestDriverRef &&
        requestDatetime == other.requestDatetime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, requestDriverRef.hashCode), requestDatetime.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DriverVerificationRequestsRecord')
          ..add('requestDriverRef', requestDriverRef)
          ..add('requestDatetime', requestDatetime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DriverVerificationRequestsRecordBuilder
    implements
        Builder<DriverVerificationRequestsRecord,
            DriverVerificationRequestsRecordBuilder> {
  _$DriverVerificationRequestsRecord? _$v;

  DocumentReference<Object?>? _requestDriverRef;
  DocumentReference<Object?>? get requestDriverRef => _$this._requestDriverRef;
  set requestDriverRef(DocumentReference<Object?>? requestDriverRef) =>
      _$this._requestDriverRef = requestDriverRef;

  DateTime? _requestDatetime;
  DateTime? get requestDatetime => _$this._requestDatetime;
  set requestDatetime(DateTime? requestDatetime) =>
      _$this._requestDatetime = requestDatetime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DriverVerificationRequestsRecordBuilder() {
    DriverVerificationRequestsRecord._initializeBuilder(this);
  }

  DriverVerificationRequestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _requestDriverRef = $v.requestDriverRef;
      _requestDatetime = $v.requestDatetime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DriverVerificationRequestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DriverVerificationRequestsRecord;
  }

  @override
  void update(void Function(DriverVerificationRequestsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DriverVerificationRequestsRecord build() => _build();

  _$DriverVerificationRequestsRecord _build() {
    final _$result = _$v ??
        new _$DriverVerificationRequestsRecord._(
            requestDriverRef: requestDriverRef,
            requestDatetime: requestDatetime,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
