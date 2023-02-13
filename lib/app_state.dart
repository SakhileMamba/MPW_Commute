import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _filterCurrentDateTime = prefs.containsKey('ff_filterCurrentDateTime')
        ? DateTime.fromMillisecondsSinceEpoch(
            prefs.getInt('ff_filterCurrentDateTime')!)
        : null;
    _pickedCurrency = prefs.getString('ff_pickedCurrency') ?? _pickedCurrency;
    _privacyPolicyAndTermsOfServiceAgreement =
        prefs.getBool('ff_privacyPolicyAndTermsOfServiceAgreement') ??
            _privacyPolicyAndTermsOfServiceAgreement;
    _appConstantFreeApp =
        prefs.getString('ff_appConstantFreeApp')?.ref ?? _appConstantFreeApp;
    _referrerRef = prefs.getString('ff_referrerRef')?.ref ?? _referrerRef;
    _persistedPrivacyPolicyURL =
        prefs.getString('ff_persistedPrivacyPolicyURL') ??
            _persistedPrivacyPolicyURL;
    _persistedTermsOfServiceURL =
        prefs.getString('ff_persistedTermsOfServiceURL') ??
            _persistedTermsOfServiceURL;
    _isProfilePicHintGiven =
        prefs.getBool('ff_isProfilePicHintGiven') ?? _isProfilePicHintGiven;
    _isIdPicHintGiven =
        prefs.getBool('ff_isIdPicHintGiven') ?? _isIdPicHintGiven;
    _isLicenseHintPicGiven =
        prefs.getBool('ff_isLicenseHintPicGiven') ?? _isLicenseHintPicGiven;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _chosenVehicle;
  DocumentReference? get chosenVehicle => _chosenVehicle;
  set chosenVehicle(DocumentReference? _value) {
    _chosenVehicle = _value;
  }

  String _scheduleDepartureDatetime = '';
  String get scheduleDepartureDatetime => _scheduleDepartureDatetime;
  set scheduleDepartureDatetime(String _value) {
    _scheduleDepartureDatetime = _value;
  }

  DateTime? _filterDepartureDatetime;
  DateTime? get filterDepartureDatetime => _filterDepartureDatetime;
  set filterDepartureDatetime(DateTime? _value) {
    _filterDepartureDatetime = _value;
  }

  int _filterMinimumAvailableSeats = 0;
  int get filterMinimumAvailableSeats => _filterMinimumAvailableSeats;
  set filterMinimumAvailableSeats(int _value) {
    _filterMinimumAvailableSeats = _value;
  }

  DateTime? _filterCurrentDateTime;
  DateTime? get filterCurrentDateTime => _filterCurrentDateTime;
  set filterCurrentDateTime(DateTime? _value) {
    _filterCurrentDateTime = _value;
    _value != null
        ? prefs.setInt(
            'ff_filterCurrentDateTime', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_filterCurrentDateTime');
  }

  String _pickedCurrency = '';
  String get pickedCurrency => _pickedCurrency;
  set pickedCurrency(String _value) {
    _pickedCurrency = _value;
    prefs.setString('ff_pickedCurrency', _value);
  }

  bool _privacyPolicyAndTermsOfServiceAgreement = false;
  bool get privacyPolicyAndTermsOfServiceAgreement =>
      _privacyPolicyAndTermsOfServiceAgreement;
  set privacyPolicyAndTermsOfServiceAgreement(bool _value) {
    _privacyPolicyAndTermsOfServiceAgreement = _value;
    prefs.setBool('ff_privacyPolicyAndTermsOfServiceAgreement', _value);
  }

  String _oldPhotoURLTemp = '';
  String get oldPhotoURLTemp => _oldPhotoURLTemp;
  set oldPhotoURLTemp(String _value) {
    _oldPhotoURLTemp = _value;
  }

  String _currentPhotoURLTemp = '';
  String get currentPhotoURLTemp => _currentPhotoURLTemp;
  set currentPhotoURLTemp(String _value) {
    _currentPhotoURLTemp = _value;
  }

  String _currentPhotoURLTempID = '';
  String get currentPhotoURLTempID => _currentPhotoURLTempID;
  set currentPhotoURLTempID(String _value) {
    _currentPhotoURLTempID = _value;
  }

  String _currentPhotoURLTempLicense = '';
  String get currentPhotoURLTempLicense => _currentPhotoURLTempLicense;
  set currentPhotoURLTempLicense(String _value) {
    _currentPhotoURLTempLicense = _value;
  }

  DateTime? _userBirthDate;
  DateTime? get userBirthDate => _userBirthDate;
  set userBirthDate(DateTime? _value) {
    _userBirthDate = _value;
  }

  bool _backButtonFileUpload = false;
  bool get backButtonFileUpload => _backButtonFileUpload;
  set backButtonFileUpload(bool _value) {
    _backButtonFileUpload = _value;
  }

  DocumentReference? _appConstantFreeApp =
      FirebaseFirestore.instance.doc('/app_constants/kOOn2yvmHgWV3k61xPRS');
  DocumentReference? get appConstantFreeApp => _appConstantFreeApp;
  set appConstantFreeApp(DocumentReference? _value) {
    _appConstantFreeApp = _value;
    _value != null
        ? prefs.setString('ff_appConstantFreeApp', _value.path)
        : prefs.remove('ff_appConstantFreeApp');
  }

  bool _isCurrentLocationRGeocoded = false;
  bool get isCurrentLocationRGeocoded => _isCurrentLocationRGeocoded;
  set isCurrentLocationRGeocoded(bool _value) {
    _isCurrentLocationRGeocoded = _value;
  }

  dynamic _tempOriginReversed;
  dynamic get tempOriginReversed => _tempOriginReversed;
  set tempOriginReversed(dynamic _value) {
    _tempOriginReversed = _value;
  }

  dynamic _tempDestinationReversed;
  dynamic get tempDestinationReversed => _tempDestinationReversed;
  set tempDestinationReversed(dynamic _value) {
    _tempDestinationReversed = _value;
  }

  bool _originFiltered = false;
  bool get originFiltered => _originFiltered;
  set originFiltered(bool _value) {
    _originFiltered = _value;
  }

  String _tempRequestType = '';
  String get tempRequestType => _tempRequestType;
  set tempRequestType(String _value) {
    _tempRequestType = _value;
  }

  DateTime? _tempDepartureDateTime;
  DateTime? get tempDepartureDateTime => _tempDepartureDateTime;
  set tempDepartureDateTime(DateTime? _value) {
    _tempDepartureDateTime = _value;
  }

  int _tempSeats = 0;
  int get tempSeats => _tempSeats;
  set tempSeats(int _value) {
    _tempSeats = _value;
  }

  double _tempPrice = 0.0;
  double get tempPrice => _tempPrice;
  set tempPrice(double _value) {
    _tempPrice = _value;
  }

  LatLng? _tempOriginLatLng;
  LatLng? get tempOriginLatLng => _tempOriginLatLng;
  set tempOriginLatLng(LatLng? _value) {
    _tempOriginLatLng = _value;
  }

  LatLng? _tempDestinationLatLng;
  LatLng? get tempDestinationLatLng => _tempDestinationLatLng;
  set tempDestinationLatLng(LatLng? _value) {
    _tempDestinationLatLng = _value;
  }

  int _tempChosenVehicleMaxSeats = 0;
  int get tempChosenVehicleMaxSeats => _tempChosenVehicleMaxSeats;
  set tempChosenVehicleMaxSeats(int _value) {
    _tempChosenVehicleMaxSeats = _value;
  }

  bool _tempProposingToDrive = false;
  bool get tempProposingToDrive => _tempProposingToDrive;
  set tempProposingToDrive(bool _value) {
    _tempProposingToDrive = _value;
  }

  DocumentReference? _tempPassengerHailingDriverRef;
  DocumentReference? get tempPassengerHailingDriverRef =>
      _tempPassengerHailingDriverRef;
  set tempPassengerHailingDriverRef(DocumentReference? _value) {
    _tempPassengerHailingDriverRef = _value;
  }

  DocumentReference? _tempHailingPassengerAccountRef;
  DocumentReference? get tempHailingPassengerAccountRef =>
      _tempHailingPassengerAccountRef;
  set tempHailingPassengerAccountRef(DocumentReference? _value) {
    _tempHailingPassengerAccountRef = _value;
  }

  int _seatsPageInitialIndex = 0;
  int get seatsPageInitialIndex => _seatsPageInitialIndex;
  set seatsPageInitialIndex(int _value) {
    _seatsPageInitialIndex = _value;
  }

  DocumentReference? _referrerRef;
  DocumentReference? get referrerRef => _referrerRef;
  set referrerRef(DocumentReference? _value) {
    _referrerRef = _value;
    _value != null
        ? prefs.setString('ff_referrerRef', _value.path)
        : prefs.remove('ff_referrerRef');
  }

  String _persistedPrivacyPolicyURL = '';
  String get persistedPrivacyPolicyURL => _persistedPrivacyPolicyURL;
  set persistedPrivacyPolicyURL(String _value) {
    _persistedPrivacyPolicyURL = _value;
    prefs.setString('ff_persistedPrivacyPolicyURL', _value);
  }

  String _persistedTermsOfServiceURL = '';
  String get persistedTermsOfServiceURL => _persistedTermsOfServiceURL;
  set persistedTermsOfServiceURL(String _value) {
    _persistedTermsOfServiceURL = _value;
    prefs.setString('ff_persistedTermsOfServiceURL', _value);
  }

  String _currentAnnouncementMediaURL = '';
  String get currentAnnouncementMediaURL => _currentAnnouncementMediaURL;
  set currentAnnouncementMediaURL(String _value) {
    _currentAnnouncementMediaURL = _value;
  }

  String _countryDiallingCode = '';
  String get countryDiallingCode => _countryDiallingCode;
  set countryDiallingCode(String _value) {
    _countryDiallingCode = _value;
  }

  dynamic _filterTempOriginReversed;
  dynamic get filterTempOriginReversed => _filterTempOriginReversed;
  set filterTempOriginReversed(dynamic _value) {
    _filterTempOriginReversed = _value;
  }

  dynamic _filterTempDestinationReversed;
  dynamic get filterTempDestinationReversed => _filterTempDestinationReversed;
  set filterTempDestinationReversed(dynamic _value) {
    _filterTempDestinationReversed = _value;
  }

  String _filterCallingSource = '';
  String get filterCallingSource => _filterCallingSource;
  set filterCallingSource(String _value) {
    _filterCallingSource = _value;
  }

  LatLng? _filterTempOriginLatLng;
  LatLng? get filterTempOriginLatLng => _filterTempOriginLatLng;
  set filterTempOriginLatLng(LatLng? _value) {
    _filterTempOriginLatLng = _value;
  }

  LatLng? _filterTempDestinationLatLng;
  LatLng? get filterTempDestinationLatLng => _filterTempDestinationLatLng;
  set filterTempDestinationLatLng(LatLng? _value) {
    _filterTempDestinationLatLng = _value;
  }

  bool _isProfilePicHintGiven = false;
  bool get isProfilePicHintGiven => _isProfilePicHintGiven;
  set isProfilePicHintGiven(bool _value) {
    _isProfilePicHintGiven = _value;
    prefs.setBool('ff_isProfilePicHintGiven', _value);
  }

  bool _isIdPicHintGiven = false;
  bool get isIdPicHintGiven => _isIdPicHintGiven;
  set isIdPicHintGiven(bool _value) {
    _isIdPicHintGiven = _value;
    prefs.setBool('ff_isIdPicHintGiven', _value);
  }

  bool _isLicenseHintPicGiven = false;
  bool get isLicenseHintPicGiven => _isLicenseHintPicGiven;
  set isLicenseHintPicGiven(bool _value) {
    _isLicenseHintPicGiven = _value;
    prefs.setBool('ff_isLicenseHintPicGiven', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
