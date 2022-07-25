// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VehiclesRecord> _$vehiclesRecordSerializer =
    new _$VehiclesRecordSerializer();

class _$VehiclesRecordSerializer
    implements StructuredSerializer<VehiclesRecord> {
  @override
  final Iterable<Type> types = const [VehiclesRecord, _$VehiclesRecord];
  @override
  final String wireName = 'VehiclesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, VehiclesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.registrationNumber;
    if (value != null) {
      result
        ..add('registration_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numberOfPassengerSeats;
    if (value != null) {
      result
        ..add('number_of_passenger_seats')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.imageURL;
    if (value != null) {
      result
        ..add('image_URL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.make;
    if (value != null) {
      result
        ..add('make')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.model;
    if (value != null) {
      result
        ..add('model')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.year;
    if (value != null) {
      result
        ..add('year')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  VehiclesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VehiclesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'registration_number':
          result.registrationNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'number_of_passenger_seats':
          result.numberOfPassengerSeats = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image_URL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'make':
          result.make = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$VehiclesRecord extends VehiclesRecord {
  @override
  final String? registrationNumber;
  @override
  final int? numberOfPassengerSeats;
  @override
  final String? imageURL;
  @override
  final String? make;
  @override
  final String? model;
  @override
  final String? year;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VehiclesRecord([void Function(VehiclesRecordBuilder)? updates]) =>
      (new VehiclesRecordBuilder()..update(updates)).build();

  _$VehiclesRecord._(
      {this.registrationNumber,
      this.numberOfPassengerSeats,
      this.imageURL,
      this.make,
      this.model,
      this.year,
      this.ffRef})
      : super._();

  @override
  VehiclesRecord rebuild(void Function(VehiclesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VehiclesRecordBuilder toBuilder() =>
      new VehiclesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VehiclesRecord &&
        registrationNumber == other.registrationNumber &&
        numberOfPassengerSeats == other.numberOfPassengerSeats &&
        imageURL == other.imageURL &&
        make == other.make &&
        model == other.model &&
        year == other.year &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, registrationNumber.hashCode),
                            numberOfPassengerSeats.hashCode),
                        imageURL.hashCode),
                    make.hashCode),
                model.hashCode),
            year.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VehiclesRecord')
          ..add('registrationNumber', registrationNumber)
          ..add('numberOfPassengerSeats', numberOfPassengerSeats)
          ..add('imageURL', imageURL)
          ..add('make', make)
          ..add('model', model)
          ..add('year', year)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VehiclesRecordBuilder
    implements Builder<VehiclesRecord, VehiclesRecordBuilder> {
  _$VehiclesRecord? _$v;

  String? _registrationNumber;
  String? get registrationNumber => _$this._registrationNumber;
  set registrationNumber(String? registrationNumber) =>
      _$this._registrationNumber = registrationNumber;

  int? _numberOfPassengerSeats;
  int? get numberOfPassengerSeats => _$this._numberOfPassengerSeats;
  set numberOfPassengerSeats(int? numberOfPassengerSeats) =>
      _$this._numberOfPassengerSeats = numberOfPassengerSeats;

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

  String? _make;
  String? get make => _$this._make;
  set make(String? make) => _$this._make = make;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  String? _year;
  String? get year => _$this._year;
  set year(String? year) => _$this._year = year;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VehiclesRecordBuilder() {
    VehiclesRecord._initializeBuilder(this);
  }

  VehiclesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _registrationNumber = $v.registrationNumber;
      _numberOfPassengerSeats = $v.numberOfPassengerSeats;
      _imageURL = $v.imageURL;
      _make = $v.make;
      _model = $v.model;
      _year = $v.year;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VehiclesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VehiclesRecord;
  }

  @override
  void update(void Function(VehiclesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VehiclesRecord build() {
    final _$result = _$v ??
        new _$VehiclesRecord._(
            registrationNumber: registrationNumber,
            numberOfPassengerSeats: numberOfPassengerSeats,
            imageURL: imageURL,
            make: make,
            model: model,
            year: year,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
