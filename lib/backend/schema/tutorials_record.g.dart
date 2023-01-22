// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorials_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TutorialsRecord> _$tutorialsRecordSerializer =
    new _$TutorialsRecordSerializer();

class _$TutorialsRecordSerializer
    implements StructuredSerializer<TutorialsRecord> {
  @override
  final Iterable<Type> types = const [TutorialsRecord, _$TutorialsRecord];
  @override
  final String wireName = 'TutorialsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TutorialsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.dateAdded;
    if (value != null) {
      result
        ..add('date_added')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.videoTitle;
    if (value != null) {
      result
        ..add('video_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.videoOrder;
    if (value != null) {
      result
        ..add('video_order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.videoYoutubeUrl;
    if (value != null) {
      result
        ..add('video_youtube_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  TutorialsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TutorialsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date_added':
          result.dateAdded = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'video_title':
          result.videoTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'video_order':
          result.videoOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'video_youtube_url':
          result.videoYoutubeUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$TutorialsRecord extends TutorialsRecord {
  @override
  final DateTime? dateAdded;
  @override
  final String? videoTitle;
  @override
  final int? videoOrder;
  @override
  final String? videoYoutubeUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TutorialsRecord([void Function(TutorialsRecordBuilder)? updates]) =>
      (new TutorialsRecordBuilder()..update(updates))._build();

  _$TutorialsRecord._(
      {this.dateAdded,
      this.videoTitle,
      this.videoOrder,
      this.videoYoutubeUrl,
      this.ffRef})
      : super._();

  @override
  TutorialsRecord rebuild(void Function(TutorialsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TutorialsRecordBuilder toBuilder() =>
      new TutorialsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TutorialsRecord &&
        dateAdded == other.dateAdded &&
        videoTitle == other.videoTitle &&
        videoOrder == other.videoOrder &&
        videoYoutubeUrl == other.videoYoutubeUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, dateAdded.hashCode), videoTitle.hashCode),
                videoOrder.hashCode),
            videoYoutubeUrl.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TutorialsRecord')
          ..add('dateAdded', dateAdded)
          ..add('videoTitle', videoTitle)
          ..add('videoOrder', videoOrder)
          ..add('videoYoutubeUrl', videoYoutubeUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TutorialsRecordBuilder
    implements Builder<TutorialsRecord, TutorialsRecordBuilder> {
  _$TutorialsRecord? _$v;

  DateTime? _dateAdded;
  DateTime? get dateAdded => _$this._dateAdded;
  set dateAdded(DateTime? dateAdded) => _$this._dateAdded = dateAdded;

  String? _videoTitle;
  String? get videoTitle => _$this._videoTitle;
  set videoTitle(String? videoTitle) => _$this._videoTitle = videoTitle;

  int? _videoOrder;
  int? get videoOrder => _$this._videoOrder;
  set videoOrder(int? videoOrder) => _$this._videoOrder = videoOrder;

  String? _videoYoutubeUrl;
  String? get videoYoutubeUrl => _$this._videoYoutubeUrl;
  set videoYoutubeUrl(String? videoYoutubeUrl) =>
      _$this._videoYoutubeUrl = videoYoutubeUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TutorialsRecordBuilder() {
    TutorialsRecord._initializeBuilder(this);
  }

  TutorialsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateAdded = $v.dateAdded;
      _videoTitle = $v.videoTitle;
      _videoOrder = $v.videoOrder;
      _videoYoutubeUrl = $v.videoYoutubeUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TutorialsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TutorialsRecord;
  }

  @override
  void update(void Function(TutorialsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TutorialsRecord build() => _build();

  _$TutorialsRecord _build() {
    final _$result = _$v ??
        new _$TutorialsRecord._(
            dateAdded: dateAdded,
            videoTitle: videoTitle,
            videoOrder: videoOrder,
            videoYoutubeUrl: videoYoutubeUrl,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
