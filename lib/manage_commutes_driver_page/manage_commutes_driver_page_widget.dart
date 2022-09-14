import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../commutes_management_details_page/commutes_management_details_page_widget.dart';
import '../components/commutes_empty_widget.dart';
import '../create_commute_page/create_commute_page_widget.dart';
import '../drivers_license_update_page/drivers_license_update_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class ManageCommutesDriverPageWidget extends StatefulWidget {
  const ManageCommutesDriverPageWidget({Key? key}) : super(key: key);

  @override
  _ManageCommutesDriverPageWidgetState createState() =>
      _ManageCommutesDriverPageWidgetState();
}

class _ManageCommutesDriverPageWidgetState
    extends State<ManageCommutesDriverPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'manage_commutes_driver_page'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Commutes',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          FutureBuilder<List<AppConstantsRecord>>(
            future: queryAppConstantsRecordOnce(
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitChasingDots(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),
                );
              }
              List<AppConstantsRecord> iconButtonAppConstantsRecordList =
                  snapshot.data!;
              // Return an empty Container when the document does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final iconButtonAppConstantsRecord =
                  iconButtonAppConstantsRecordList.isNotEmpty
                      ? iconButtonAppConstantsRecordList.first
                      : null;
              return FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.add,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 30,
                ),
                onPressed: () async {
                  logFirebaseEvent('MANAGE_COMMUTES_DRIVER_add_ICN_ON_TAP');
                  if (valueOrDefault<bool>(
                      currentUserDocument?.verifiedUser, false)) {
                    if (valueOrDefault<bool>(
                        currentUserDocument?.verifiedDriver, false)) {
                      if (iconButtonAppConstantsRecord!.freeApp!) {
                        logFirebaseEvent('IconButton_Navigate-To');
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateCommutePageWidget(),
                          ),
                        );
                        return;
                      } else {
                        logFirebaseEvent('IconButton_Alert-Dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Free App Usage Has Expired'),
                              content: Text(
                                  'This free app version has expired. Please update this app and enroll into the driver\'s subscription to continue scheduiing and posting your commutes.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      return;
                    } else {
                      logFirebaseEvent('IconButton_Alert-Dialog');
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Driver\'s License Verification'),
                                content: Text(
                                    'Please upload your driver\'s license and send a request to verify it.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Verify'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        logFirebaseEvent('IconButton_Navigate-To');
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DriversLicenseUpdatePageWidget(),
                          ),
                        );
                        return;
                      } else {
                        return;
                      }
                    }
                  } else {
                    logFirebaseEvent('IconButton_Alert-Dialog');
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Account Verification'),
                              content: Text('Your account is not verified.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Verify'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      logFirebaseEvent('IconButton_Navigate-To');
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'account_page'),
                        ),
                      );
                      return;
                    } else {
                      return;
                    }
                  }
                },
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<List<CommutesRecord>>(
            stream: queryCommutesRecord(
              queryBuilder: (commutesRecord) => commutesRecord
                  .where('driver', isEqualTo: currentUserReference)
                  .where('departure_datetime',
                      isGreaterThanOrEqualTo:
                          FFAppState().filterCurrentDateTime)
                  .orderBy('departure_datetime', descending: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitChasingDots(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),
                );
              }
              List<CommutesRecord> listViewCommutesRecordList = snapshot.data!;
              if (listViewCommutesRecordList.isEmpty) {
                return Center(
                  child: CommutesEmptyWidget(),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewCommutesRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewCommutesRecord =
                      listViewCommutesRecordList[listViewIndex];
                  return FutureBuilder<List<PassengersRecord>>(
                    future: queryPassengersRecordOnce(
                      parent: listViewCommutesRecord.reference,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitChasingDots(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<PassengersRecord> cardPassengersRecordList =
                          snapshot.data!;
                      return InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'MANAGE_COMMUTES_DRIVER_Card_8fa1qyo0_ON_');
                          logFirebaseEvent('Card_Navigate-To');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CommutesManagementDetailsPageWidget(
                                commuteRef: listViewCommutesRecord.reference,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          elevation: 0,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: Icon(
                                          Icons.trip_origin_rounded,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              listViewCommutesRecord.origin!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: Icon(
                                          Icons.location_pin,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              listViewCommutesRecord
                                                  .destination!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: Icon(
                                                  Icons.access_time_rounded,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'jm',
                                                          listViewCommutesRecord
                                                              .departureDatetime!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: Icon(
                                                  Icons.date_range_rounded,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'MMMEd',
                                                          listViewCommutesRecord
                                                              .departureDatetime!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: Icon(
                                                  Icons
                                                      .airline_seat_recline_normal_rounded,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      listViewCommutesRecord
                                                          .availablePassengerSeats!
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .moneyBillWaveAlt,
                                                  color: Colors.black,
                                                  size: 19,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      '${functions.twoDeci(listViewCommutesRecord.pricePerSeat!)} ${listViewCommutesRecord.currency}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 4, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'MANAGE_COMMUTES_DRIVER_CANCEL_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_Alert-Dialog');
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Cancel Commute'),
                                                          content: Text(
                                                              'Are you sure you want to cancel this commute?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text('No'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Yes'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              logFirebaseEvent(
                                                  'Button_Trigger-Push-Notification');
                                              triggerPushNotification(
                                                notificationTitle:
                                                    'Cancellation Notice',
                                                notificationText:
                                                    'The driver of your commute to ${listViewCommutesRecord.destination} on ${dateTimeFormat('MMMMEEEEd', listViewCommutesRecord.departureDatetime)} at ${dateTimeFormat('jm', listViewCommutesRecord.departureDatetime)} has cancelled. Please find a different commute.',
                                                notificationSound: 'default',
                                                userRefs:
                                                    cardPassengersRecordList
                                                        .map((e) =>
                                                            e.passengerAccount!)
                                                        .toList(),
                                                initialPageName:
                                                    'manage_commutes_passenger_page',
                                                parameterData: {},
                                              );
                                              logFirebaseEvent(
                                                  'Button_Backend-Call');
                                              await listViewCommutesRecord
                                                  .reference
                                                  .delete();
                                              return;
                                            } else {
                                              return;
                                            }
                                          },
                                          text: 'Cancel',
                                          icon: Icon(
                                            Icons.cancel_rounded,
                                            size: 15,
                                          ),
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 50,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16,
                                                    ),
                                            elevation: 8,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'MANAGE_COMMUTES_DRIVER_SHARE_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_Alert-Dialog');
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Share Commute Details'),
                                                          content: Text(
                                                              'Are you sure you want to share this commute\'s identifier? It can be used by authorities to request the commute\'s details in the case of an emergency.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              logFirebaseEvent('Button_Share');
                                              await Share.share(
                                                  '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} has shared the following commute identifier with you: ${functions.docRefToString(listViewCommutesRecord.reference)}.');
                                              return;
                                            } else {
                                              return;
                                            }
                                          },
                                          text: 'Share',
                                          icon: Icon(
                                            Icons.share_rounded,
                                            size: 15,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 50,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 8,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
