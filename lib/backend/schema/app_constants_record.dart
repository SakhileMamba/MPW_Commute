import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'app_constants_record.g.dart';

abstract class AppConstantsRecord
    implements Built<AppConstantsRecord, AppConstantsRecordBuilder> {
  static Serializer<AppConstantsRecord> get serializer =>
      _$appConstantsRecordSerializer;

  @BuiltValueField(wireName: 'free_app')
  bool? get freeApp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AppConstantsRecordBuilder builder) =>
      builder..freeApp = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_constants');

  static Stream<AppConstantsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AppConstantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AppConstantsRecord._();
  factory AppConstantsRecord(
          [void Function(AppConstantsRecordBuilder) updates]) =
      _$AppConstantsRecord;

  static AppConstantsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAppConstantsRecordData({
  bool? freeApp,
}) {
  final firestoreData = serializers.toFirestore(
    AppConstantsRecord.serializer,
    AppConstantsRecord(
      (a) => a..freeApp = freeApp,
    ),
  );

  return firestoreData;
}
