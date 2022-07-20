import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vehicles_record.g.dart';

abstract class VehiclesRecord
    implements Built<VehiclesRecord, VehiclesRecordBuilder> {
  static Serializer<VehiclesRecord> get serializer =>
      _$vehiclesRecordSerializer;

  @BuiltValueField(wireName: 'vehicle_registration')
  String? get vehicleRegistration;

  @BuiltValueField(wireName: 'number_of_passenger_seats')
  int? get numberOfPassengerSeats;

  @BuiltValueField(wireName: 'image_urls')
  BuiltList<String>? get imageUrls;

  @BuiltValueField(wireName: 'vehicle_make')
  String? get vehicleMake;

  @BuiltValueField(wireName: 'vehicle_model')
  String? get vehicleModel;

  @BuiltValueField(wireName: 'vehicle_model_year')
  String? get vehicleModelYear;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(VehiclesRecordBuilder builder) => builder
    ..vehicleRegistration = ''
    ..numberOfPassengerSeats = 0
    ..imageUrls = ListBuilder()
    ..vehicleMake = ''
    ..vehicleModel = ''
    ..vehicleModelYear = '';

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
  String? vehicleRegistration,
  int? numberOfPassengerSeats,
  String? vehicleMake,
  String? vehicleModel,
  String? vehicleModelYear,
}) =>
    serializers.toFirestore(
        VehiclesRecord.serializer,
        VehiclesRecord((v) => v
          ..vehicleRegistration = vehicleRegistration
          ..numberOfPassengerSeats = numberOfPassengerSeats
          ..imageUrls = null
          ..vehicleMake = vehicleMake
          ..vehicleModel = vehicleModel
          ..vehicleModelYear = vehicleModelYear));
