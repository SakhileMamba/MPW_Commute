import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'display_surname')
  String? get displaySurname;

  @BuiltValueField(wireName: 'national_id')
  String? get nationalId;

  @BuiltValueField(wireName: 'national_id_photo_url')
  String? get nationalIdPhotoUrl;

  @BuiltValueField(wireName: 'verified_user')
  bool? get verifiedUser;

  String? get gender;

  double? get rating;

  @BuiltValueField(wireName: 'birth_date')
  DateTime? get birthDate;

  @BuiltValueField(wireName: 'driver_license_number')
  String? get driverLicenseNumber;

  @BuiltValueField(wireName: 'driver_license_photo_path')
  String? get driverLicensePhotoPath;

  @BuiltValueField(wireName: 'verified_driver')
  bool? get verifiedDriver;

  @BuiltValueField(wireName: 'national_ID_verified')
  bool? get nationalIDVerified;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..displaySurname = ''
    ..nationalId = ''
    ..nationalIdPhotoUrl = ''
    ..verifiedUser = false
    ..gender = ''
    ..rating = 0.0
    ..driverLicenseNumber = ''
    ..driverLicensePhotoPath = ''
    ..verifiedDriver = false
    ..nationalIDVerified = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? displaySurname,
  String? nationalId,
  String? nationalIdPhotoUrl,
  bool? verifiedUser,
  String? gender,
  double? rating,
  DateTime? birthDate,
  String? driverLicenseNumber,
  String? driverLicensePhotoPath,
  bool? verifiedDriver,
  bool? nationalIDVerified,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..displaySurname = displaySurname
        ..nationalId = nationalId
        ..nationalIdPhotoUrl = nationalIdPhotoUrl
        ..verifiedUser = verifiedUser
        ..gender = gender
        ..rating = rating
        ..birthDate = birthDate
        ..driverLicenseNumber = driverLicenseNumber
        ..driverLicensePhotoPath = driverLicensePhotoPath
        ..verifiedDriver = verifiedDriver
        ..nationalIDVerified = nationalIDVerified,
    ),
  );

  return firestoreData;
}
