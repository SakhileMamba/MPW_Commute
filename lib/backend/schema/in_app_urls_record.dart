import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'in_app_urls_record.g.dart';

abstract class InAppUrlsRecord
    implements Built<InAppUrlsRecord, InAppUrlsRecordBuilder> {
  static Serializer<InAppUrlsRecord> get serializer =>
      _$inAppUrlsRecordSerializer;

  String? get url;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(InAppUrlsRecordBuilder builder) =>
      builder..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('in_app_urls');

  static Stream<InAppUrlsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InAppUrlsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InAppUrlsRecord._();
  factory InAppUrlsRecord([void Function(InAppUrlsRecordBuilder) updates]) =
      _$InAppUrlsRecord;

  static InAppUrlsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInAppUrlsRecordData({
  String? url,
}) {
  final firestoreData = serializers.toFirestore(
    InAppUrlsRecord.serializer,
    InAppUrlsRecord(
      (i) => i..url = url,
    ),
  );

  return firestoreData;
}
