import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'passengers_hailing_record.g.dart';

abstract class PassengersHailingRecord
    implements Built<PassengersHailingRecord, PassengersHailingRecordBuilder> {
  static Serializer<PassengersHailingRecord> get serializer =>
      _$passengersHailingRecordSerializer;

  String? get origin;

  String? get destination;

  @BuiltValueField(wireName: 'departure_datetime')
  DateTime? get departureDatetime;

  @BuiltValueField(wireName: 'origin_address')
  String? get originAddress;

  @BuiltValueField(wireName: 'destination_address')
  String? get destinationAddress;

  DocumentReference? get hailingPassenger;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PassengersHailingRecordBuilder builder) =>
      builder
        ..origin = ''
        ..destination = ''
        ..originAddress = ''
        ..destinationAddress = '';

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
  String? origin,
  String? destination,
  DateTime? departureDatetime,
  String? originAddress,
  String? destinationAddress,
  DocumentReference? hailingPassenger,
}) {
  final firestoreData = serializers.toFirestore(
    PassengersHailingRecord.serializer,
    PassengersHailingRecord(
      (p) => p
        ..origin = origin
        ..destination = destination
        ..departureDatetime = departureDatetime
        ..originAddress = originAddress
        ..destinationAddress = destinationAddress
        ..hailingPassenger = hailingPassenger,
    ),
  );

  return firestoreData;
}
