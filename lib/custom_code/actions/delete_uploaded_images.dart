// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';

Future<bool> deleteUploadedImages(String theImageURL) async {
  // Add your function code here!
  final storageRef = FirebaseStorage.instance.ref();
  final desertRef = storageRef.child(theImageURL);
  try {
    await desertRef.delete();
    return true;
  } on FirebaseException catch (e) {
    // Caught an exception from Firebase.
    print("Failed with error '${e.code}': ${e.message}");
    return false;
  }
}
