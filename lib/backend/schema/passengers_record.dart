import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'passengers_record.g.dart';

abstract class PassengersRecord
    implements Built<PassengersRecord, PassengersRecordBuilder> {
  static Serializer<PassengersRecord> get serializer =>
      _$passengersRecordSerializer;

  @BuiltValueField(wireName: 'passenger_account')
  DocumentReference? get passengerAccount;

  bool? get accepted;

  @BuiltValueField(wireName: 'commute_datetime')
  DateTime? get commuteDatetime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PassengersRecordBuilder builder) =>
      builder..accepted = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('passengers')
          : FirebaseFirestore.instance.collectionGroup('passengers');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('passengers').doc();

  static Stream<PassengersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PassengersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PassengersRecord._();
  factory PassengersRecord([void Function(PassengersRecordBuilder) updates]) =
      _$PassengersRecord;

  static PassengersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPassengersRecordData({
  DocumentReference? passengerAccount,
  bool? accepted,
  DateTime? commuteDatetime,
}) {
  final firestoreData = serializers.toFirestore(
    PassengersRecord.serializer,
    PassengersRecord(
      (p) => p
        ..passengerAccount = passengerAccount
        ..accepted = accepted
        ..commuteDatetime = commuteDatetime,
    ),
  );

  return firestoreData;
}
