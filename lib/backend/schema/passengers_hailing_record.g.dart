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
    final result = <Object?>[];
    Object? value;
    value = object.origin;
    if (value != null) {
      result
        ..add('origin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.destination;
    if (value != null) {
      result
        ..add('destination')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.departureDatetime;
    if (value != null) {
      result
        ..add('departure_datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.originAddress;
    if (value != null) {
      result
        ..add('origin_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.destinationAddress;
    if (value != null) {
      result
        ..add('destination_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
        case 'origin':
          result.origin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'destination':
          result.destination = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'departure_datetime':
          result.departureDatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'origin_address':
          result.originAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'destination_address':
          result.destinationAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
  final String? origin;
  @override
  final String? destination;
  @override
  final DateTime? departureDatetime;
  @override
  final String? originAddress;
  @override
  final String? destinationAddress;
  @override
  final DocumentReference<Object?>? hailingPassenger;
  @override
  final bool? archived;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PassengersHailingRecord(
          [void Function(PassengersHailingRecordBuilder)? updates]) =>
      (new PassengersHailingRecordBuilder()..update(updates))._build();

  _$PassengersHailingRecord._(
      {this.origin,
      this.destination,
      this.departureDatetime,
      this.originAddress,
      this.destinationAddress,
      this.hailingPassenger,
      this.archived,
      this.ffRef})
      : super._();

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
        origin == other.origin &&
        destination == other.destination &&
        departureDatetime == other.departureDatetime &&
        originAddress == other.originAddress &&
        destinationAddress == other.destinationAddress &&
        hailingPassenger == other.hailingPassenger &&
        archived == other.archived &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, origin.hashCode), destination.hashCode),
                            departureDatetime.hashCode),
                        originAddress.hashCode),
                    destinationAddress.hashCode),
                hailingPassenger.hashCode),
            archived.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PassengersHailingRecord')
          ..add('origin', origin)
          ..add('destination', destination)
          ..add('departureDatetime', departureDatetime)
          ..add('originAddress', originAddress)
          ..add('destinationAddress', destinationAddress)
          ..add('hailingPassenger', hailingPassenger)
          ..add('archived', archived)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PassengersHailingRecordBuilder
    implements
        Builder<PassengersHailingRecord, PassengersHailingRecordBuilder> {
  _$PassengersHailingRecord? _$v;

  String? _origin;
  String? get origin => _$this._origin;
  set origin(String? origin) => _$this._origin = origin;

  String? _destination;
  String? get destination => _$this._destination;
  set destination(String? destination) => _$this._destination = destination;

  DateTime? _departureDatetime;
  DateTime? get departureDatetime => _$this._departureDatetime;
  set departureDatetime(DateTime? departureDatetime) =>
      _$this._departureDatetime = departureDatetime;

  String? _originAddress;
  String? get originAddress => _$this._originAddress;
  set originAddress(String? originAddress) =>
      _$this._originAddress = originAddress;

  String? _destinationAddress;
  String? get destinationAddress => _$this._destinationAddress;
  set destinationAddress(String? destinationAddress) =>
      _$this._destinationAddress = destinationAddress;

  DocumentReference<Object?>? _hailingPassenger;
  DocumentReference<Object?>? get hailingPassenger => _$this._hailingPassenger;
  set hailingPassenger(DocumentReference<Object?>? hailingPassenger) =>
      _$this._hailingPassenger = hailingPassenger;

  bool? _archived;
  bool? get archived => _$this._archived;
  set archived(bool? archived) => _$this._archived = archived;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PassengersHailingRecordBuilder() {
    PassengersHailingRecord._initializeBuilder(this);
  }

  PassengersHailingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _origin = $v.origin;
      _destination = $v.destination;
      _departureDatetime = $v.departureDatetime;
      _originAddress = $v.originAddress;
      _destinationAddress = $v.destinationAddress;
      _hailingPassenger = $v.hailingPassenger;
      _archived = $v.archived;
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
    final _$result = _$v ??
        new _$PassengersHailingRecord._(
            origin: origin,
            destination: destination,
            departureDatetime: departureDatetime,
            originAddress: originAddress,
            destinationAddress: destinationAddress,
            hailingPassenger: hailingPassenger,
            archived: archived,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
