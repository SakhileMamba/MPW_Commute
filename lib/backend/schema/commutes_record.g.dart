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
    final result = <Object?>[
      'originReversedGeocoded',
      serializers.serialize(object.originReversedGeocoded,
          specifiedType: const FullType(LatlngReverseGeocodingStruct)),
      'destinationReversedGeocoded',
      serializers.serialize(object.destinationReversedGeocoded,
          specifiedType: const FullType(LatlngReverseGeocodingStruct)),
    ];
    Object? value;
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
    value = object.driversRating;
    if (value != null) {
      result
        ..add('driversRating')
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
    value = object.applicantList;
    if (value != null) {
      result
        ..add('applicant_list')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
        case 'driversRating':
          result.driversRating = serializers.deserialize(value,
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
        case 'applicant_list':
          result.applicantList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$CommutesRecord extends CommutesRecord {
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
  final double? driversRating;
  @override
  final String? currency;
  @override
  final bool? archived;
  @override
  final BuiltList<DocumentReference<Object?>>? applicantList;
  @override
  final LatlngReverseGeocodingStruct originReversedGeocoded;
  @override
  final LatlngReverseGeocodingStruct destinationReversedGeocoded;
  @override
  final DateTime? createdDatetime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CommutesRecord([void Function(CommutesRecordBuilder)? updates]) =>
      (new CommutesRecordBuilder()..update(updates))._build();

  _$CommutesRecord._(
      {this.vehicle,
      this.availablePassengerSeats,
      this.pricePerSeat,
      this.driver,
      this.departureDatetime,
      this.driversRating,
      this.currency,
      this.archived,
      this.applicantList,
      required this.originReversedGeocoded,
      required this.destinationReversedGeocoded,
      this.createdDatetime,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        originReversedGeocoded, r'CommutesRecord', 'originReversedGeocoded');
    BuiltValueNullFieldError.checkNotNull(destinationReversedGeocoded,
        r'CommutesRecord', 'destinationReversedGeocoded');
  }

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
        vehicle == other.vehicle &&
        availablePassengerSeats == other.availablePassengerSeats &&
        pricePerSeat == other.pricePerSeat &&
        driver == other.driver &&
        departureDatetime == other.departureDatetime &&
        driversRating == other.driversRating &&
        currency == other.currency &&
        archived == other.archived &&
        applicantList == other.applicantList &&
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
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(0, vehicle.hashCode),
                                                    availablePassengerSeats
                                                        .hashCode),
                                                pricePerSeat.hashCode),
                                            driver.hashCode),
                                        departureDatetime.hashCode),
                                    driversRating.hashCode),
                                currency.hashCode),
                            archived.hashCode),
                        applicantList.hashCode),
                    originReversedGeocoded.hashCode),
                destinationReversedGeocoded.hashCode),
            createdDatetime.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommutesRecord')
          ..add('vehicle', vehicle)
          ..add('availablePassengerSeats', availablePassengerSeats)
          ..add('pricePerSeat', pricePerSeat)
          ..add('driver', driver)
          ..add('departureDatetime', departureDatetime)
          ..add('driversRating', driversRating)
          ..add('currency', currency)
          ..add('archived', archived)
          ..add('applicantList', applicantList)
          ..add('originReversedGeocoded', originReversedGeocoded)
          ..add('destinationReversedGeocoded', destinationReversedGeocoded)
          ..add('createdDatetime', createdDatetime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CommutesRecordBuilder
    implements Builder<CommutesRecord, CommutesRecordBuilder> {
  _$CommutesRecord? _$v;

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

  double? _driversRating;
  double? get driversRating => _$this._driversRating;
  set driversRating(double? driversRating) =>
      _$this._driversRating = driversRating;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  bool? _archived;
  bool? get archived => _$this._archived;
  set archived(bool? archived) => _$this._archived = archived;

  ListBuilder<DocumentReference<Object?>>? _applicantList;
  ListBuilder<DocumentReference<Object?>> get applicantList =>
      _$this._applicantList ??= new ListBuilder<DocumentReference<Object?>>();
  set applicantList(ListBuilder<DocumentReference<Object?>>? applicantList) =>
      _$this._applicantList = applicantList;

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

  CommutesRecordBuilder() {
    CommutesRecord._initializeBuilder(this);
  }

  CommutesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vehicle = $v.vehicle;
      _availablePassengerSeats = $v.availablePassengerSeats;
      _pricePerSeat = $v.pricePerSeat;
      _driver = $v.driver;
      _departureDatetime = $v.departureDatetime;
      _driversRating = $v.driversRating;
      _currency = $v.currency;
      _archived = $v.archived;
      _applicantList = $v.applicantList?.toBuilder();
      _originReversedGeocoded = $v.originReversedGeocoded.toBuilder();
      _destinationReversedGeocoded = $v.destinationReversedGeocoded.toBuilder();
      _createdDatetime = $v.createdDatetime;
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
    _$CommutesRecord _$result;
    try {
      _$result = _$v ??
          new _$CommutesRecord._(
              vehicle: vehicle,
              availablePassengerSeats: availablePassengerSeats,
              pricePerSeat: pricePerSeat,
              driver: driver,
              departureDatetime: departureDatetime,
              driversRating: driversRating,
              currency: currency,
              archived: archived,
              applicantList: _applicantList?.build(),
              originReversedGeocoded: originReversedGeocoded.build(),
              destinationReversedGeocoded: destinationReversedGeocoded.build(),
              createdDatetime: createdDatetime,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'applicantList';
        _applicantList?.build();
        _$failedField = 'originReversedGeocoded';
        originReversedGeocoded.build();
        _$failedField = 'destinationReversedGeocoded';
        destinationReversedGeocoded.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CommutesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
