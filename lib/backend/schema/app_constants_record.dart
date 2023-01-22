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

  BuiltList<DocumentReference>? get notificationReferenceList;

  @BuiltValueField(wireName: 'privacy_policy_URL')
  String? get privacyPolicyURL;

  @BuiltValueField(wireName: 'terms_of_service_URL')
  String? get termsOfServiceURL;

  @BuiltValueField(wireName: 'push_notification_Image_URL')
  String? get pushNotificationImageURL;

  @BuiltValueField(wireName: 'useless_count')
  int? get uselessCount;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AppConstantsRecordBuilder builder) => builder
    ..freeApp = false
    ..notificationReferenceList = ListBuilder()
    ..privacyPolicyURL = ''
    ..termsOfServiceURL = ''
    ..pushNotificationImageURL = ''
    ..uselessCount = 0;

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
  String? privacyPolicyURL,
  String? termsOfServiceURL,
  String? pushNotificationImageURL,
  int? uselessCount,
}) {
  final firestoreData = serializers.toFirestore(
    AppConstantsRecord.serializer,
    AppConstantsRecord(
      (a) => a
        ..freeApp = freeApp
        ..notificationReferenceList = null
        ..privacyPolicyURL = privacyPolicyURL
        ..termsOfServiceURL = termsOfServiceURL
        ..pushNotificationImageURL = pushNotificationImageURL
        ..uselessCount = uselessCount,
    ),
  );

  return firestoreData;
}
