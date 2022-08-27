// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_urls_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InAppUrlsRecord> _$inAppUrlsRecordSerializer =
    new _$InAppUrlsRecordSerializer();

class _$InAppUrlsRecordSerializer
    implements StructuredSerializer<InAppUrlsRecord> {
  @override
  final Iterable<Type> types = const [InAppUrlsRecord, _$InAppUrlsRecord];
  @override
  final String wireName = 'InAppUrlsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, InAppUrlsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
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
  InAppUrlsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InAppUrlsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
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

class _$InAppUrlsRecord extends InAppUrlsRecord {
  @override
  final String? url;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$InAppUrlsRecord([void Function(InAppUrlsRecordBuilder)? updates]) =>
      (new InAppUrlsRecordBuilder()..update(updates))._build();

  _$InAppUrlsRecord._({this.url, this.ffRef}) : super._();

  @override
  InAppUrlsRecord rebuild(void Function(InAppUrlsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InAppUrlsRecordBuilder toBuilder() =>
      new InAppUrlsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InAppUrlsRecord && url == other.url && ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, url.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InAppUrlsRecord')
          ..add('url', url)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class InAppUrlsRecordBuilder
    implements Builder<InAppUrlsRecord, InAppUrlsRecordBuilder> {
  _$InAppUrlsRecord? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  InAppUrlsRecordBuilder() {
    InAppUrlsRecord._initializeBuilder(this);
  }

  InAppUrlsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InAppUrlsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InAppUrlsRecord;
  }

  @override
  void update(void Function(InAppUrlsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InAppUrlsRecord build() => _build();

  _$InAppUrlsRecord _build() {
    final _$result = _$v ?? new _$InAppUrlsRecord._(url: url, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
