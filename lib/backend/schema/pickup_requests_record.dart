import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pickup_requests_record.g.dart';

abstract class PickupRequestsRecord
    implements Built<PickupRequestsRecord, PickupRequestsRecordBuilder> {
  static Serializer<PickupRequestsRecord> get serializer =>
      _$pickupRequestsRecordSerializer;

  DocumentReference? get driver;

  DocumentReference? get vehicle;

  @BuiltValueField(wireName: 'available_seats')
  int? get availableSeats;

  @BuiltValueField(wireName: 'price_per_seat')
  double? get pricePerSeat;

  String? get currency;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PickupRequestsRecordBuilder builder) => builder
    ..availableSeats = 0
    ..pricePerSeat = 0.0
    ..currency = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pickup_requests')
          : FirebaseFirestore.instance.collectionGroup('pickup_requests');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('pickup_requests').doc();

  static Stream<PickupRequestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PickupRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PickupRequestsRecord._();
  factory PickupRequestsRecord(
          [void Function(PickupRequestsRecordBuilder) updates]) =
      _$PickupRequestsRecord;

  static PickupRequestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPickupRequestsRecordData({
  DocumentReference? driver,
  DocumentReference? vehicle,
  int? availableSeats,
  double? pricePerSeat,
  String? currency,
}) {
  final firestoreData = serializers.toFirestore(
    PickupRequestsRecord.serializer,
    PickupRequestsRecord(
      (p) => p
        ..driver = driver
        ..vehicle = vehicle
        ..availableSeats = availableSeats
        ..pricePerSeat = pricePerSeat
        ..currency = currency,
    ),
  );

  return firestoreData;
}
