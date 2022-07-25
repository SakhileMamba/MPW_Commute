import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vehicles_record.g.dart';

abstract class VehiclesRecord
    implements Built<VehiclesRecord, VehiclesRecordBuilder> {
  static Serializer<VehiclesRecord> get serializer =>
      _$vehiclesRecordSerializer;

  @BuiltValueField(wireName: 'registration_number')
  String? get registrationNumber;

  @BuiltValueField(wireName: 'number_of_passenger_seats')
  int? get numberOfPassengerSeats;

  @BuiltValueField(wireName: 'image_URL')
  String? get imageURL;

  String? get make;

  String? get model;

  String? get year;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(VehiclesRecordBuilder builder) => builder
    ..registrationNumber = ''
    ..numberOfPassengerSeats = 0
    ..imageURL = ''
    ..make = ''
    ..model = ''
    ..year = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('vehicles')
          : FirebaseFirestore.instance.collectionGroup('vehicles');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('vehicles').doc();

  static Stream<VehiclesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VehiclesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VehiclesRecord._();
  factory VehiclesRecord([void Function(VehiclesRecordBuilder) updates]) =
      _$VehiclesRecord;

  static VehiclesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVehiclesRecordData({
  String? registrationNumber,
  int? numberOfPassengerSeats,
  String? imageURL,
  String? make,
  String? model,
  String? year,
}) {
  final firestoreData = serializers.toFirestore(
    VehiclesRecord.serializer,
    VehiclesRecord(
      (v) => v
        ..registrationNumber = registrationNumber
        ..numberOfPassengerSeats = numberOfPassengerSeats
        ..imageURL = imageURL
        ..make = make
        ..model = model
        ..year = year,
    ),
  );

  return firestoreData;
}
