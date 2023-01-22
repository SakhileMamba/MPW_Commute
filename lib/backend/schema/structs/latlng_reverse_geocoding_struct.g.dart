// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latlng_reverse_geocoding_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LatlngReverseGeocodingStruct>
    _$latlngReverseGeocodingStructSerializer =
    new _$LatlngReverseGeocodingStructSerializer();

class _$LatlngReverseGeocodingStructSerializer
    implements StructuredSerializer<LatlngReverseGeocodingStruct> {
  @override
  final Iterable<Type> types = const [
    LatlngReverseGeocodingStruct,
    _$LatlngReverseGeocodingStruct
  ];
  @override
  final String wireName = 'LatlngReverseGeocodingStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LatlngReverseGeocodingStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.neighborhood;
    if (value != null) {
      result
        ..add('neighborhood')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locality;
    if (value != null) {
      result
        ..add('locality')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sublocality;
    if (value != null) {
      result
        ..add('sublocality')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sublocalityLevel1;
    if (value != null) {
      result
        ..add('sublocality_level_1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sublocalityLevel2;
    if (value != null) {
      result
        ..add('sublocality_level_2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sublocalityLevel3;
    if (value != null) {
      result
        ..add('sublocality_level_3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sublocalityLevel4;
    if (value != null) {
      result
        ..add('sublocality_level_4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sublocalityLevel5;
    if (value != null) {
      result
        ..add('sublocality_level_5')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.administrativeAreaLevel1;
    if (value != null) {
      result
        ..add('administrative_area_level_1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.administrativeAreaLevel2;
    if (value != null) {
      result
        ..add('administrative_area_level_2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.administrativeAreaLevel3;
    if (value != null) {
      result
        ..add('administrative_area_level_3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.administrativeAreaLevel4;
    if (value != null) {
      result
        ..add('administrative_area_level_4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.administrativeAreaLevel5;
    if (value != null) {
      result
        ..add('administrative_area_level_5')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.administrativeAreaLevel6;
    if (value != null) {
      result
        ..add('administrative_area_level_6')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.administrativeAreaLevel7;
    if (value != null) {
      result
        ..add('administrative_area_level_7')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postalCode;
    if (value != null) {
      result
        ..add('postal_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postalCodePrefix;
    if (value != null) {
      result
        ..add('postal_code_prefix')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postalTown;
    if (value != null) {
      result
        ..add('postal_town')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.latlng;
    if (value != null) {
      result
        ..add('latlng')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    return result;
  }

  @override
  LatlngReverseGeocodingStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LatlngReverseGeocodingStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'neighborhood':
          result.neighborhood = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'locality':
          result.locality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sublocality':
          result.sublocality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sublocality_level_1':
          result.sublocalityLevel1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sublocality_level_2':
          result.sublocalityLevel2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sublocality_level_3':
          result.sublocalityLevel3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sublocality_level_4':
          result.sublocalityLevel4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sublocality_level_5':
          result.sublocalityLevel5 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'administrative_area_level_1':
          result.administrativeAreaLevel1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'administrative_area_level_2':
          result.administrativeAreaLevel2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'administrative_area_level_3':
          result.administrativeAreaLevel3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'administrative_area_level_4':
          result.administrativeAreaLevel4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'administrative_area_level_5':
          result.administrativeAreaLevel5 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'administrative_area_level_6':
          result.administrativeAreaLevel6 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'administrative_area_level_7':
          result.administrativeAreaLevel7 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postal_code':
          result.postalCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postal_code_prefix':
          result.postalCodePrefix = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postal_town':
          result.postalTown = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'latlng':
          result.latlng = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$LatlngReverseGeocodingStruct extends LatlngReverseGeocodingStruct {
  @override
  final String? neighborhood;
  @override
  final String? locality;
  @override
  final String? sublocality;
  @override
  final String? sublocalityLevel1;
  @override
  final String? sublocalityLevel2;
  @override
  final String? sublocalityLevel3;
  @override
  final String? sublocalityLevel4;
  @override
  final String? sublocalityLevel5;
  @override
  final String? administrativeAreaLevel1;
  @override
  final String? administrativeAreaLevel2;
  @override
  final String? administrativeAreaLevel3;
  @override
  final String? administrativeAreaLevel4;
  @override
  final String? administrativeAreaLevel5;
  @override
  final String? administrativeAreaLevel6;
  @override
  final String? administrativeAreaLevel7;
  @override
  final String? country;
  @override
  final String? postalCode;
  @override
  final String? postalCodePrefix;
  @override
  final String? postalTown;
  @override
  final LatLng? latlng;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$LatlngReverseGeocodingStruct(
          [void Function(LatlngReverseGeocodingStructBuilder)? updates]) =>
      (new LatlngReverseGeocodingStructBuilder()..update(updates))._build();

  _$LatlngReverseGeocodingStruct._(
      {this.neighborhood,
      this.locality,
      this.sublocality,
      this.sublocalityLevel1,
      this.sublocalityLevel2,
      this.sublocalityLevel3,
      this.sublocalityLevel4,
      this.sublocalityLevel5,
      this.administrativeAreaLevel1,
      this.administrativeAreaLevel2,
      this.administrativeAreaLevel3,
      this.administrativeAreaLevel4,
      this.administrativeAreaLevel5,
      this.administrativeAreaLevel6,
      this.administrativeAreaLevel7,
      this.country,
      this.postalCode,
      this.postalCodePrefix,
      this.postalTown,
      this.latlng,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(firestoreUtilData,
        r'LatlngReverseGeocodingStruct', 'firestoreUtilData');
  }

  @override
  LatlngReverseGeocodingStruct rebuild(
          void Function(LatlngReverseGeocodingStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LatlngReverseGeocodingStructBuilder toBuilder() =>
      new LatlngReverseGeocodingStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LatlngReverseGeocodingStruct &&
        neighborhood == other.neighborhood &&
        locality == other.locality &&
        sublocality == other.sublocality &&
        sublocalityLevel1 == other.sublocalityLevel1 &&
        sublocalityLevel2 == other.sublocalityLevel2 &&
        sublocalityLevel3 == other.sublocalityLevel3 &&
        sublocalityLevel4 == other.sublocalityLevel4 &&
        sublocalityLevel5 == other.sublocalityLevel5 &&
        administrativeAreaLevel1 == other.administrativeAreaLevel1 &&
        administrativeAreaLevel2 == other.administrativeAreaLevel2 &&
        administrativeAreaLevel3 == other.administrativeAreaLevel3 &&
        administrativeAreaLevel4 == other.administrativeAreaLevel4 &&
        administrativeAreaLevel5 == other.administrativeAreaLevel5 &&
        administrativeAreaLevel6 == other.administrativeAreaLevel6 &&
        administrativeAreaLevel7 == other.administrativeAreaLevel7 &&
        country == other.country &&
        postalCode == other.postalCode &&
        postalCodePrefix == other.postalCodePrefix &&
        postalTown == other.postalTown &&
        latlng == other.latlng &&
        firestoreUtilData == other.firestoreUtilData;
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
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                $jc(
                                                                                    $jc(
                                                                                        0,
                                                                                        neighborhood
                                                                                            .hashCode),
                                                                                    locality
                                                                                        .hashCode),
                                                                                sublocality
                                                                                    .hashCode),
                                                                            sublocalityLevel1
                                                                                .hashCode),
                                                                        sublocalityLevel2
                                                                            .hashCode),
                                                                    sublocalityLevel3
                                                                        .hashCode),
                                                                sublocalityLevel4
                                                                    .hashCode),
                                                            sublocalityLevel5
                                                                .hashCode),
                                                        administrativeAreaLevel1
                                                            .hashCode),
                                                    administrativeAreaLevel2
                                                        .hashCode),
                                                administrativeAreaLevel3
                                                    .hashCode),
                                            administrativeAreaLevel4.hashCode),
                                        administrativeAreaLevel5.hashCode),
                                    administrativeAreaLevel6.hashCode),
                                administrativeAreaLevel7.hashCode),
                            country.hashCode),
                        postalCode.hashCode),
                    postalCodePrefix.hashCode),
                postalTown.hashCode),
            latlng.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LatlngReverseGeocodingStruct')
          ..add('neighborhood', neighborhood)
          ..add('locality', locality)
          ..add('sublocality', sublocality)
          ..add('sublocalityLevel1', sublocalityLevel1)
          ..add('sublocalityLevel2', sublocalityLevel2)
          ..add('sublocalityLevel3', sublocalityLevel3)
          ..add('sublocalityLevel4', sublocalityLevel4)
          ..add('sublocalityLevel5', sublocalityLevel5)
          ..add('administrativeAreaLevel1', administrativeAreaLevel1)
          ..add('administrativeAreaLevel2', administrativeAreaLevel2)
          ..add('administrativeAreaLevel3', administrativeAreaLevel3)
          ..add('administrativeAreaLevel4', administrativeAreaLevel4)
          ..add('administrativeAreaLevel5', administrativeAreaLevel5)
          ..add('administrativeAreaLevel6', administrativeAreaLevel6)
          ..add('administrativeAreaLevel7', administrativeAreaLevel7)
          ..add('country', country)
          ..add('postalCode', postalCode)
          ..add('postalCodePrefix', postalCodePrefix)
          ..add('postalTown', postalTown)
          ..add('latlng', latlng)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class LatlngReverseGeocodingStructBuilder
    implements
        Builder<LatlngReverseGeocodingStruct,
            LatlngReverseGeocodingStructBuilder> {
  _$LatlngReverseGeocodingStruct? _$v;

  String? _neighborhood;
  String? get neighborhood => _$this._neighborhood;
  set neighborhood(String? neighborhood) => _$this._neighborhood = neighborhood;

  String? _locality;
  String? get locality => _$this._locality;
  set locality(String? locality) => _$this._locality = locality;

  String? _sublocality;
  String? get sublocality => _$this._sublocality;
  set sublocality(String? sublocality) => _$this._sublocality = sublocality;

  String? _sublocalityLevel1;
  String? get sublocalityLevel1 => _$this._sublocalityLevel1;
  set sublocalityLevel1(String? sublocalityLevel1) =>
      _$this._sublocalityLevel1 = sublocalityLevel1;

  String? _sublocalityLevel2;
  String? get sublocalityLevel2 => _$this._sublocalityLevel2;
  set sublocalityLevel2(String? sublocalityLevel2) =>
      _$this._sublocalityLevel2 = sublocalityLevel2;

  String? _sublocalityLevel3;
  String? get sublocalityLevel3 => _$this._sublocalityLevel3;
  set sublocalityLevel3(String? sublocalityLevel3) =>
      _$this._sublocalityLevel3 = sublocalityLevel3;

  String? _sublocalityLevel4;
  String? get sublocalityLevel4 => _$this._sublocalityLevel4;
  set sublocalityLevel4(String? sublocalityLevel4) =>
      _$this._sublocalityLevel4 = sublocalityLevel4;

  String? _sublocalityLevel5;
  String? get sublocalityLevel5 => _$this._sublocalityLevel5;
  set sublocalityLevel5(String? sublocalityLevel5) =>
      _$this._sublocalityLevel5 = sublocalityLevel5;

  String? _administrativeAreaLevel1;
  String? get administrativeAreaLevel1 => _$this._administrativeAreaLevel1;
  set administrativeAreaLevel1(String? administrativeAreaLevel1) =>
      _$this._administrativeAreaLevel1 = administrativeAreaLevel1;

  String? _administrativeAreaLevel2;
  String? get administrativeAreaLevel2 => _$this._administrativeAreaLevel2;
  set administrativeAreaLevel2(String? administrativeAreaLevel2) =>
      _$this._administrativeAreaLevel2 = administrativeAreaLevel2;

  String? _administrativeAreaLevel3;
  String? get administrativeAreaLevel3 => _$this._administrativeAreaLevel3;
  set administrativeAreaLevel3(String? administrativeAreaLevel3) =>
      _$this._administrativeAreaLevel3 = administrativeAreaLevel3;

  String? _administrativeAreaLevel4;
  String? get administrativeAreaLevel4 => _$this._administrativeAreaLevel4;
  set administrativeAreaLevel4(String? administrativeAreaLevel4) =>
      _$this._administrativeAreaLevel4 = administrativeAreaLevel4;

  String? _administrativeAreaLevel5;
  String? get administrativeAreaLevel5 => _$this._administrativeAreaLevel5;
  set administrativeAreaLevel5(String? administrativeAreaLevel5) =>
      _$this._administrativeAreaLevel5 = administrativeAreaLevel5;

  String? _administrativeAreaLevel6;
  String? get administrativeAreaLevel6 => _$this._administrativeAreaLevel6;
  set administrativeAreaLevel6(String? administrativeAreaLevel6) =>
      _$this._administrativeAreaLevel6 = administrativeAreaLevel6;

  String? _administrativeAreaLevel7;
  String? get administrativeAreaLevel7 => _$this._administrativeAreaLevel7;
  set administrativeAreaLevel7(String? administrativeAreaLevel7) =>
      _$this._administrativeAreaLevel7 = administrativeAreaLevel7;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _postalCode;
  String? get postalCode => _$this._postalCode;
  set postalCode(String? postalCode) => _$this._postalCode = postalCode;

  String? _postalCodePrefix;
  String? get postalCodePrefix => _$this._postalCodePrefix;
  set postalCodePrefix(String? postalCodePrefix) =>
      _$this._postalCodePrefix = postalCodePrefix;

  String? _postalTown;
  String? get postalTown => _$this._postalTown;
  set postalTown(String? postalTown) => _$this._postalTown = postalTown;

  LatLng? _latlng;
  LatLng? get latlng => _$this._latlng;
  set latlng(LatLng? latlng) => _$this._latlng = latlng;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  LatlngReverseGeocodingStructBuilder() {
    LatlngReverseGeocodingStruct._initializeBuilder(this);
  }

  LatlngReverseGeocodingStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _neighborhood = $v.neighborhood;
      _locality = $v.locality;
      _sublocality = $v.sublocality;
      _sublocalityLevel1 = $v.sublocalityLevel1;
      _sublocalityLevel2 = $v.sublocalityLevel2;
      _sublocalityLevel3 = $v.sublocalityLevel3;
      _sublocalityLevel4 = $v.sublocalityLevel4;
      _sublocalityLevel5 = $v.sublocalityLevel5;
      _administrativeAreaLevel1 = $v.administrativeAreaLevel1;
      _administrativeAreaLevel2 = $v.administrativeAreaLevel2;
      _administrativeAreaLevel3 = $v.administrativeAreaLevel3;
      _administrativeAreaLevel4 = $v.administrativeAreaLevel4;
      _administrativeAreaLevel5 = $v.administrativeAreaLevel5;
      _administrativeAreaLevel6 = $v.administrativeAreaLevel6;
      _administrativeAreaLevel7 = $v.administrativeAreaLevel7;
      _country = $v.country;
      _postalCode = $v.postalCode;
      _postalCodePrefix = $v.postalCodePrefix;
      _postalTown = $v.postalTown;
      _latlng = $v.latlng;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LatlngReverseGeocodingStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LatlngReverseGeocodingStruct;
  }

  @override
  void update(void Function(LatlngReverseGeocodingStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LatlngReverseGeocodingStruct build() => _build();

  _$LatlngReverseGeocodingStruct _build() {
    final _$result = _$v ??
        new _$LatlngReverseGeocodingStruct._(
            neighborhood: neighborhood,
            locality: locality,
            sublocality: sublocality,
            sublocalityLevel1: sublocalityLevel1,
            sublocalityLevel2: sublocalityLevel2,
            sublocalityLevel3: sublocalityLevel3,
            sublocalityLevel4: sublocalityLevel4,
            sublocalityLevel5: sublocalityLevel5,
            administrativeAreaLevel1: administrativeAreaLevel1,
            administrativeAreaLevel2: administrativeAreaLevel2,
            administrativeAreaLevel3: administrativeAreaLevel3,
            administrativeAreaLevel4: administrativeAreaLevel4,
            administrativeAreaLevel5: administrativeAreaLevel5,
            administrativeAreaLevel6: administrativeAreaLevel6,
            administrativeAreaLevel7: administrativeAreaLevel7,
            country: country,
            postalCode: postalCode,
            postalCodePrefix: postalCodePrefix,
            postalTown: postalTown,
            latlng: latlng,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'LatlngReverseGeocodingStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
