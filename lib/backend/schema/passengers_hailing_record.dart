import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'passengers_hailing_record.g.dart';

abstract class PassengersHailingRecord
    implements Built<PassengersHailingRecord, PassengersHailingRecordBuilder> {
  static Serializer<PassengersHailingRecord> get serializer =>
      _$passengersHailingRecordSerializer;

  @BuiltValueField(wireName: 'departure_datetime')
  DateTime? get departureDatetime;

  DocumentReference? get hailingPassenger;

  bool? get archived;

  LatlngReverseGeocodingStruct get originReversedGeocoded;

  LatlngReverseGeocodingStruct get destinationReversedGeocoded;

  @BuiltValueField(wireName: 'created_datetime')
  DateTime? get createdDatetime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PassengersHailingRecordBuilder builder) =>
      builder
        ..archived = false
        ..originReversedGeocoded = LatlngReverseGeocodingStructBuilder()
        ..destinationReversedGeocoded = LatlngReverseGeocodingStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('passengers_hailing');

  static Stream<PassengersHailingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PassengersHailingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PassengersHailingRecord._();
  factory PassengersHailingRecord(
          [void Function(PassengersHailingRecordBuilder) updates]) =
      _$PassengersHailingRecord;

  static PassengersHailingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPassengersHailingRecordData({
  DateTime? departureDatetime,
  DocumentReference? hailingPassenger,
  bool? archived,
  LatlngReverseGeocodingStruct? originReversedGeocoded,
  LatlngReverseGeocodingStruct? destinationReversedGeocoded,
  DateTime? createdDatetime,
}) {
  final firestoreData = serializers.toFirestore(
    PassengersHailingRecord.serializer,
    PassengersHailingRecord(
      (p) => p
        ..departureDatetime = departureDatetime
        ..hailingPassenger = hailingPassenger
        ..archived = archived
        ..originReversedGeocoded = LatlngReverseGeocodingStructBuilder()
        ..destinationReversedGeocoded = LatlngReverseGeocodingStructBuilder()
        ..createdDatetime = createdDatetime,
    ),
  );

  // Handle nested data for "originReversedGeocoded" field.
  addLatlngReverseGeocodingStructData(
      firestoreData, originReversedGeocoded, 'originReversedGeocoded');

  // Handle nested data for "destinationReversedGeocoded" field.
  addLatlngReverseGeocodingStructData(firestoreData,
      destinationReversedGeocoded, 'destinationReversedGeocoded');

  return firestoreData;
}
