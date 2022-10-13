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

String twoDeci(double arg) {
  //Double To String In Two Decimals Places
  return arg.toStringAsFixed(2);
}

int stringNumbertoInt(String stringNumber) {
  // Add your function code here!
  if (int.tryParse(stringNumber) != null) {
    return int.parse(stringNumber);
  } else {
    return -1;
  }
}

double stringNumbertoDouble(String stringNumber) {
  // Add your function code here!
  if (double.tryParse(stringNumber) != null) {
    return double.parse(stringNumber);
  } else {
    return -1;
  }
}

bool isIntGreaterThanZero(int input) {
  // Add your function code here!
  return (input > 0);
}

bool isDoubleGreaterThanZero(double input) {
  // Add your function code here!
  return (input > 0);
}

String docRefToString(DocumentReference docRefArg) {
  var theString = docRefArg.id.toString();
  return theString;
}

bool swaziNumberTest(String? phoneNumber) {
  // Add your function code here!
  if (phoneNumber?.substring(0, 4) == "+268")
    return true;
  else
    return false;
}

int availableSeatsMinusOne(int availableSeats) {
  // minus one from input
  if (availableSeats == 0) {
    return 0;
  }

  return (availableSeats - 1);
}
