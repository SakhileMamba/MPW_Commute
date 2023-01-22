import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'announcements_record.g.dart';

abstract class AnnouncementsRecord
    implements Built<AnnouncementsRecord, AnnouncementsRecordBuilder> {
  static Serializer<AnnouncementsRecord> get serializer =>
      _$announcementsRecordSerializer;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get title;

  String? get message;

  @BuiltValueField(wireName: 'media_type')
  String? get mediaType;

  @BuiltValueField(wireName: 'media_URL')
  String? get mediaURL;

  BuiltList<DocumentReference>? get readers;

  bool? get archived;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AnnouncementsRecordBuilder builder) => builder
    ..title = ''
    ..message = ''
    ..mediaType = ''
    ..mediaURL = ''
    ..readers = ListBuilder()
    ..archived = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('announcements');

  static Stream<AnnouncementsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AnnouncementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AnnouncementsRecord._();
  factory AnnouncementsRecord(
          [void Function(AnnouncementsRecordBuilder) updates]) =
      _$AnnouncementsRecord;

  static AnnouncementsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAnnouncementsRecordData({
  DateTime? createdTime,
  String? title,
  String? message,
  String? mediaType,
  String? mediaURL,
  bool? archived,
}) {
  final firestoreData = serializers.toFirestore(
    AnnouncementsRecord.serializer,
    AnnouncementsRecord(
      (a) => a
        ..createdTime = createdTime
        ..title = title
        ..message = message
        ..mediaType = mediaType
        ..mediaURL = mediaURL
        ..readers = null
        ..archived = archived,
    ),
  );

  return firestoreData;
}
