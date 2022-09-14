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
  final DocumentReference<Object?>? ffRef;

  factory _$AppConstantsRecord(
          [void Function(AppConstantsRecordBuilder)? updates]) =>
      (new AppConstantsRecordBuilder()..update(updates))._build();

  _$AppConstantsRecord._({this.freeApp, this.ffRef}) : super._();

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
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, freeApp.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppConstantsRecord')
          ..add('freeApp', freeApp)
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
    final _$result =
        _$v ?? new _$AppConstantsRecord._(freeApp: freeApp, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
