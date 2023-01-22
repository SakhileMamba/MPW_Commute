// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcements_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnnouncementsRecord> _$announcementsRecordSerializer =
    new _$AnnouncementsRecordSerializer();

class _$AnnouncementsRecordSerializer
    implements StructuredSerializer<AnnouncementsRecord> {
  @override
  final Iterable<Type> types = const [
    AnnouncementsRecord,
    _$AnnouncementsRecord
  ];
  @override
  final String wireName = 'AnnouncementsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AnnouncementsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mediaType;
    if (value != null) {
      result
        ..add('media_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mediaURL;
    if (value != null) {
      result
        ..add('media_URL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.readers;
    if (value != null) {
      result
        ..add('readers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.archived;
    if (value != null) {
      result
        ..add('archived')
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
  AnnouncementsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnnouncementsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'media_type':
          result.mediaType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'media_URL':
          result.mediaURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'readers':
          result.readers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'archived':
          result.archived = serializers.deserialize(value,
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

class _$AnnouncementsRecord extends AnnouncementsRecord {
  @override
  final DateTime? createdTime;
  @override
  final String? title;
  @override
  final String? message;
  @override
  final String? mediaType;
  @override
  final String? mediaURL;
  @override
  final BuiltList<DocumentReference<Object?>>? readers;
  @override
  final bool? archived;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AnnouncementsRecord(
          [void Function(AnnouncementsRecordBuilder)? updates]) =>
      (new AnnouncementsRecordBuilder()..update(updates))._build();

  _$AnnouncementsRecord._(
      {this.createdTime,
      this.title,
      this.message,
      this.mediaType,
      this.mediaURL,
      this.readers,
      this.archived,
      this.ffRef})
      : super._();

  @override
  AnnouncementsRecord rebuild(
          void Function(AnnouncementsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnouncementsRecordBuilder toBuilder() =>
      new AnnouncementsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnouncementsRecord &&
        createdTime == other.createdTime &&
        title == other.title &&
        message == other.message &&
        mediaType == other.mediaType &&
        mediaURL == other.mediaURL &&
        readers == other.readers &&
        archived == other.archived &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, createdTime.hashCode), title.hashCode),
                            message.hashCode),
                        mediaType.hashCode),
                    mediaURL.hashCode),
                readers.hashCode),
            archived.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnouncementsRecord')
          ..add('createdTime', createdTime)
          ..add('title', title)
          ..add('message', message)
          ..add('mediaType', mediaType)
          ..add('mediaURL', mediaURL)
          ..add('readers', readers)
          ..add('archived', archived)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AnnouncementsRecordBuilder
    implements Builder<AnnouncementsRecord, AnnouncementsRecordBuilder> {
  _$AnnouncementsRecord? _$v;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _mediaType;
  String? get mediaType => _$this._mediaType;
  set mediaType(String? mediaType) => _$this._mediaType = mediaType;

  String? _mediaURL;
  String? get mediaURL => _$this._mediaURL;
  set mediaURL(String? mediaURL) => _$this._mediaURL = mediaURL;

  ListBuilder<DocumentReference<Object?>>? _readers;
  ListBuilder<DocumentReference<Object?>> get readers =>
      _$this._readers ??= new ListBuilder<DocumentReference<Object?>>();
  set readers(ListBuilder<DocumentReference<Object?>>? readers) =>
      _$this._readers = readers;

  bool? _archived;
  bool? get archived => _$this._archived;
  set archived(bool? archived) => _$this._archived = archived;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AnnouncementsRecordBuilder() {
    AnnouncementsRecord._initializeBuilder(this);
  }

  AnnouncementsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdTime = $v.createdTime;
      _title = $v.title;
      _message = $v.message;
      _mediaType = $v.mediaType;
      _mediaURL = $v.mediaURL;
      _readers = $v.readers?.toBuilder();
      _archived = $v.archived;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnouncementsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnnouncementsRecord;
  }

  @override
  void update(void Function(AnnouncementsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnouncementsRecord build() => _build();

  _$AnnouncementsRecord _build() {
    _$AnnouncementsRecord _$result;
    try {
      _$result = _$v ??
          new _$AnnouncementsRecord._(
              createdTime: createdTime,
              title: title,
              message: message,
              mediaType: mediaType,
              mediaURL: mediaURL,
              readers: _readers?.build(),
              archived: archived,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'readers';
        _readers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AnnouncementsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
