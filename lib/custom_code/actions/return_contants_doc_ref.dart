// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference> returnContantsDocRef(String stringID) async {
  // Add your function code here!
  return FirebaseFirestore.instance.doc('app_constants/$stringID');
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
