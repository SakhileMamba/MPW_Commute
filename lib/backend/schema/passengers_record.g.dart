// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passengers_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PassengersRecord> _$passengersRecordSerializer =
    new _$PassengersRecordSerializer();

class _$PassengersRecordSerializer
    implements StructuredSerializer<PassengersRecord> {
  @override
  final Iterable<Type> types = const [PassengersRecord, _$PassengersRecord];
  @override
  final String wireName = 'PassengersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PassengersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.passengerAccount;
    if (value != null) {
      result
        ..add('passenger_account')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.accepted;
    if (value != null) {
      result
        ..add('accepted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.commuteDatetime;
    if (value != null) {
      result
        ..add('commute_datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  PassengersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PassengersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'passenger_account':
          result.passengerAccount = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'accepted':
          result.accepted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'commute_datetime':
          result.commuteDatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$PassengersRecord extends PassengersRecord {
  @override
  final DocumentReference<Object?>? passengerAccount;
  @override
  final bool? accepted;
  @override
  final DateTime? commuteDatetime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PassengersRecord(
          [void Function(PassengersRecordBuilder)? updates]) =>
      (new PassengersRecordBuilder()..update(updates))._build();

  _$PassengersRecord._(
      {this.passengerAccount, this.accepted, this.commuteDatetime, this.ffRef})
      : super._();

  @override
  PassengersRecord rebuild(void Function(PassengersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PassengersRecordBuilder toBuilder() =>
      new PassengersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PassengersRecord &&
        passengerAccount == other.passengerAccount &&
        accepted == other.accepted &&
        commuteDatetime == other.commuteDatetime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, passengerAccount.hashCode), accepted.hashCode),
            commuteDatetime.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PassengersRecord')
          ..add('passengerAccount', passengerAccount)
          ..add('accepted', accepted)
          ..add('commuteDatetime', commuteDatetime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PassengersRecordBuilder
    implements Builder<PassengersRecord, PassengersRecordBuilder> {
  _$PassengersRecord? _$v;

  DocumentReference<Object?>? _passengerAccount;
  DocumentReference<Object?>? get passengerAccount => _$this._passengerAccount;
  set passengerAccount(DocumentReference<Object?>? passengerAccount) =>
      _$this._passengerAccount = passengerAccount;

  bool? _accepted;
  bool? get accepted => _$this._accepted;
  set accepted(bool? accepted) => _$this._accepted = accepted;

  DateTime? _commuteDatetime;
  DateTime? get commuteDatetime => _$this._commuteDatetime;
  set commuteDatetime(DateTime? commuteDatetime) =>
      _$this._commuteDatetime = commuteDatetime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PassengersRecordBuilder() {
    PassengersRecord._initializeBuilder(this);
  }

  PassengersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passengerAccount = $v.passengerAccount;
      _accepted = $v.accepted;
      _commuteDatetime = $v.commuteDatetime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PassengersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PassengersRecord;
  }

  @override
  void update(void Function(PassengersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PassengersRecord build() => _build();

  _$PassengersRecord _build() {
    final _$result = _$v ??
        new _$PassengersRecord._(
            passengerAccount: passengerAccount,
            accepted: accepted,
            commuteDatetime: commuteDatetime,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
