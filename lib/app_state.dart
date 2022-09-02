import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
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
  }

  late SharedPreferences prefs;

  DocumentReference? chosenVehicle;

  String scheduleDepartureDatetime = '';

  String filterOrigin = '';

  String filterDestination = '';

  DateTime? filterDepartureDatetime;

  int filterMinimumAvailableSeats = 0;

  DateTime? _filterCurrentDateTime;
  DateTime? get filterCurrentDateTime => _filterCurrentDateTime;
  set filterCurrentDateTime(DateTime? _value) {
    if (_value == null) {
      return;
    }
    _filterCurrentDateTime = _value;
    prefs.setInt('ff_filterCurrentDateTime', _value.millisecondsSinceEpoch);
  }

  String _pickedCurrency = 'SZL';
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

  String oldPhotoURLTemp = '';

  String newPhotoURLTemp = '';

  String currentPhotoURLTemp =
      'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3';
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
