// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_constants_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppConstantsRecord> _$appConstantsRecordSerializer =
    new _$AppConstantsRecordSerializer();

class _$AppConstantsRecordSerializer
    implements StructuredSerializer<AppConstantsRecord> {
  @override
  final Iterable<Type> types = const [AppConstantsRecord, _$AppConstantsRecord];
  @override
  final String wireName = 'AppConstantsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AppConstantsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.freeApp;
    if (value != null) {
      result
        ..add('free_app')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.notificationReferenceList;
    if (value != null) {
      result
        ..add('notificationReferenceList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.privacyPolicyURL;
    if (value != null) {
      result
        ..add('privacy_policy_URL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.termsOfServiceURL;
    if (value != null) {
      result
        ..add('terms_of_service_URL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pushNotificationImageURL;
    if (value != null) {
      result
        ..add('push_notification_Image_URL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uselessCount;
    if (value != null) {
      result
        ..add('useless_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  AppConstantsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppConstantsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'free_app':
          result.freeApp = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'notificationReferenceList':
          result.notificationReferenceList
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(DocumentReference,
                        const [const FullType.nullable(Object)])
                  ]))! as BuiltList<Object?>);
          break;
        case 'privacy_policy_URL':
          result.privacyPolicyURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'terms_of_service_URL':
          result.termsOfServiceURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'push_notification_Image_URL':
          result.pushNotificationImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'useless_count':
          result.uselessCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$AppConstantsRecord extends AppConstantsRecord {
  @override
  final bool? freeApp;
  @override
  final BuiltList<DocumentReference<Object?>>? notificationReferenceList;
  @override
  final String? privacyPolicyURL;
  @override
  final String? termsOfServiceURL;
  @override
  final String? pushNotificationImageURL;
  @override
  final int? uselessCount;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AppConstantsRecord(
          [void Function(AppConstantsRecordBuilder)? updates]) =>
      (new AppConstantsRecordBuilder()..update(updates))._build();

  _$AppConstantsRecord._(
      {this.freeApp,
      this.notificationReferenceList,
      this.privacyPolicyURL,
      this.termsOfServiceURL,
      this.pushNotificationImageURL,
      this.uselessCount,
      this.ffRef})
      : super._();

  @override
  AppConstantsRecord rebuild(
          void Function(AppConstantsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppConstantsRecordBuilder toBuilder() =>
      new AppConstantsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppConstantsRecord &&
        freeApp == other.freeApp &&
        notificationReferenceList == other.notificationReferenceList &&
        privacyPolicyURL == other.privacyPolicyURL &&
        termsOfServiceURL == other.termsOfServiceURL &&
        pushNotificationImageURL == other.pushNotificationImageURL &&
        uselessCount == other.uselessCount &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, freeApp.hashCode),
                            notificationReferenceList.hashCode),
                        privacyPolicyURL.hashCode),
                    termsOfServiceURL.hashCode),
                pushNotificationImageURL.hashCode),
            uselessCount.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppConstantsRecord')
          ..add('freeApp', freeApp)
          ..add('notificationReferenceList', notificationReferenceList)
          ..add('privacyPolicyURL', privacyPolicyURL)
          ..add('termsOfServiceURL', termsOfServiceURL)
          ..add('pushNotificationImageURL', pushNotificationImageURL)
          ..add('uselessCount', uselessCount)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AppConstantsRecordBuilder
    implements Builder<AppConstantsRecord, AppConstantsRecordBuilder> {
  _$AppConstantsRecord? _$v;

  bool? _freeApp;
  bool? get freeApp => _$this._freeApp;
  set freeApp(bool? freeApp) => _$this._freeApp = freeApp;

  ListBuilder<DocumentReference<Object?>>? _notificationReferenceList;
  ListBuilder<DocumentReference<Object?>> get notificationReferenceList =>
      _$this._notificationReferenceList ??=
          new ListBuilder<DocumentReference<Object?>>();
  set notificationReferenceList(
          ListBuilder<DocumentReference<Object?>>? notificationReferenceList) =>
      _$this._notificationReferenceList = notificationReferenceList;

  String? _privacyPolicyURL;
  String? get privacyPolicyURL => _$this._privacyPolicyURL;
  set privacyPolicyURL(String? privacyPolicyURL) =>
      _$this._privacyPolicyURL = privacyPolicyURL;

  String? _termsOfServiceURL;
  String? get termsOfServiceURL => _$this._termsOfServiceURL;
  set termsOfServiceURL(String? termsOfServiceURL) =>
      _$this._termsOfServiceURL = termsOfServiceURL;

  String? _pushNotificationImageURL;
  String? get pushNotificationImageURL => _$this._pushNotificationImageURL;
  set pushNotificationImageURL(String? pushNotificationImageURL) =>
      _$this._pushNotificationImageURL = pushNotificationImageURL;

  int? _uselessCount;
  int? get uselessCount => _$this._uselessCount;
  set uselessCount(int? uselessCount) => _$this._uselessCount = uselessCount;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AppConstantsRecordBuilder() {
    AppConstantsRecord._initializeBuilder(this);
  }

  AppConstantsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _freeApp = $v.freeApp;
      _notificationReferenceList = $v.notificationReferenceList?.toBuilder();
      _privacyPolicyURL = $v.privacyPolicyURL;
      _termsOfServiceURL = $v.termsOfServiceURL;
      _pushNotificationImageURL = $v.pushNotificationImageURL;
      _uselessCount = $v.uselessCount;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppConstantsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppConstantsRecord;
  }

  @override
  void update(void Function(AppConstantsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppConstantsRecord build() => _build();

  _$AppConstantsRecord _build() {
    _$AppConstantsRecord _$result;
    try {
      _$result = _$v ??
          new _$AppConstantsRecord._(
              freeApp: freeApp,
              notificationReferenceList: _notificationReferenceList?.build(),
              privacyPolicyURL: privacyPolicyURL,
              termsOfServiceURL: termsOfServiceURL,
              pushNotificationImageURL: pushNotificationImageURL,
              uselessCount: uselessCount,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notificationReferenceList';
        _notificationReferenceList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppConstantsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
