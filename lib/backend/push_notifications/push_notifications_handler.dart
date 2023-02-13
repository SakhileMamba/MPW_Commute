import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryColor,
          child: Image.asset(
            'assets/images/Commute_Logo_google_play_512x512.png',
            fit: BoxFit.fitWidth,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'phoneAuthentication': (data) async => ParameterData(
        allParams: {
          'referrerRef': getParameter<DocumentReference>(data, 'referrerRef'),
        },
      ),
  'phoneConfirmation': ParameterData.none(),
  'checkSetup': ParameterData.none(),
  'drivers': ParameterData.none(),
  'passengers': ParameterData.none(),
  'drives': ParameterData.none(),
  'seats': ParameterData.none(),
  'account': ParameterData.none(),
  'driveDetails': (data) async => ParameterData(
        allParams: {
          'commuteDoc': await getDocumentParameter<CommutesRecord>(
              data, 'commuteDoc', CommutesRecord.serializer),
          'driverDoc': await getDocumentParameter<UsersRecord>(
              data, 'driverDoc', UsersRecord.serializer),
          'notNotificationOpen':
              getParameter<bool>(data, 'notNotificationOpen'),
        },
      ),
  'driverRequestDetails': (data) async => ParameterData(
        allParams: {
          'hailingDoc': await getDocumentParameter<PassengersHailingRecord>(
              data, 'hailingDoc', PassengersHailingRecord.serializer),
          'passenger': await getDocumentParameter<UsersRecord>(
              data, 'passenger', UsersRecord.serializer),
          'notNotificationOpen':
              getParameter<bool>(data, 'notNotificationOpen'),
        },
      ),
  'vehicles': ParameterData.none(),
  'governmentId': ParameterData.none(),
  'profilePicture': ParameterData.none(),
  'driversLicense': ParameterData.none(),
  'personalInformation': ParameterData.none(),
  'addVehicle': ParameterData.none(),
  'subscription': ParameterData.none(),
  'approveUsers': ParameterData.none(),
  'approveDrivers': ParameterData.none(),
  'firstName': ParameterData.none(),
  'surname': ParameterData.none(),
  'gender': ParameterData.none(),
  'birthdate': ParameterData.none(),
  'successLottie': ParameterData.none(),
  'beginRequest': ParameterData.none(),
  'requestType': ParameterData.none(),
  'originType': ParameterData.none(),
  'origin': ParameterData.none(),
  'destination': ParameterData.none(),
  'departureDatetime': ParameterData.none(),
  'availableSeats': ParameterData.none(),
  'chooseVehicle': ParameterData.none(),
  'price': ParameterData.none(),
  'announcements': ParameterData.none(),
  'requestConfirmation': ParameterData.none(),
  'createAnnouncement': ParameterData.none(),
  'filterOriginType': ParameterData.none(),
  'filterOrigin': ParameterData.none(),
  'filterDestination': ParameterData.none(),
  'filterDepartureDatetime': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
