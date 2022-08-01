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
