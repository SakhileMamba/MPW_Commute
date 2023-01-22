// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passengers_hailing_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PassengersHailingRecord> _$passengersHailingRecordSerializer =
    new _$PassengersHailingRecordSerializer();

class _$PassengersHailingRecordSerializer
    implements StructuredSerializer<PassengersHailingRecord> {
  @override
  final Iterable<Type> types = const [
    PassengersHailingRecord,
    _$PassengersHailingRecord
  ];
  @override
  final String wireName = 'PassengersHailingRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PassengersHailingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'originReversedGeocoded',
      serializers.serialize(object.originReversedGeocoded,
          specifiedType: const FullType(LatlngReverseGeocodingStruct)),
      'destinationReversedGeocoded',
      serializers.serialize(object.destinationReversedGeocoded,
          specifiedType: const FullType(LatlngReverseGeocodingStruct)),
    ];
    Object? value;
    value = object.departureDatetime;
    if (value != null) {
      result
        ..add('departure_datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.hailingPassenger;
    if (value != null) {
      result
        ..add('hailingPassenger')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.archived;
    if (value != null) {
      result
        ..add('archived')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdDatetime;
    if (value != null) {
      result
        ..add('created_datetime')
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
  PassengersHailingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PassengersHailingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'departure_datetime':
          result.departureDatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'hailingPassenger':
          result.hailingPassenger = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'archived':
          result.archived = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'originReversedGeocoded':
          result.originReversedGeocoded.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LatlngReverseGeocodingStruct))!
              as LatlngReverseGeocodingStruct);
          break;
        case 'destinationReversedGeocoded':
          result.destinationReversedGeocoded.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(LatlngReverseGeocodingStruct))!
              as LatlngReverseGeocodingStruct);
          break;
        case 'created_datetime':
          result.createdDatetime = serializers.deserialize(value,
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

class _$PassengersHailingRecord extends PassengersHailingRecord {
  @override
  final DateTime? departureDatetime;
  @override
  final DocumentReference<Object?>? hailingPassenger;
  @override
  final bool? archived;
  @override
  final LatlngReverseGeocodingStruct originReversedGeocoded;
  @override
  final LatlngReverseGeocodingStruct destinationReversedGeocoded;
  @override
  final DateTime? createdDatetime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PassengersHailingRecord(
          [void Function(PassengersHailingRecordBuilder)? updates]) =>
      (new PassengersHailingRecordBuilder()..update(updates))._build();

  _$PassengersHailingRecord._(
      {this.departureDatetime,
      this.hailingPassenger,
      this.archived,
      required this.originReversedGeocoded,
      required this.destinationReversedGeocoded,
      this.createdDatetime,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(originReversedGeocoded,
        r'PassengersHailingRecord', 'originReversedGeocoded');
    BuiltValueNullFieldError.checkNotNull(destinationReversedGeocoded,
        r'PassengersHailingRecord', 'destinationReversedGeocoded');
  }

  @override
  PassengersHailingRecord rebuild(
          void Function(PassengersHailingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PassengersHailingRecordBuilder toBuilder() =>
      new PassengersHailingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PassengersHailingRecord &&
        departureDatetime == other.departureDatetime &&
        hailingPassenger == other.hailingPassenger &&
        archived == other.archived &&
        originReversedGeocoded == other.originReversedGeocoded &&
        destinationReversedGeocoded == other.destinationReversedGeocoded &&
        createdDatetime == other.createdDatetime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, departureDatetime.hashCode),
                            hailingPassenger.hashCode),
                        archived.hashCode),
                    originReversedGeocoded.hashCode),
                destinationReversedGeocoded.hashCode),
            createdDatetime.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PassengersHailingRecord')
          ..add('departureDatetime', departureDatetime)
          ..add('hailingPassenger', hailingPassenger)
          ..add('archived', archived)
          ..add('originReversedGeocoded', originReversedGeocoded)
          ..add('destinationReversedGeocoded', destinationReversedGeocoded)
          ..add('createdDatetime', createdDatetime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PassengersHailingRecordBuilder
    implements
        Builder<PassengersHailingRecord, PassengersHailingRecordBuilder> {
  _$PassengersHailingRecord? _$v;

  DateTime? _departureDatetime;
  DateTime? get departureDatetime => _$this._departureDatetime;
  set departureDatetime(DateTime? departureDatetime) =>
      _$this._departureDatetime = departureDatetime;

  DocumentReference<Object?>? _hailingPassenger;
  DocumentReference<Object?>? get hailingPassenger => _$this._hailingPassenger;
  set hailingPassenger(DocumentReference<Object?>? hailingPassenger) =>
      _$this._hailingPassenger = hailingPassenger;

  bool? _archived;
  bool? get archived => _$this._archived;
  set archived(bool? archived) => _$this._archived = archived;

  LatlngReverseGeocodingStructBuilder? _originReversedGeocoded;
  LatlngReverseGeocodingStructBuilder get originReversedGeocoded =>
      _$this._originReversedGeocoded ??=
          new LatlngReverseGeocodingStructBuilder();
  set originReversedGeocoded(
          LatlngReverseGeocodingStructBuilder? originReversedGeocoded) =>
      _$this._originReversedGeocoded = originReversedGeocoded;

  LatlngReverseGeocodingStructBuilder? _destinationReversedGeocoded;
  LatlngReverseGeocodingStructBuilder get destinationReversedGeocoded =>
      _$this._destinationReversedGeocoded ??=
          new LatlngReverseGeocodingStructBuilder();
  set destinationReversedGeocoded(
          LatlngReverseGeocodingStructBuilder? destinationReversedGeocoded) =>
      _$this._destinationReversedGeocoded = destinationReversedGeocoded;

  DateTime? _createdDatetime;
  DateTime? get createdDatetime => _$this._createdDatetime;
  set createdDatetime(DateTime? createdDatetime) =>
      _$this._createdDatetime = createdDatetime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PassengersHailingRecordBuilder() {
    PassengersHailingRecord._initializeBuilder(this);
  }

  PassengersHailingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _departureDatetime = $v.departureDatetime;
      _hailingPassenger = $v.hailingPassenger;
      _archived = $v.archived;
      _originReversedGeocoded = $v.originReversedGeocoded.toBuilder();
      _destinationReversedGeocoded = $v.destinationReversedGeocoded.toBuilder();
      _createdDatetime = $v.createdDatetime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PassengersHailingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PassengersHailingRecord;
  }

  @override
  void update(void Function(PassengersHailingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PassengersHailingRecord build() => _build();

  _$PassengersHailingRecord _build() {
    _$PassengersHailingRecord _$result;
    try {
      _$result = _$v ??
          new _$PassengersHailingRecord._(
              departureDatetime: departureDatetime,
              hailingPassenger: hailingPassenger,
              archived: archived,
              originReversedGeocoded: originReversedGeocoded.build(),
              destinationReversedGeocoded: destinationReversedGeocoded.build(),
              createdDatetime: createdDatetime,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'originReversedGeocoded';
        originReversedGeocoded.build();
        _$failedField = 'destinationReversedGeocoded';
        destinationReversedGeocoded.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PassengersHailingRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
