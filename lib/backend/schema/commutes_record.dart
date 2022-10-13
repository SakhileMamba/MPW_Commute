import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'commutes_record.g.dart';

abstract class CommutesRecord
    implements Built<CommutesRecord, CommutesRecordBuilder> {
  static Serializer<CommutesRecord> get serializer =>
      _$commutesRecordSerializer;

  String? get origin;

  String? get destination;

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

  @BuiltValueField(wireName: 'origin_address')
  String? get originAddress;

  @BuiltValueField(wireName: 'destination_address')
  String? get destinationAddress;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CommutesRecordBuilder builder) => builder
    ..origin = ''
    ..destination = ''
    ..availablePassengerSeats = 0
    ..pricePerSeat = 0.0
    ..driversRating = 0.0
    ..currency = ''
    ..originAddress = ''
    ..destinationAddress = '';

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
  String? origin,
  String? destination,
  DocumentReference? vehicle,
  int? availablePassengerSeats,
  double? pricePerSeat,
  DocumentReference? driver,
  DateTime? departureDatetime,
  double? driversRating,
  String? currency,
  String? originAddress,
  String? destinationAddress,
}) {
  final firestoreData = serializers.toFirestore(
    CommutesRecord.serializer,
    CommutesRecord(
      (c) => c
        ..origin = origin
        ..destination = destination
        ..vehicle = vehicle
        ..availablePassengerSeats = availablePassengerSeats
        ..pricePerSeat = pricePerSeat
        ..driver = driver
        ..departureDatetime = departureDatetime
        ..driversRating = driversRating
        ..currency = currency
        ..originAddress = originAddress
        ..destinationAddress = destinationAddress,
    ),
  );

  return firestoreData;
}
