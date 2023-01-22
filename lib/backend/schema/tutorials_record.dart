import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tutorials_record.g.dart';

abstract class TutorialsRecord
    implements Built<TutorialsRecord, TutorialsRecordBuilder> {
  static Serializer<TutorialsRecord> get serializer =>
      _$tutorialsRecordSerializer;

  @BuiltValueField(wireName: 'date_added')
  DateTime? get dateAdded;

  @BuiltValueField(wireName: 'video_title')
  String? get videoTitle;

  @BuiltValueField(wireName: 'video_order')
  int? get videoOrder;

  @BuiltValueField(wireName: 'video_youtube_url')
  String? get videoYoutubeUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TutorialsRecordBuilder builder) => builder
    ..videoTitle = ''
    ..videoOrder = 0
    ..videoYoutubeUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tutorials');

  static Stream<TutorialsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TutorialsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TutorialsRecord._();
  factory TutorialsRecord([void Function(TutorialsRecordBuilder) updates]) =
      _$TutorialsRecord;

  static TutorialsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTutorialsRecordData({
  DateTime? dateAdded,
  String? videoTitle,
  int? videoOrder,
  String? videoYoutubeUrl,
}) {
  final firestoreData = serializers.toFirestore(
    TutorialsRecord.serializer,
    TutorialsRecord(
      (t) => t
        ..dateAdded = dateAdded
        ..videoTitle = videoTitle
        ..videoOrder = videoOrder
        ..videoYoutubeUrl = videoYoutubeUrl,
    ),
  );

  return firestoreData;
}
