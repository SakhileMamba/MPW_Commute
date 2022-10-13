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
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
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
            'assets/images/Commute_2160px_logo.png',
            fit: BoxFit.scaleDown,
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'phone_authentication_page': (data) async => PhoneAuthenticationPageWidget(),
  'phone_confirmation_page': (data) async => PhoneConfirmationPageWidget(),
  'browse_passengers_page': (data) async =>
      NavBarPage(initialPage: 'browse_passengers_page'),
  'manage_commutes_driver_page': (data) async =>
      NavBarPage(initialPage: 'manage_commutes_driver_page'),
  'manage_commutes_passenger_page': (data) async =>
      NavBarPage(initialPage: 'manage_commutes_passenger_page'),
  'account_page': (data) async => NavBarPage(initialPage: 'account_page'),
  'browse_drivers_details_page': (data) async => BrowseDriversDetailsPageWidget(
        commuteRef: getParameter(data, 'commuteRef'),
      ),
  'commutes_management_details_page': (data) async =>
      CommutesManagementDetailsPageWidget(
        commuteRef: getParameter(data, 'commuteRef'),
      ),
  'government_id_update_Page': (data) async => GovernmentIdUpdatePageWidget(),
  'personal_information_update_page': (data) async =>
      PersonalInformationUpdatePageWidget(),
  'list_vehicles_page': (data) async => ListVehiclesPageWidget(),
  'filter_commutes_page': (data) async => FilterCommutesPageWidget(),
  'create_commute_page': (data) async => CreateCommutePageWidget(),
  'add_vehicle_page': (data) async => AddVehiclePageWidget(),
  'subscriptions_page': (data) async => SubscriptionsPageWidget(),
  'profile_picture_update_Page': (data) async =>
      ProfilePictureUpdatePageWidget(),
  'drivers_license_update_page': (data) async =>
      DriversLicenseUpdatePageWidget(),
  'approve_drivers_page': (data) async => ApproveDriversPageWidget(),
  'approve_users_page': (data) async => ApproveUsersPageWidget(),
  'update_user_first_name': (data) async => UpdateUserFirstNameWidget(),
  'update_user_surname': (data) async => UpdateUserSurnameWidget(),
  'success_lottie': (data) async => SuccessLottieWidget(),
  'propose_passenger_pickup_page': (data) async =>
      ProposePassengerPickupPageWidget(
        passengerHail: await getDocumentParameter(
            data, 'passengerHail', PassengersHailingRecord.serializer),
      ),
  'create_passenger_seat_hail_page': (data) async =>
      CreatePassengerSeatHailPageWidget(),
  'browse_passengers_details_page': (data) async =>
      BrowsePassengersDetailsPageWidget(
        hailingDoc: await getDocumentParameter(
            data, 'hailingDoc', PassengersHailingRecord.serializer),
        passenger: await getDocumentParameter(
            data, 'passenger', UsersRecord.serializer),
      ),
  'accept_drivers_details_page': (data) async => AcceptDriversDetailsPageWidget(
        hailDoc: await getDocumentParameter(
            data, 'hailDoc', PassengersHailingRecord.serializer),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

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
