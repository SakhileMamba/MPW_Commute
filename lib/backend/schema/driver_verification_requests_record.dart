import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'driver_verification_requests_record.g.dart';

abstract class DriverVerificationRequestsRecord
    implements
        Built<DriverVerificationRequestsRecord,
            DriverVerificationRequestsRecordBuilder> {
  static Serializer<DriverVerificationRequestsRecord> get serializer =>
      _$driverVerificationRequestsRecordSerializer;

  @BuiltValueField(wireName: 'request_driver_ref')
  DocumentReference? get requestDriverRef;

  @BuiltValueField(wireName: 'request_datetime')
  DateTime? get requestDatetime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          DriverVerificationRequestsRecordBuilder builder) =>
      builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('driver_verification_requests');

  static Stream<DriverVerificationRequestsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DriverVerificationRequestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DriverVerificationRequestsRecord._();
  factory DriverVerificationRequestsRecord(
          [void Function(DriverVerificationRequestsRecordBuilder) updates]) =
      _$DriverVerificationRequestsRecord;

  static DriverVerificationRequestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDriverVerificationRequestsRecordData({
  DocumentReference? requestDriverRef,
  DateTime? requestDatetime,
}) {
  final firestoreData = serializers.toFirestore(
    DriverVerificationRequestsRecord.serializer,
    DriverVerificationRequestsRecord(
      (d) => d
        ..requestDriverRef = requestDriverRef
        ..requestDatetime = requestDatetime,
    ),
  );

  return firestoreData;
}
