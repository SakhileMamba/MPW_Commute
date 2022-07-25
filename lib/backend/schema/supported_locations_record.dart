import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'supported_locations_record.g.dart';

abstract class SupportedLocationsRecord
    implements
        Built<SupportedLocationsRecord, SupportedLocationsRecordBuilder> {
  static Serializer<SupportedLocationsRecord> get serializer =>
      _$supportedLocationsRecordSerializer;

  @BuiltValueField(wireName: 'EswatiniLocations')
  BuiltList<String>? get eswatiniLocations;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SupportedLocationsRecordBuilder builder) =>
      builder..eswatiniLocations = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SupportedLocations');

  static Stream<SupportedLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SupportedLocationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SupportedLocationsRecord._();
  factory SupportedLocationsRecord(
          [void Function(SupportedLocationsRecordBuilder) updates]) =
      _$SupportedLocationsRecord;

  static SupportedLocationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSupportedLocationsRecordData() {
  final firestoreData = serializers.toFirestore(
    SupportedLocationsRecord.serializer,
    SupportedLocationsRecord(
      (s) => s..eswatiniLocations = null,
    ),
  );

  return firestoreData;
}
