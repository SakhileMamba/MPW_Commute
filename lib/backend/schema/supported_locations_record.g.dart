// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supported_locations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SupportedLocationsRecord> _$supportedLocationsRecordSerializer =
    new _$SupportedLocationsRecordSerializer();

class _$SupportedLocationsRecordSerializer
    implements StructuredSerializer<SupportedLocationsRecord> {
  @override
  final Iterable<Type> types = const [
    SupportedLocationsRecord,
    _$SupportedLocationsRecord
  ];
  @override
  final String wireName = 'SupportedLocationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SupportedLocationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.eswatiniLocations;
    if (value != null) {
      result
        ..add('EswatiniLocations')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  SupportedLocationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SupportedLocationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'EswatiniLocations':
          result.eswatiniLocations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$SupportedLocationsRecord extends SupportedLocationsRecord {
  @override
  final BuiltList<String>? eswatiniLocations;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SupportedLocationsRecord(
          [void Function(SupportedLocationsRecordBuilder)? updates]) =>
      (new SupportedLocationsRecordBuilder()..update(updates))._build();

  _$SupportedLocationsRecord._({this.eswatiniLocations, this.ffRef})
      : super._();

  @override
  SupportedLocationsRecord rebuild(
          void Function(SupportedLocationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupportedLocationsRecordBuilder toBuilder() =>
      new SupportedLocationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupportedLocationsRecord &&
        eswatiniLocations == other.eswatiniLocations &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, eswatiniLocations.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SupportedLocationsRecord')
          ..add('eswatiniLocations', eswatiniLocations)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SupportedLocationsRecordBuilder
    implements
        Builder<SupportedLocationsRecord, SupportedLocationsRecordBuilder> {
  _$SupportedLocationsRecord? _$v;

  ListBuilder<String>? _eswatiniLocations;
  ListBuilder<String> get eswatiniLocations =>
      _$this._eswatiniLocations ??= new ListBuilder<String>();
  set eswatiniLocations(ListBuilder<String>? eswatiniLocations) =>
      _$this._eswatiniLocations = eswatiniLocations;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SupportedLocationsRecordBuilder() {
    SupportedLocationsRecord._initializeBuilder(this);
  }

  SupportedLocationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eswatiniLocations = $v.eswatiniLocations?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SupportedLocationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SupportedLocationsRecord;
  }

  @override
  void update(void Function(SupportedLocationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SupportedLocationsRecord build() => _build();

  _$SupportedLocationsRecord _build() {
    _$SupportedLocationsRecord _$result;
    try {
      _$result = _$v ??
          new _$SupportedLocationsRecord._(
              eswatiniLocations: _eswatiniLocations?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'eswatiniLocations';
        _eswatiniLocations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SupportedLocationsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
