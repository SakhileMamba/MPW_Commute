import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'commutes_record.g.dart';

abstract class CommutesRecord
    implements Built<CommutesRecord, CommutesRecordBuilder> {
  static Serializer<CommutesRecord> get serializer =>
      _$commutesRecordSerializer;

  DocumentReference? get vehicle;

  @BuiltValueField(wireName: 'available_passenger_seats')
  int? get availablePassengerSeats;

  @BuiltValueField(wireName: 'price_per_seat')
  double? get pricePerSeat;

  DocumentReference? get driver;

  @BuiltValueField(wireName: 'departure_datetime')
  DateTime? get departureDatetime;

  double? get driversRating;

  String? get currency;

  bool? get archived;

  @BuiltValueField(wireName: 'applicant_list')
  BuiltList<DocumentReference>? get applicantList;

  LatlngReverseGeocodingStruct get originReversedGeocoded;

  LatlngReverseGeocodingStruct get destinationReversedGeocoded;

  @BuiltValueField(wireName: 'created_datetime')
  DateTime? get createdDatetime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CommutesRecordBuilder builder) => builder
    ..availablePassengerSeats = 0
    ..pricePerSeat = 0.0
    ..driversRating = 0.0
    ..currency = ''
    ..archived = false
    ..applicantList = ListBuilder()
    ..originReversedGeocoded = LatlngReverseGeocodingStructBuilder()
    ..destinationReversedGeocoded = LatlngReverseGeocodingStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commutes');

  static Stream<CommutesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommutesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CommutesRecord._();
  factory CommutesRecord([void Function(CommutesRecordBuilder) updates]) =
      _$CommutesRecord;

  static CommutesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommutesRecordData({
  DocumentReference? vehicle,
  int? availablePassengerSeats,
  double? pricePerSeat,
  DocumentReference? driver,
  DateTime? departureDatetime,
  double? driversRating,
  String? currency,
  bool? archived,
  LatlngReverseGeocodingStruct? originReversedGeocoded,
  LatlngReverseGeocodingStruct? destinationReversedGeocoded,
  DateTime? createdDatetime,
}) {
  final firestoreData = serializers.toFirestore(
    CommutesRecord.serializer,
    CommutesRecord(
      (c) => c
        ..vehicle = vehicle
        ..availablePassengerSeats = availablePassengerSeats
        ..pricePerSeat = pricePerSeat
        ..driver = driver
        ..departureDatetime = departureDatetime
        ..driversRating = driversRating
        ..currency = currency
        ..archived = archived
        ..applicantList = null
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
