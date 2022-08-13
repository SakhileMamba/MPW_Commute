// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessagesRecord> _$messagesRecordSerializer =
    new _$MessagesRecordSerializer();

class _$MessagesRecordSerializer
    implements StructuredSerializer<MessagesRecord> {
  @override
  final Iterable<Type> types = const [MessagesRecord, _$MessagesRecord];
  @override
  final String wireName = 'MessagesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MessagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sender;
    if (value != null) {
      result
        ..add('sender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeCreated;
    if (value != null) {
      result
        ..add('time_created')
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
  MessagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sender':
          result.sender = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time_created':
          result.timeCreated = serializers.deserialize(value,
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

class _$MessagesRecord extends MessagesRecord {
  @override
  final DocumentReference<Object?>? sender;
  @override
  final String? message;
  @override
  final DateTime? timeCreated;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MessagesRecord([void Function(MessagesRecordBuilder)? updates]) =>
      (new MessagesRecordBuilder()..update(updates))._build();

  _$MessagesRecord._({this.sender, this.message, this.timeCreated, this.ffRef})
      : super._();

  @override
  MessagesRecord rebuild(void Function(MessagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesRecordBuilder toBuilder() =>
      new MessagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessagesRecord &&
        sender == other.sender &&
        message == other.message &&
        timeCreated == other.timeCreated &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, sender.hashCode), message.hashCode),
            timeCreated.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessagesRecord')
          ..add('sender', sender)
          ..add('message', message)
          ..add('timeCreated', timeCreated)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MessagesRecordBuilder
    implements Builder<MessagesRecord, MessagesRecordBuilder> {
  _$MessagesRecord? _$v;

  DocumentReference<Object?>? _sender;
  DocumentReference<Object?>? get sender => _$this._sender;
  set sender(DocumentReference<Object?>? sender) => _$this._sender = sender;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DateTime? _timeCreated;
  DateTime? get timeCreated => _$this._timeCreated;
  set timeCreated(DateTime? timeCreated) => _$this._timeCreated = timeCreated;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MessagesRecordBuilder() {
    MessagesRecord._initializeBuilder(this);
  }

  MessagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sender = $v.sender;
      _message = $v.message;
      _timeCreated = $v.timeCreated;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessagesRecord;
  }

  @override
  void update(void Function(MessagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessagesRecord build() => _build();

  _$MessagesRecord _build() {
    final _$result = _$v ??
        new _$MessagesRecord._(
            sender: sender,
            message: message,
            timeCreated: timeCreated,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
