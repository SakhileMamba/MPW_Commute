import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'verification_requests_record.g.dart';

abstract class VerificationRequestsRecord
    implements
        Built<VerificationRequestsRecord, VerificationRequestsRecordBuilder> {
  static Serializer<VerificationRequestsRecord> get serializer =>
      _$verificationRequestsRecordSerializer;

  @BuiltValueField(wireName: 'request_user_ref')
  DocumentReference? get requestUserRef;

  @BuiltValueField(wireName: 'request_datetime')
  DateTime? get requestDatetime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VerificationRequestsRecordBuilder builder) =>
      builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('verification_requests');

  static Stream<VerificationRequestsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VerificationRequestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VerificationRequestsRecord._();
  factory VerificationRequestsRecord(
          [void Function(VerificationRequestsRecordBuilder) updates]) =
      _$VerificationRequestsRecord;

  static VerificationRequestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVerificationRequestsRecordData({
  DocumentReference? requestUserRef,
  DateTime? requestDatetime,
}) {
  final firestoreData = serializers.toFirestore(
    VerificationRequestsRecord.serializer,
    VerificationRequestsRecord(
      (v) => v
        ..requestUserRef = requestUserRef
        ..requestDatetime = requestDatetime,
    ),
  );

  return firestoreData;
}
