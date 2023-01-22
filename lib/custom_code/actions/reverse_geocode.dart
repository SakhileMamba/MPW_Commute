// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<Map> reverseGeocode(LatLng locationLatLng) async {
  var url = Uri.https('maps.googleapis.com', '/maps/api/geocode/json', {
    'latlng': "${locationLatLng.latitude}, ${locationLatLng.longitude}",
    'key': 'AIzaSyCDdREB-y1l84iC_QLbgPNlVDPeK7euRsg',
    'type': 'locality'
  });
  var response = await http.get(url);
  var decoded = convert.jsonDecode(response.body);
  var address_components = decoded['results'][0]['address_components'];

  var coded = {};

  for (var x in address_components) {
    try {
      switch (x['types'][0]) {
        case 'political':
          throw "political";
          break;
        case 'neighborhood':
          coded['neighborhood'] = x['long_name'];
          break;
        case 'locality':
          coded['locality'] = x['long_name'];
          break;
        case 'sublocality':
          coded['sublocality'] = x['long_name'];
          break;
        case 'sublocality_level_1':
          coded['sublocality_level_1'] = x['long_name'];
          break;
        case 'sublocality_level_2':
          coded['sublocality_level_2'] = x['long_name'];
          break;
        case 'sublocality_level_3':
          coded['sublocality_level_3'] = x['long_name'];
          break;
        case 'sublocality_level_4':
          coded['sublocality_level_4'] = x['long_name'];
          break;
        case 'sublocality_level_5':
          coded['sublocality_level_5'] = x['long_name'];
          break;
        case 'administrative_area_level_1':
          coded['administrative_area_level_1'] = x['long_name'];
          break;
        case 'administrative_area_level_2':
          coded['administrative_area_level_2'] = x['long_name'];
          break;
        case 'administrative_area_level_3':
          coded['administrative_area_level_3'] = x['long_name'];
          break;
        case 'administrative_area_level_4':
          coded['administrative_area_level_4'] = x['long_name'];
          break;
        case 'administrative_area_level_5':
          coded['administrative_area_level_5'] = x['long_name'];
          break;
        case 'administrative_area_level_6':
          coded['administrative_area_level_6'] = x['long_name'];
          break;
        case 'administrative_area_level_7':
          coded['administrative_area_level_7'] = x['long_name'];
          break;
        case 'country':
          coded['country'] = x['long_name'];
          break;
        case 'postal_code':
          coded['postal_code'] = x['long_name'];
          break;
        case 'postal_code_prefix':
          coded['postal_code_prefix'] = x['long_name'];
          break;
        case 'postal_town':
          coded['postal_town'] = x['long_name'];
          break;
      }
    } catch (e) {
      switch (x['types'][1]) {
        case 'political':
          throw "political";
          break;
        case 'neighborhood':
          coded['neighborhood'] = x['long_name'];
          break;
        case 'locality':
          coded['locality'] = x['long_name'];
          break;
        case 'sublocality':
          coded['sublocality'] = x['long_name'];
          break;
        case 'sublocality_level_1':
          coded['sublocality_level_1'] = x['long_name'];
          break;
        case 'sublocality_level_2':
          coded['sublocality_level_2'] = x['long_name'];
          break;
        case 'sublocality_level_3':
          coded['sublocality_level_3'] = x['long_name'];
          break;
        case 'sublocality_level_4':
          coded['sublocality_level_4'] = x['long_name'];
          break;
        case 'sublocality_level_5':
          coded['sublocality_level_5'] = x['long_name'];
          break;
        case 'administrative_area_level_1':
          coded['administrative_area_level_1'] = x['long_name'];
          break;
        case 'administrative_area_level_2':
          coded['administrative_area_level_2'] = x['long_name'];
          break;
        case 'administrative_area_level_3':
          coded['administrative_area_level_3'] = x['long_name'];
          break;
        case 'administrative_area_level_4':
          coded['administrative_area_level_4'] = x['long_name'];
          break;
        case 'administrative_area_level_5':
          coded['administrative_area_level_5'] = x['long_name'];
          break;
        case 'administrative_area_level_6':
          coded['administrative_area_level_6'] = x['long_name'];
          break;
        case 'administrative_area_level_7':
          coded['administrative_area_level_7'] = x['long_name'];
          break;
        case 'country':
          coded['country'] = x['long_name'];
          break;
        case 'postal_code':
          coded['postal_code'] = x['long_name'];
          break;
        case 'postal_code_prefix':
          coded['postal_code_prefix'] = x['long_name'];
          break;
        case 'postal_town':
          coded['postal_town'] = x['long_name'];
          break;
      }
    }
  }

  return coded;
}
