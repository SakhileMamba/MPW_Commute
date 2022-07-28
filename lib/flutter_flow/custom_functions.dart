import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String timeStampToDateString(DateTime timeStamp) {
  return DateFormat('d MMM y').format(timeStamp).toString();
}

String timeStampToTimeString(DateTime timeStamp) {
  // Add your function code here!
  return DateFormat.jm().format(timeStamp).toString();
}

String imageUpdateFunction(
  String? databaseImagePath,
  String? uploadedImagePath,
) {
  // Add your function code here!
  if (databaseImagePath != null && uploadedImagePath != null) {
    return uploadedImagePath;
  } else if (databaseImagePath != null && uploadedImagePath == null) {
    return databaseImagePath;
  } else {
    return "https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3";
  }
}
