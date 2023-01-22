import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'latlng_reverse_geocoding_struct.g.dart';

abstract class LatlngReverseGeocodingStruct
    implements
        Built<LatlngReverseGeocodingStruct,
            LatlngReverseGeocodingStructBuilder> {
  static Serializer<LatlngReverseGeocodingStruct> get serializer =>
      _$latlngReverseGeocodingStructSerializer;

  String? get neighborhood;

  String? get locality;

  String? get sublocality;

  @BuiltValueField(wireName: 'sublocality_level_1')
  String? get sublocalityLevel1;

  @BuiltValueField(wireName: 'sublocality_level_2')
  String? get sublocalityLevel2;

  @BuiltValueField(wireName: 'sublocality_level_3')
  String? get sublocalityLevel3;

  @BuiltValueField(wireName: 'sublocality_level_4')
  String? get sublocalityLevel4;

  @BuiltValueField(wireName: 'sublocality_level_5')
  String? get sublocalityLevel5;

  @BuiltValueField(wireName: 'administrative_area_level_1')
  String? get administrativeAreaLevel1;

  @BuiltValueField(wireName: 'administrative_area_level_2')
  String? get administrativeAreaLevel2;

  @BuiltValueField(wireName: 'administrative_area_level_3')
  String? get administrativeAreaLevel3;

  @BuiltValueField(wireName: 'administrative_area_level_4')
  String? get administrativeAreaLevel4;

  @BuiltValueField(wireName: 'administrative_area_level_5')
  String? get administrativeAreaLevel5;

  @BuiltValueField(wireName: 'administrative_area_level_6')
  String? get administrativeAreaLevel6;

  @BuiltValueField(wireName: 'administrative_area_level_7')
  String? get administrativeAreaLevel7;

  String? get country;

  @BuiltValueField(wireName: 'postal_code')
  String? get postalCode;

  @BuiltValueField(wireName: 'postal_code_prefix')
  String? get postalCodePrefix;

  @BuiltValueField(wireName: 'postal_town')
  String? get postalTown;

  LatLng? get latlng;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(LatlngReverseGeocodingStructBuilder builder) =>
      builder
        ..neighborhood = ''
        ..locality = ''
        ..sublocality = ''
        ..sublocalityLevel1 = ''
        ..sublocalityLevel2 = ''
        ..sublocalityLevel3 = ''
        ..sublocalityLevel4 = ''
        ..sublocalityLevel5 = ''
        ..administrativeAreaLevel1 = ''
        ..administrativeAreaLevel2 = ''
        ..administrativeAreaLevel3 = ''
        ..administrativeAreaLevel4 = ''
        ..administrativeAreaLevel5 = ''
        ..administrativeAreaLevel6 = ''
        ..administrativeAreaLevel7 = ''
        ..country = ''
        ..postalCode = ''
        ..postalCodePrefix = ''
        ..postalTown = ''
        ..firestoreUtilData = FirestoreUtilData();

  LatlngReverseGeocodingStruct._();
  factory LatlngReverseGeocodingStruct(
          [void Function(LatlngReverseGeocodingStructBuilder) updates]) =
      _$LatlngReverseGeocodingStruct;
}

LatlngReverseGeocodingStruct createLatlngReverseGeocodingStruct({
  String? neighborhood,
  String? locality,
  String? sublocality,
  String? sublocalityLevel1,
  String? sublocalityLevel2,
  String? sublocalityLevel3,
  String? sublocalityLevel4,
  String? sublocalityLevel5,
  String? administrativeAreaLevel1,
  String? administrativeAreaLevel2,
  String? administrativeAreaLevel3,
  String? administrativeAreaLevel4,
  String? administrativeAreaLevel5,
  String? administrativeAreaLevel6,
  String? administrativeAreaLevel7,
  String? country,
  String? postalCode,
  String? postalCodePrefix,
  String? postalTown,
  LatLng? latlng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LatlngReverseGeocodingStruct(
      (l) => l
        ..neighborhood = neighborhood
        ..locality = locality
        ..sublocality = sublocality
        ..sublocalityLevel1 = sublocalityLevel1
        ..sublocalityLevel2 = sublocalityLevel2
        ..sublocalityLevel3 = sublocalityLevel3
        ..sublocalityLevel4 = sublocalityLevel4
        ..sublocalityLevel5 = sublocalityLevel5
        ..administrativeAreaLevel1 = administrativeAreaLevel1
        ..administrativeAreaLevel2 = administrativeAreaLevel2
        ..administrativeAreaLevel3 = administrativeAreaLevel3
        ..administrativeAreaLevel4 = administrativeAreaLevel4
        ..administrativeAreaLevel5 = administrativeAreaLevel5
        ..administrativeAreaLevel6 = administrativeAreaLevel6
        ..administrativeAreaLevel7 = administrativeAreaLevel7
        ..country = country
        ..postalCode = postalCode
        ..postalCodePrefix = postalCodePrefix
        ..postalTown = postalTown
        ..latlng = latlng
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

LatlngReverseGeocodingStruct? updateLatlngReverseGeocodingStruct(
  LatlngReverseGeocodingStruct? latlngReverseGeocoding, {
  bool clearUnsetFields = true,
}) =>
    latlngReverseGeocoding != null
        ? (latlngReverseGeocoding.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addLatlngReverseGeocodingStructData(
  Map<String, dynamic> firestoreData,
  LatlngReverseGeocodingStruct? latlngReverseGeocoding,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (latlngReverseGeocoding == null) {
    return;
  }
  if (latlngReverseGeocoding.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue &&
      latlngReverseGeocoding.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final latlngReverseGeocodingData = getLatlngReverseGeocodingFirestoreData(
      latlngReverseGeocoding, forFieldValue);
  final nestedData =
      latlngReverseGeocodingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = latlngReverseGeocoding.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getLatlngReverseGeocodingFirestoreData(
  LatlngReverseGeocodingStruct? latlngReverseGeocoding, [
  bool forFieldValue = false,
]) {
  if (latlngReverseGeocoding == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      LatlngReverseGeocodingStruct.serializer, latlngReverseGeocoding);

  // Add any Firestore field values
  latlngReverseGeocoding.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLatlngReverseGeocodingListFirestoreData(
  List<LatlngReverseGeocodingStruct>? latlngReverseGeocodings,
) =>
    latlngReverseGeocodings
        ?.map((l) => getLatlngReverseGeocodingFirestoreData(l, true))
        .toList() ??
    [];
