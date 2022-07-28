// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_requests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VerificationRequestsRecord> _$verificationRequestsRecordSerializer =
    new _$VerificationRequestsRecordSerializer();

class _$VerificationRequestsRecordSerializer
    implements StructuredSerializer<VerificationRequestsRecord> {
  @override
  final Iterable<Type> types = const [
    VerificationRequestsRecord,
    _$VerificationRequestsRecord
  ];
  @override
  final String wireName = 'VerificationRequestsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VerificationRequestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.requestUserRef;
    if (value != null) {
      result
        ..add('request_user_ref')
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
  VerificationRequestsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VerificationRequestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'request_user_ref':
          result.requestUserRef = serializers.deserialize(value,
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

class _$VerificationRequestsRecord extends VerificationRequestsRecord {
  @override
  final DocumentReference<Object?>? requestUserRef;
  @override
  final DateTime? requestDatetime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VerificationRequestsRecord(
          [void Function(VerificationRequestsRecordBuilder)? updates]) =>
      (new VerificationRequestsRecordBuilder()..update(updates))._build();

  _$VerificationRequestsRecord._(
      {this.requestUserRef, this.requestDatetime, this.ffRef})
      : super._();

  @override
  VerificationRequestsRecord rebuild(
          void Function(VerificationRequestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerificationRequestsRecordBuilder toBuilder() =>
      new VerificationRequestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerificationRequestsRecord &&
        requestUserRef == other.requestUserRef &&
        requestDatetime == other.requestDatetime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, requestUserRef.hashCode), requestDatetime.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerificationRequestsRecord')
          ..add('requestUserRef', requestUserRef)
          ..add('requestDatetime', requestDatetime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VerificationRequestsRecordBuilder
    implements
        Builder<VerificationRequestsRecord, VerificationRequestsRecordBuilder> {
  _$VerificationRequestsRecord? _$v;

  DocumentReference<Object?>? _requestUserRef;
  DocumentReference<Object?>? get requestUserRef => _$this._requestUserRef;
  set requestUserRef(DocumentReference<Object?>? requestUserRef) =>
      _$this._requestUserRef = requestUserRef;

  DateTime? _requestDatetime;
  DateTime? get requestDatetime => _$this._requestDatetime;
  set requestDatetime(DateTime? requestDatetime) =>
      _$this._requestDatetime = requestDatetime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VerificationRequestsRecordBuilder() {
    VerificationRequestsRecord._initializeBuilder(this);
  }

  VerificationRequestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _requestUserRef = $v.requestUserRef;
      _requestDatetime = $v.requestDatetime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerificationRequestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerificationRequestsRecord;
  }

  @override
  void update(void Function(VerificationRequestsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerificationRequestsRecord build() => _build();

  _$VerificationRequestsRecord _build() {
    final _$result = _$v ??
        new _$VerificationRequestsRecord._(
            requestUserRef: requestUserRef,
            requestDatetime: requestDatetime,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
