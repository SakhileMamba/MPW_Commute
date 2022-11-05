// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_requests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PickupRequestsRecord> _$pickupRequestsRecordSerializer =
    new _$PickupRequestsRecordSerializer();

class _$PickupRequestsRecordSerializer
    implements StructuredSerializer<PickupRequestsRecord> {
  @override
  final Iterable<Type> types = const [
    PickupRequestsRecord,
    _$PickupRequestsRecord
  ];
  @override
  final String wireName = 'PickupRequestsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PickupRequestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.driver;
    if (value != null) {
      result
        ..add('driver')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.vehicle;
    if (value != null) {
      result
        ..add('vehicle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.availableSeats;
    if (value != null) {
      result
        ..add('available_seats')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pricePerSeat;
    if (value != null) {
      result
        ..add('price_per_seat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PickupRequestsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PickupRequestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'driver':
          result.driver = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'vehicle':
          result.vehicle = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'available_seats':
          result.availableSeats = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'price_per_seat':
          result.pricePerSeat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PickupRequestsRecord extends PickupRequestsRecord {
  @override
  final DocumentReference<Object?>? driver;
  @override
  final DocumentReference<Object?>? vehicle;
  @override
  final int? availableSeats;
  @override
  final double? pricePerSeat;
  @override
  final String? currency;
  @override
  final bool? archived;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PickupRequestsRecord(
          [void Function(PickupRequestsRecordBuilder)? updates]) =>
      (new PickupRequestsRecordBuilder()..update(updates))._build();

  _$PickupRequestsRecord._(
      {this.driver,
      this.vehicle,
      this.availableSeats,
      this.pricePerSeat,
      this.currency,
      this.archived,
      this.ffRef})
      : super._();

  @override
  PickupRequestsRecord rebuild(
          void Function(PickupRequestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PickupRequestsRecordBuilder toBuilder() =>
      new PickupRequestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PickupRequestsRecord &&
        driver == other.driver &&
        vehicle == other.vehicle &&
        availableSeats == other.availableSeats &&
        pricePerSeat == other.pricePerSeat &&
        currency == other.currency &&
        archived == other.archived &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, driver.hashCode), vehicle.hashCode),
                        availableSeats.hashCode),
                    pricePerSeat.hashCode),
                currency.hashCode),
            archived.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PickupRequestsRecord')
          ..add('driver', driver)
          ..add('vehicle', vehicle)
          ..add('availableSeats', availableSeats)
          ..add('pricePerSeat', pricePerSeat)
          ..add('currency', currency)
          ..add('archived', archived)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PickupRequestsRecordBuilder
    implements Builder<PickupRequestsRecord, PickupRequestsRecordBuilder> {
  _$PickupRequestsRecord? _$v;

  DocumentReference<Object?>? _driver;
  DocumentReference<Object?>? get driver => _$this._driver;
  set driver(DocumentReference<Object?>? driver) => _$this._driver = driver;

  DocumentReference<Object?>? _vehicle;
  DocumentReference<Object?>? get vehicle => _$this._vehicle;
  set vehicle(DocumentReference<Object?>? vehicle) => _$this._vehicle = vehicle;

  int? _availableSeats;
  int? get availableSeats => _$this._availableSeats;
  set availableSeats(int? availableSeats) =>
      _$this._availableSeats = availableSeats;

  double? _pricePerSeat;
  double? get pricePerSeat => _$this._pricePerSeat;
  set pricePerSeat(double? pricePerSeat) => _$this._pricePerSeat = pricePerSeat;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  bool? _archived;
  bool? get archived => _$this._archived;
  set archived(bool? archived) => _$this._archived = archived;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PickupRequestsRecordBuilder() {
    PickupRequestsRecord._initializeBuilder(this);
  }

  PickupRequestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _driver = $v.driver;
      _vehicle = $v.vehicle;
      _availableSeats = $v.availableSeats;
      _pricePerSeat = $v.pricePerSeat;
      _currency = $v.currency;
      _archived = $v.archived;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PickupRequestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PickupRequestsRecord;
  }

  @override
  void update(void Function(PickupRequestsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PickupRequestsRecord build() => _build();

  _$PickupRequestsRecord _build() {
    final _$result = _$v ??
        new _$PickupRequestsRecord._(
            driver: driver,
            vehicle: vehicle,
            availableSeats: availableSeats,
            pricePerSeat: pricePerSeat,
            currency: currency,
            archived: archived,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
