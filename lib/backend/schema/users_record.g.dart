// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displaySurname;
    if (value != null) {
      result
        ..add('display_surname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nationalId;
    if (value != null) {
      result
        ..add('national_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nationalIdPhotoUrl;
    if (value != null) {
      result
        ..add('national_id_photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.verifiedUser;
    if (value != null) {
      result
        ..add('verified_user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.birthDate;
    if (value != null) {
      result
        ..add('birth_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.driverLicenseNumber;
    if (value != null) {
      result
        ..add('driver_license_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.driverLicensePhotoPath;
    if (value != null) {
      result
        ..add('driver_license_photo_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.verifiedDriver;
    if (value != null) {
      result
        ..add('verified_driver')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.nationalIDVerified;
    if (value != null) {
      result
        ..add('national_ID_verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.admin;
    if (value != null) {
      result
        ..add('admin')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.referrersCode;
    if (value != null) {
      result
        ..add('referrers_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountVerificationSent;
    if (value != null) {
      result
        ..add('account_verification_sent')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.licenseVerificationSent;
    if (value != null) {
      result
        ..add('license_verification_sent')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_surname':
          result.displaySurname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'national_id':
          result.nationalId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'national_id_photo_url':
          result.nationalIdPhotoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'verified_user':
          result.verifiedUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'birth_date':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'driver_license_number':
          result.driverLicenseNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'driver_license_photo_path':
          result.driverLicensePhotoPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'verified_driver':
          result.verifiedDriver = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'national_ID_verified':
          result.nationalIDVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'admin':
          result.admin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'referrers_code':
          result.referrersCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'account_verification_sent':
          result.accountVerificationSent = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'license_verification_sent':
          result.licenseVerificationSent = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? displaySurname;
  @override
  final String? nationalId;
  @override
  final String? nationalIdPhotoUrl;
  @override
  final bool? verifiedUser;
  @override
  final String? gender;
  @override
  final double? rating;
  @override
  final DateTime? birthDate;
  @override
  final String? driverLicenseNumber;
  @override
  final String? driverLicensePhotoPath;
  @override
  final bool? verifiedDriver;
  @override
  final bool? nationalIDVerified;
  @override
  final bool? admin;
  @override
  final String? referrersCode;
  @override
  final bool? accountVerificationSent;
  @override
  final bool? licenseVerificationSent;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.displaySurname,
      this.nationalId,
      this.nationalIdPhotoUrl,
      this.verifiedUser,
      this.gender,
      this.rating,
      this.birthDate,
      this.driverLicenseNumber,
      this.driverLicensePhotoPath,
      this.verifiedDriver,
      this.nationalIDVerified,
      this.admin,
      this.referrersCode,
      this.accountVerificationSent,
      this.licenseVerificationSent,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        displaySurname == other.displaySurname &&
        nationalId == other.nationalId &&
        nationalIdPhotoUrl == other.nationalIdPhotoUrl &&
        verifiedUser == other.verifiedUser &&
        gender == other.gender &&
        rating == other.rating &&
        birthDate == other.birthDate &&
        driverLicenseNumber == other.driverLicenseNumber &&
        driverLicensePhotoPath == other.driverLicensePhotoPath &&
        verifiedDriver == other.verifiedDriver &&
        nationalIDVerified == other.nationalIDVerified &&
        admin == other.admin &&
        referrersCode == other.referrersCode &&
        accountVerificationSent == other.accountVerificationSent &&
        licenseVerificationSent == other.licenseVerificationSent &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc(0, email.hashCode), displayName.hashCode), photoUrl.hashCode),
                                                                                uid.hashCode),
                                                                            createdTime.hashCode),
                                                                        phoneNumber.hashCode),
                                                                    displaySurname.hashCode),
                                                                nationalId.hashCode),
                                                            nationalIdPhotoUrl.hashCode),
                                                        verifiedUser.hashCode),
                                                    gender.hashCode),
                                                rating.hashCode),
                                            birthDate.hashCode),
                                        driverLicenseNumber.hashCode),
                                    driverLicensePhotoPath.hashCode),
                                verifiedDriver.hashCode),
                            nationalIDVerified.hashCode),
                        admin.hashCode),
                    referrersCode.hashCode),
                accountVerificationSent.hashCode),
            licenseVerificationSent.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('displaySurname', displaySurname)
          ..add('nationalId', nationalId)
          ..add('nationalIdPhotoUrl', nationalIdPhotoUrl)
          ..add('verifiedUser', verifiedUser)
          ..add('gender', gender)
          ..add('rating', rating)
          ..add('birthDate', birthDate)
          ..add('driverLicenseNumber', driverLicenseNumber)
          ..add('driverLicensePhotoPath', driverLicensePhotoPath)
          ..add('verifiedDriver', verifiedDriver)
          ..add('nationalIDVerified', nationalIDVerified)
          ..add('admin', admin)
          ..add('referrersCode', referrersCode)
          ..add('accountVerificationSent', accountVerificationSent)
          ..add('licenseVerificationSent', licenseVerificationSent)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _displaySurname;
  String? get displaySurname => _$this._displaySurname;
  set displaySurname(String? displaySurname) =>
      _$this._displaySurname = displaySurname;

  String? _nationalId;
  String? get nationalId => _$this._nationalId;
  set nationalId(String? nationalId) => _$this._nationalId = nationalId;

  String? _nationalIdPhotoUrl;
  String? get nationalIdPhotoUrl => _$this._nationalIdPhotoUrl;
  set nationalIdPhotoUrl(String? nationalIdPhotoUrl) =>
      _$this._nationalIdPhotoUrl = nationalIdPhotoUrl;

  bool? _verifiedUser;
  bool? get verifiedUser => _$this._verifiedUser;
  set verifiedUser(bool? verifiedUser) => _$this._verifiedUser = verifiedUser;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  DateTime? _birthDate;
  DateTime? get birthDate => _$this._birthDate;
  set birthDate(DateTime? birthDate) => _$this._birthDate = birthDate;

  String? _driverLicenseNumber;
  String? get driverLicenseNumber => _$this._driverLicenseNumber;
  set driverLicenseNumber(String? driverLicenseNumber) =>
      _$this._driverLicenseNumber = driverLicenseNumber;

  String? _driverLicensePhotoPath;
  String? get driverLicensePhotoPath => _$this._driverLicensePhotoPath;
  set driverLicensePhotoPath(String? driverLicensePhotoPath) =>
      _$this._driverLicensePhotoPath = driverLicensePhotoPath;

  bool? _verifiedDriver;
  bool? get verifiedDriver => _$this._verifiedDriver;
  set verifiedDriver(bool? verifiedDriver) =>
      _$this._verifiedDriver = verifiedDriver;

  bool? _nationalIDVerified;
  bool? get nationalIDVerified => _$this._nationalIDVerified;
  set nationalIDVerified(bool? nationalIDVerified) =>
      _$this._nationalIDVerified = nationalIDVerified;

  bool? _admin;
  bool? get admin => _$this._admin;
  set admin(bool? admin) => _$this._admin = admin;

  String? _referrersCode;
  String? get referrersCode => _$this._referrersCode;
  set referrersCode(String? referrersCode) =>
      _$this._referrersCode = referrersCode;

  bool? _accountVerificationSent;
  bool? get accountVerificationSent => _$this._accountVerificationSent;
  set accountVerificationSent(bool? accountVerificationSent) =>
      _$this._accountVerificationSent = accountVerificationSent;

  bool? _licenseVerificationSent;
  bool? get licenseVerificationSent => _$this._licenseVerificationSent;
  set licenseVerificationSent(bool? licenseVerificationSent) =>
      _$this._licenseVerificationSent = licenseVerificationSent;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _displaySurname = $v.displaySurname;
      _nationalId = $v.nationalId;
      _nationalIdPhotoUrl = $v.nationalIdPhotoUrl;
      _verifiedUser = $v.verifiedUser;
      _gender = $v.gender;
      _rating = $v.rating;
      _birthDate = $v.birthDate;
      _driverLicenseNumber = $v.driverLicenseNumber;
      _driverLicensePhotoPath = $v.driverLicensePhotoPath;
      _verifiedDriver = $v.verifiedDriver;
      _nationalIDVerified = $v.nationalIDVerified;
      _admin = $v.admin;
      _referrersCode = $v.referrersCode;
      _accountVerificationSent = $v.accountVerificationSent;
      _licenseVerificationSent = $v.licenseVerificationSent;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            displaySurname: displaySurname,
            nationalId: nationalId,
            nationalIdPhotoUrl: nationalIdPhotoUrl,
            verifiedUser: verifiedUser,
            gender: gender,
            rating: rating,
            birthDate: birthDate,
            driverLicenseNumber: driverLicenseNumber,
            driverLicensePhotoPath: driverLicensePhotoPath,
            verifiedDriver: verifiedDriver,
            nationalIDVerified: nationalIDVerified,
            admin: admin,
            referrersCode: referrersCode,
            accountVerificationSent: accountVerificationSent,
            licenseVerificationSent: licenseVerificationSent,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
