// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commutes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommutesRecord> _$commutesRecordSerializer =
    new _$CommutesRecordSerializer();

class _$CommutesRecordSerializer
    implements StructuredSerializer<CommutesRecord> {
  @override
  final Iterable<Type> types = const [CommutesRecord, _$CommutesRecord];
  @override
  final String wireName = 'CommutesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommutesRecord object,
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
    value = object.vehicle;
    if (value != null) {
      result
        ..add('vehicle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.availablePassengerSeats;
    if (value != null) {
      result
        ..add('available_passenger_seats')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pricePerSeat;
    if (value != null) {
      result
        ..add('price_per_seat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.driver;
    if (value != null) {
      result
        ..add('driver')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.departureDatetime;
    if (value != null) {
      result
        ..add('departure_datetime')
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
  CommutesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommutesRecordBuilder();

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
        case 'vehicle':
          result.vehicle = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'available_passenger_seats':
          result.availablePassengerSeats = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'price_per_seat':
          result.pricePerSeat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'driver':
          result.driver = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'departure_datetime':
          result.departureDatetime = serializers.deserialize(value,
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

class _$CommutesRecord extends CommutesRecord {
  @override
  final String? origin;
  @override
  final String? destination;
  @override
  final DocumentReference<Object?>? vehicle;
  @override
  final int? availablePassengerSeats;
  @override
  final double? pricePerSeat;
  @override
  final DocumentReference<Object?>? driver;
  @override
  final DateTime? departureDatetime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CommutesRecord([void Function(CommutesRecordBuilder)? updates]) =>
      (new CommutesRecordBuilder()..update(updates))._build();

  _$CommutesRecord._(
      {this.origin,
      this.destination,
      this.vehicle,
      this.availablePassengerSeats,
      this.pricePerSeat,
      this.driver,
      this.departureDatetime,
      this.ffRef})
      : super._();

  @override
  CommutesRecord rebuild(void Function(CommutesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommutesRecordBuilder toBuilder() =>
      new CommutesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommutesRecord &&
        origin == other.origin &&
        destination == other.destination &&
        vehicle == other.vehicle &&
        availablePassengerSeats == other.availablePassengerSeats &&
        pricePerSeat == other.pricePerSeat &&
        driver == other.driver &&
        departureDatetime == other.departureDatetime &&
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
                            vehicle.hashCode),
                        availablePassengerSeats.hashCode),
                    pricePerSeat.hashCode),
                driver.hashCode),
            departureDatetime.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommutesRecord')
          ..add('origin', origin)
          ..add('destination', destination)
          ..add('vehicle', vehicle)
          ..add('availablePassengerSeats', availablePassengerSeats)
          ..add('pricePerSeat', pricePerSeat)
          ..add('driver', driver)
          ..add('departureDatetime', departureDatetime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CommutesRecordBuilder
    implements Builder<CommutesRecord, CommutesRecordBuilder> {
  _$CommutesRecord? _$v;

  String? _origin;
  String? get origin => _$this._origin;
  set origin(String? origin) => _$this._origin = origin;

  String? _destination;
  String? get destination => _$this._destination;
  set destination(String? destination) => _$this._destination = destination;

  DocumentReference<Object?>? _vehicle;
  DocumentReference<Object?>? get vehicle => _$this._vehicle;
  set vehicle(DocumentReference<Object?>? vehicle) => _$this._vehicle = vehicle;

  int? _availablePassengerSeats;
  int? get availablePassengerSeats => _$this._availablePassengerSeats;
  set availablePassengerSeats(int? availablePassengerSeats) =>
      _$this._availablePassengerSeats = availablePassengerSeats;

  double? _pricePerSeat;
  double? get pricePerSeat => _$this._pricePerSeat;
  set pricePerSeat(double? pricePerSeat) => _$this._pricePerSeat = pricePerSeat;

  DocumentReference<Object?>? _driver;
  DocumentReference<Object?>? get driver => _$this._driver;
  set driver(DocumentReference<Object?>? driver) => _$this._driver = driver;

  DateTime? _departureDatetime;
  DateTime? get departureDatetime => _$this._departureDatetime;
  set departureDatetime(DateTime? departureDatetime) =>
      _$this._departureDatetime = departureDatetime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CommutesRecordBuilder() {
    CommutesRecord._initializeBuilder(this);
  }

  CommutesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _origin = $v.origin;
      _destination = $v.destination;
      _vehicle = $v.vehicle;
      _availablePassengerSeats = $v.availablePassengerSeats;
      _pricePerSeat = $v.pricePerSeat;
      _driver = $v.driver;
      _departureDatetime = $v.departureDatetime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommutesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommutesRecord;
  }

  @override
  void update(void Function(CommutesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommutesRecord build() => _build();

  _$CommutesRecord _build() {
    final _$result = _$v ??
        new _$CommutesRecord._(
            origin: origin,
            destination: destination,
            vehicle: vehicle,
            availablePassengerSeats: availablePassengerSeats,
            pricePerSeat: pricePerSeat,
            driver: driver,
            departureDatetime: departureDatetime,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
