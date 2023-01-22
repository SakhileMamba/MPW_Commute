import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'commutes_record.g.dart';

abstract class CommutesRecord
    implements Built<CommutesRecord, CommutesRecordBuilder> {
  static Serializer<CommutesRecord> get serializer =>
      _$commutesRecordSerializer;

  DocumentReference? get vehicle;

  @BuiltValueField(wireName: 'available_passenger_seats')
  int? get availablePassengerSeats;

  @BuiltValueField(wireName: 'price_per_seat')
  double? get pricePerSeat;

  DocumentReference? get driver;

  @BuiltValueField(wireName: 'departure_datetime')
  DateTime? get departureDatetime;

  double? get driversRating;

  String? get currency;

  bool? get archived;

  @BuiltValueField(wireName: 'applicant_list')
  BuiltList<DocumentReference>? get applicantList;

  LatlngReverseGeocodingStruct get originReversedGeocoded;

  LatlngReverseGeocodingStruct get destinationReversedGeocoded;

  @BuiltValueField(wireName: 'created_datetime')
  DateTime? get createdDatetime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CommutesRecordBuilder builder) => builder
    ..availablePassengerSeats = 0
    ..pricePerSeat = 0.0
    ..driversRating = 0.0
    ..currency = ''
    ..archived = false
    ..applicantList = ListBuilder()
    ..originReversedGeocoded = LatlngReverseGeocodingStructBuilder()
    ..destinationReversedGeocoded = LatlngReverseGeocodingStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commutes');

  static Stream<CommutesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommutesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CommutesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CommutesRecord(
        (c) => c
          ..vehicle = safeGet(() => toRef(snapshot.data['vehicle']))
          ..availablePassengerSeats =
              snapshot.data['available_passenger_seats']?.round()
          ..pricePerSeat = snapshot.data['price_per_seat']?.toDouble()
          ..driver = safeGet(() => toRef(snapshot.data['driver']))
          ..departureDatetime = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(
                  snapshot.data['departure_datetime']))
          ..driversRating = snapshot.data['driversRating']?.toDouble()
          ..currency = snapshot.data['currency']
          ..archived = snapshot.data['archived']
          ..applicantList = safeGet(() =>
              ListBuilder(snapshot.data['applicant_list'].map((s) => toRef(s))))
          ..originReversedGeocoded = createLatlngReverseGeocodingStruct(
            neighborhood:
                (snapshot.data['originReversedGeocoded'] ?? {})['neighborhood'],
            locality:
                (snapshot.data['originReversedGeocoded'] ?? {})['locality'],
            sublocality:
                (snapshot.data['originReversedGeocoded'] ?? {})['sublocality'],
            sublocalityLevel1: (snapshot.data['originReversedGeocoded'] ??
                {})['sublocality_level_1'],
            sublocalityLevel2: (snapshot.data['originReversedGeocoded'] ??
                {})['sublocality_level_2'],
            sublocalityLevel3: (snapshot.data['originReversedGeocoded'] ??
                {})['sublocality_level_3'],
            sublocalityLevel4: (snapshot.data['originReversedGeocoded'] ??
                {})['sublocality_level_4'],
            sublocalityLevel5: (snapshot.data['originReversedGeocoded'] ??
                {})['sublocality_level_5'],
            administrativeAreaLevel1:
                (snapshot.data['originReversedGeocoded'] ??
                    {})['administrative_area_level_1'],
            administrativeAreaLevel2:
                (snapshot.data['originReversedGeocoded'] ??
                    {})['administrative_area_level_2'],
            administrativeAreaLevel3:
                (snapshot.data['originReversedGeocoded'] ??
                    {})['administrative_area_level_3'],
            administrativeAreaLevel4:
                (snapshot.data['originReversedGeocoded'] ??
                    {})['administrative_area_level_4'],
            administrativeAreaLevel5:
                (snapshot.data['originReversedGeocoded'] ??
                    {})['administrative_area_level_5'],
            administrativeAreaLevel6:
                (snapshot.data['originReversedGeocoded'] ??
                    {})['administrative_area_level_6'],
            administrativeAreaLevel7:
                (snapshot.data['originReversedGeocoded'] ??
                    {})['administrative_area_level_7'],
            country: (snapshot.data['originReversedGeocoded'] ?? {})['country'],
            postalCode:
                (snapshot.data['originReversedGeocoded'] ?? {})['postal_code'],
            postalCodePrefix: (snapshot.data['originReversedGeocoded'] ??
                {})['postal_code_prefix'],
            postalTown:
                (snapshot.data['originReversedGeocoded'] ?? {})['postal_town'],
            latlng: safeGet(() => LatLng(
                  (snapshot.data['originReversedGeocoded'] ?? {})['_geoloc']
                      ['lat'],
                  (snapshot.data['originReversedGeocoded'] ?? {})['_geoloc']
                      ['lng'],
                )),
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..destinationReversedGeocoded = createLatlngReverseGeocodingStruct(
            neighborhood: (snapshot.data['destinationReversedGeocoded'] ??
                {})['neighborhood'],
            locality: (snapshot.data['destinationReversedGeocoded'] ??
                {})['locality'],
            sublocality: (snapshot.data['destinationReversedGeocoded'] ??
                {})['sublocality'],
            sublocalityLevel1: (snapshot.data['destinationReversedGeocoded'] ??
                {})['sublocality_level_1'],
            sublocalityLevel2: (snapshot.data['destinationReversedGeocoded'] ??
                {})['sublocality_level_2'],
            sublocalityLevel3: (snapshot.data['destinationReversedGeocoded'] ??
                {})['sublocality_level_3'],
            sublocalityLevel4: (snapshot.data['destinationReversedGeocoded'] ??
                {})['sublocality_level_4'],
            sublocalityLevel5: (snapshot.data['destinationReversedGeocoded'] ??
                {})['sublocality_level_5'],
            administrativeAreaLevel1:
                (snapshot.data['destinationReversedGeocoded'] ??
                    {})['administrative_area_level_1'],
            administrativeAreaLevel2:
                (snapshot.data['destinationReversedGeocoded'] ??
                    {})['administrative_area_level_2'],
            administrativeAreaLevel3:
                (snapshot.data['destinationReversedGeocoded'] ??
                    {})['administrative_area_level_3'],
            administrativeAreaLevel4:
                (snapshot.data['destinationReversedGeocoded'] ??
                    {})['administrative_area_level_4'],
            administrativeAreaLevel5:
                (snapshot.data['destinationReversedGeocoded'] ??
                    {})['administrative_area_level_5'],
            administrativeAreaLevel6:
                (snapshot.data['destinationReversedGeocoded'] ??
                    {})['administrative_area_level_6'],
            administrativeAreaLevel7:
                (snapshot.data['destinationReversedGeocoded'] ??
                    {})['administrative_area_level_7'],
            country:
                (snapshot.data['destinationReversedGeocoded'] ?? {})['country'],
            postalCode: (snapshot.data['destinationReversedGeocoded'] ??
                {})['postal_code'],
            postalCodePrefix: (snapshot.data['destinationReversedGeocoded'] ??
                {})['postal_code_prefix'],
            postalTown: (snapshot.data['destinationReversedGeocoded'] ??
                {})['postal_town'],
            latlng: safeGet(() => LatLng(
                  (snapshot.data['destinationReversedGeocoded'] ??
                      {})['_geoloc']['lat'],
                  (snapshot.data['destinationReversedGeocoded'] ??
                      {})['_geoloc']['lng'],
                )),
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..createdDatetime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_datetime']))
          ..ffRef = CommutesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CommutesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'commutes',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CommutesRecord._();
  factory CommutesRecord([void Function(CommutesRecordBuilder) updates]) =
      _$CommutesRecord;

  static CommutesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommutesRecordData({
  DocumentReference? vehicle,
  int? availablePassengerSeats,
  double? pricePerSeat,
  DocumentReference? driver,
  DateTime? departureDatetime,
  double? driversRating,
  String? currency,
  bool? archived,
  LatlngReverseGeocodingStruct? originReversedGeocoded,
  LatlngReverseGeocodingStruct? destinationReversedGeocoded,
  DateTime? createdDatetime,
}) {
  final firestoreData = serializers.toFirestore(
    CommutesRecord.serializer,
    CommutesRecord(
      (c) => c
        ..vehicle = vehicle
        ..availablePassengerSeats = availablePassengerSeats
        ..pricePerSeat = pricePerSeat
        ..driver = driver
        ..departureDatetime = departureDatetime
        ..driversRating = driversRating
        ..currency = currency
        ..archived = archived
        ..applicantList = null
        ..originReversedGeocoded = LatlngReverseGeocodingStructBuilder()
        ..destinationReversedGeocoded = LatlngReverseGeocodingStructBuilder()
        ..createdDatetime = createdDatetime,
    ),
  );

  // Handle nested data for "originReversedGeocoded" field.
  addLatlngReverseGeocodingStructData(
      firestoreData, originReversedGeocoded, 'originReversedGeocoded');

  // Handle nested data for "destinationReversedGeocoded" field.
  addLatlngReverseGeocodingStructData(firestoreData,
      destinationReversedGeocoded, 'destinationReversedGeocoded');

  return firestoreData;
}
