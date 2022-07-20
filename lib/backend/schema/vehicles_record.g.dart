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
    value = object.vehicleRegistration;
    if (value != null) {
      result
        ..add('vehicle_registration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numberOfPassengerSeats;
    if (value != null) {
      result
        ..add('number_of_passenger_seats')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.imageUrls;
    if (value != null) {
      result
        ..add('image_urls')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.vehicleMake;
    if (value != null) {
      result
        ..add('vehicle_make')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vehicleModel;
    if (value != null) {
      result
        ..add('vehicle_model')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vehicleModelYear;
    if (value != null) {
      result
        ..add('vehicle_model_year')
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
        case 'vehicle_registration':
          result.vehicleRegistration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'number_of_passenger_seats':
          result.numberOfPassengerSeats = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image_urls':
          result.imageUrls.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'vehicle_make':
          result.vehicleMake = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vehicle_model':
          result.vehicleModel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vehicle_model_year':
          result.vehicleModelYear = serializers.deserialize(value,
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
  final String? vehicleRegistration;
  @override
  final int? numberOfPassengerSeats;
  @override
  final BuiltList<String>? imageUrls;
  @override
  final String? vehicleMake;
  @override
  final String? vehicleModel;
  @override
  final String? vehicleModelYear;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VehiclesRecord([void Function(VehiclesRecordBuilder)? updates]) =>
      (new VehiclesRecordBuilder()..update(updates)).build();

  _$VehiclesRecord._(
      {this.vehicleRegistration,
      this.numberOfPassengerSeats,
      this.imageUrls,
      this.vehicleMake,
      this.vehicleModel,
      this.vehicleModelYear,
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
        vehicleRegistration == other.vehicleRegistration &&
        numberOfPassengerSeats == other.numberOfPassengerSeats &&
        imageUrls == other.imageUrls &&
        vehicleMake == other.vehicleMake &&
        vehicleModel == other.vehicleModel &&
        vehicleModelYear == other.vehicleModelYear &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, vehicleRegistration.hashCode),
                            numberOfPassengerSeats.hashCode),
                        imageUrls.hashCode),
                    vehicleMake.hashCode),
                vehicleModel.hashCode),
            vehicleModelYear.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VehiclesRecord')
          ..add('vehicleRegistration', vehicleRegistration)
          ..add('numberOfPassengerSeats', numberOfPassengerSeats)
          ..add('imageUrls', imageUrls)
          ..add('vehicleMake', vehicleMake)
          ..add('vehicleModel', vehicleModel)
          ..add('vehicleModelYear', vehicleModelYear)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VehiclesRecordBuilder
    implements Builder<VehiclesRecord, VehiclesRecordBuilder> {
  _$VehiclesRecord? _$v;

  String? _vehicleRegistration;
  String? get vehicleRegistration => _$this._vehicleRegistration;
  set vehicleRegistration(String? vehicleRegistration) =>
      _$this._vehicleRegistration = vehicleRegistration;

  int? _numberOfPassengerSeats;
  int? get numberOfPassengerSeats => _$this._numberOfPassengerSeats;
  set numberOfPassengerSeats(int? numberOfPassengerSeats) =>
      _$this._numberOfPassengerSeats = numberOfPassengerSeats;

  ListBuilder<String>? _imageUrls;
  ListBuilder<String> get imageUrls =>
      _$this._imageUrls ??= new ListBuilder<String>();
  set imageUrls(ListBuilder<String>? imageUrls) =>
      _$this._imageUrls = imageUrls;

  String? _vehicleMake;
  String? get vehicleMake => _$this._vehicleMake;
  set vehicleMake(String? vehicleMake) => _$this._vehicleMake = vehicleMake;

  String? _vehicleModel;
  String? get vehicleModel => _$this._vehicleModel;
  set vehicleModel(String? vehicleModel) => _$this._vehicleModel = vehicleModel;

  String? _vehicleModelYear;
  String? get vehicleModelYear => _$this._vehicleModelYear;
  set vehicleModelYear(String? vehicleModelYear) =>
      _$this._vehicleModelYear = vehicleModelYear;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VehiclesRecordBuilder() {
    VehiclesRecord._initializeBuilder(this);
  }

  VehiclesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vehicleRegistration = $v.vehicleRegistration;
      _numberOfPassengerSeats = $v.numberOfPassengerSeats;
      _imageUrls = $v.imageUrls?.toBuilder();
      _vehicleMake = $v.vehicleMake;
      _vehicleModel = $v.vehicleModel;
      _vehicleModelYear = $v.vehicleModelYear;
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
    _$VehiclesRecord _$result;
    try {
      _$result = _$v ??
          new _$VehiclesRecord._(
              vehicleRegistration: vehicleRegistration,
              numberOfPassengerSeats: numberOfPassengerSeats,
              imageUrls: _imageUrls?.build(),
              vehicleMake: vehicleMake,
              vehicleModel: vehicleModel,
              vehicleModelYear: vehicleModelYear,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imageUrls';
        _imageUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VehiclesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
