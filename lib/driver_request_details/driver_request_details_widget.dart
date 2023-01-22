import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/no_drivers_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DriverRequestDetailsWidget extends StatefulWidget {
  const DriverRequestDetailsWidget({
    Key? key,
    this.hailingDoc,
    this.passenger,
  }) : super(key: key);

  final PassengersHailingRecord? hailingDoc;
  final UsersRecord? passenger;

  @override
  _DriverRequestDetailsWidgetState createState() =>
      _DriverRequestDetailsWidgetState();
}

class _DriverRequestDetailsWidgetState
    extends State<DriverRequestDetailsWidget> {
  CommutesRecord? createdCommute;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _currentPageLink = '';
  dynamic? reverseGeocodeDestinationOutput1;
  dynamic? reverseGeocodeDestinationOutput;
  dynamic? reverseGeocodeOriginOutput;
  dynamic? reverseGeocodeOriginOutput1;
  dynamic? reverseGeocodeOriginOutput2;
  dynamic? reverseGeocodeDestinationOutput2;

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'driverRequestDetails'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('DRIVER_REQUEST_DETAILS_arrow_back_rounde');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Driver Request',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        actions: [
          Builder(
            builder: (context) => FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.share_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('DRIVER_REQUEST_DETAILS_share_rounded_ICN');
                logFirebaseEvent('IconButton_generate_current_page_link');
                _currentPageLink = await generateCurrentPageLink(
                  context,
                  title: 'Commute Ridesharing: Driver Required',
                  description:
                      'Drive me from ${functions.trimCommaEnd('${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalTown!)}')} to ${functions.trimCommaEnd('${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalTown!)}')}, on ${dateTimeFormat(
                    'MMMEd',
                    widget.hailingDoc!.departureDatetime,
                    locale: FFLocalizations.of(context).languageCode,
                  )}, ${dateTimeFormat(
                    'jm',
                    widget.hailingDoc!.departureDatetime,
                    locale: FFLocalizations.of(context).languageCode,
                  )}.',
                  isShortLink: false,
                );

                logFirebaseEvent('IconButton_share');
                await Share.share(
                  _currentPageLink,
                  sharePositionOrigin: getWidgetBoundingBox(context),
                );
              },
            ),
          ),
          Visibility(
            visible:
                currentUserReference != widget.hailingDoc!.hailingPassenger,
            child: FutureBuilder<AppConstantsRecord>(
              future: AppConstantsRecord.getDocumentOnce(
                  FFAppState().appConstantFreeApp!),
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
                final sendSeatRequestIconAppConstantsRecord = snapshot.data!;
                return FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.send_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'DRIVER_REQUEST_DETAILS_sendSeatRequestIc');
                    var _shouldSetState = false;
                    if (widget.hailingDoc!.archived!) {
                      logFirebaseEvent('sendSeatRequestIcon_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Driver Request Expired '),
                            content: Text(
                                'This request for a driver has expired. The passenger has either selected a different driver or has cancelled the commute.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Continue'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    } else {
                      if (sendSeatRequestIconAppConstantsRecord.freeApp!) {
                        if (functions.swaziNumberTest(currentPhoneNumber)) {
                          if (valueOrDefault<bool>(
                              currentUserDocument?.verifiedUser, false)) {
                            if (valueOrDefault<bool>(
                                currentUserDocument?.verifiedDriver, false)) {
                              if (getCurrentTimestamp <
                                  widget.hailingDoc!.departureDatetime!) {
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_custom_action');
                                reverseGeocodeOriginOutput =
                                    await actions.reverseGeocode(
                                  widget.hailingDoc!.originReversedGeocoded
                                      .latlng!,
                                );
                                _shouldSetState = true;
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_custom_action');
                                reverseGeocodeDestinationOutput =
                                    await actions.reverseGeocode(
                                  widget.hailingDoc!.destinationReversedGeocoded
                                      .latlng!,
                                );
                                _shouldSetState = true;
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_update_local_state');
                                FFAppState().tempProposingToDrive = true;
                                FFAppState().tempPassengerHailingDriverRef =
                                    widget.hailingDoc!.reference;
                                FFAppState().tempHailingPassengerAccountRef =
                                    widget.passenger!.reference;
                                FFAppState().tempDestinationLatLng = widget
                                    .hailingDoc!
                                    .destinationReversedGeocoded
                                    .latlng;
                                FFAppState().tempOriginReversed =
                                    reverseGeocodeOriginOutput!;
                                FFAppState().tempDestinationReversed =
                                    reverseGeocodeDestinationOutput!;
                                FFAppState().tempDepartureDateTime =
                                    widget.hailingDoc!.departureDatetime;
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_navigate_to');

                                context.pushNamed('chooseVehicle');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Driver Request Expired'),
                                      content: Text(
                                          'Please note that you are unable to propose to drive this passenger. This proposal is past the scheduled depature time.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Continue'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              logFirebaseEvent(
                                  'sendSeatRequestIcon_alert_dialog');
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Driver\'s License Verification'),
                                            content: Text(
                                                'Please upload your driver\'s license and send a request to verify it.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Verify'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_navigate_to');

                                context.pushNamed('driversLicense');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            }
                          } else {
                            logFirebaseEvent(
                                'sendSeatRequestIcon_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Account Verification'),
                                      content:
                                          Text('Your account is not verified.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Verify'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              logFirebaseEvent(
                                  'sendSeatRequestIcon_navigate_to');

                              context.pushNamed('account');

                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          }
                        } else {
                          logFirebaseEvent('sendSeatRequestIcon_revenue_cat');
                          final isEntitled =
                              await revenue_cat.isEntitled('Driver Access');
                          if (isEntitled == null) {
                            return;
                          } else if (!isEntitled) {
                            await revenue_cat.loadOfferings();
                          }

                          if (isEntitled) {
                            if (valueOrDefault<bool>(
                                currentUserDocument?.verifiedUser, false)) {
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.verifiedDriver, false)) {
                                if (getCurrentTimestamp <
                                    widget.hailingDoc!.departureDatetime!) {
                                  logFirebaseEvent(
                                      'sendSeatRequestIcon_custom_action');
                                  reverseGeocodeOriginOutput1 =
                                      await actions.reverseGeocode(
                                    widget.hailingDoc!.originReversedGeocoded
                                        .latlng!,
                                  );
                                  _shouldSetState = true;
                                  logFirebaseEvent(
                                      'sendSeatRequestIcon_custom_action');
                                  reverseGeocodeDestinationOutput1 =
                                      await actions.reverseGeocode(
                                    widget.hailingDoc!
                                        .destinationReversedGeocoded.latlng!,
                                  );
                                  _shouldSetState = true;
                                  logFirebaseEvent(
                                      'sendSeatRequestIcon_update_local_state');
                                  FFAppState().tempProposingToDrive = true;
                                  FFAppState().tempPassengerHailingDriverRef =
                                      widget.hailingDoc!.reference;
                                  FFAppState().tempHailingPassengerAccountRef =
                                      widget.passenger!.reference;
                                  FFAppState().tempDestinationLatLng = widget
                                      .hailingDoc!
                                      .destinationReversedGeocoded
                                      .latlng;
                                  FFAppState().tempOriginReversed =
                                      reverseGeocodeOriginOutput1!;
                                  FFAppState().tempDestinationReversed =
                                      reverseGeocodeDestinationOutput1!;
                                  FFAppState().tempDepartureDateTime =
                                      widget.hailingDoc!.departureDatetime;
                                  logFirebaseEvent(
                                      'sendSeatRequestIcon_navigate_to');

                                  context.pushNamed('chooseVehicle');

                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  logFirebaseEvent(
                                      'sendSeatRequestIcon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Driver Request Expired'),
                                        content: Text(
                                            'Please note that you are unable to propose to drive this passenger. This proposal is past the scheduled depature time.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Continue'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              } else {
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_alert_dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Driver\'s License Verification'),
                                              content: Text(
                                                  'Please upload your driver\'s license and send a request to verify it.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Verify'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent(
                                      'sendSeatRequestIcon_navigate_to');

                                  context.pushNamed('driversLicense');

                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              }
                            } else {
                              logFirebaseEvent(
                                  'sendSeatRequestIcon_alert_dialog');
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Account Verification'),
                                            content: Text(
                                                'Your account is not verified.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Verify'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_navigate_to');

                                context.pushNamed('account');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            }
                          } else {
                            logFirebaseEvent(
                                'sendSeatRequestIcon_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Driver Subscription'),
                                      content: Text(
                                          'To accept passengers into your commute, please subscribe.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Subscribe'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              logFirebaseEvent(
                                  'sendSeatRequestIcon_navigate_to');

                              context.pushNamed('subscription');
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                            return;
                          }
                        }
                      } else {
                        logFirebaseEvent('sendSeatRequestIcon_revenue_cat');
                        final isEntitled =
                            await revenue_cat.isEntitled('Driver Access');
                        if (isEntitled == null) {
                          return;
                        } else if (!isEntitled) {
                          await revenue_cat.loadOfferings();
                        }

                        if (isEntitled) {
                          if (valueOrDefault<bool>(
                              currentUserDocument?.verifiedUser, false)) {
                            if (valueOrDefault<bool>(
                                currentUserDocument?.verifiedDriver, false)) {
                              if (getCurrentTimestamp <
                                  widget.hailingDoc!.departureDatetime!) {
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_custom_action');
                                reverseGeocodeOriginOutput2 =
                                    await actions.reverseGeocode(
                                  widget.hailingDoc!.originReversedGeocoded
                                      .latlng!,
                                );
                                _shouldSetState = true;
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_custom_action');
                                reverseGeocodeDestinationOutput2 =
                                    await actions.reverseGeocode(
                                  widget.hailingDoc!.destinationReversedGeocoded
                                      .latlng!,
                                );
                                _shouldSetState = true;
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_update_local_state');
                                FFAppState().tempProposingToDrive = true;
                                FFAppState().tempPassengerHailingDriverRef =
                                    widget.hailingDoc!.reference;
                                FFAppState().tempHailingPassengerAccountRef =
                                    widget.passenger!.reference;
                                FFAppState().tempDestinationLatLng = widget
                                    .hailingDoc!
                                    .destinationReversedGeocoded
                                    .latlng;
                                FFAppState().tempOriginReversed =
                                    reverseGeocodeOriginOutput2!;
                                FFAppState().tempDestinationReversed =
                                    reverseGeocodeDestinationOutput2!;
                                FFAppState().tempDepartureDateTime =
                                    widget.hailingDoc!.departureDatetime;
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_navigate_to');

                                context.pushNamed('chooseVehicle');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Driver Request Expired'),
                                      content: Text(
                                          'Please note that you are unable to propose to drive this passenger. This proposal is past the scheduled depature time.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Continue'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              logFirebaseEvent(
                                  'sendSeatRequestIcon_alert_dialog');
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Driver\'s License Verification'),
                                            content: Text(
                                                'Please upload your driver\'s license and send a request to verify it.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Verify'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                logFirebaseEvent(
                                    'sendSeatRequestIcon_navigate_to');

                                context.pushNamed('driversLicense');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            }
                          } else {
                            logFirebaseEvent(
                                'sendSeatRequestIcon_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Account Verification'),
                                      content:
                                          Text('Your account is not verified.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Verify'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              logFirebaseEvent(
                                  'sendSeatRequestIcon_navigate_to');

                              context.pushNamed('account');

                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          }
                        } else {
                          logFirebaseEvent('sendSeatRequestIcon_alert_dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Driver Subscription'),
                                    content: Text(
                                        'To accept passengers into your commute, please subscribe.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Subscribe'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            logFirebaseEvent('sendSeatRequestIcon_navigate_to');

                            context.pushNamed('subscription');
                          } else {
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                          return;
                        }
                      }
                    }

                    if (_shouldSetState) setState(() {});
                  },
                );
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    elevation: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (currentUserReference !=
                            widget.hailingDoc!.hailingPassenger)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DRIVER_REQUEST_DETAILS_CircleImage_bb2ru');
                                    logFirebaseEvent(
                                        'CircleImage_expand_image');
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: CachedNetworkImage(
                                            imageUrl:
                                                widget.passenger!.photoUrl!,
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: widget.passenger!.photoUrl!,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: widget.passenger!.photoUrl!,
                                    transitionOnUserGestures: true,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.passenger!.photoUrl!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 10, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.passenger!.displayName} ${widget.passenger!.displaySurname}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Text(
                                          widget.passenger!.gender!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (widget.passenger!.rating! > 0.0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          functions.twoDeci(
                                              widget.passenger!.rating!),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: Icon(
                                  Icons.trip_origin_rounded,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 3, 0, 0),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Text(
                                      functions.trimCommaEnd(
                                          '${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalTown!)}'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: Icon(
                                  Icons.location_pin,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 3, 0, 0),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Text(
                                      functions.trimCommaEnd(
                                          '${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalTown!)}'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 4, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 4, 0),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Text(
                                              dateTimeFormat(
                                                'jm',
                                                widget.hailingDoc!
                                                    .departureDatetime!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 4, 0),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Text(
                                              dateTimeFormat(
                                                'MMMEd',
                                                widget.hailingDoc!
                                                    .departureDatetime!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                  child: Text(
                    'Pending Pick Up Requests',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: StreamBuilder<List<PickupRequestsRecord>>(
                    stream: queryPickupRequestsRecord(
                      parent: widget.hailingDoc!.reference,
                      queryBuilder: (pickupRequestsRecord) =>
                          pickupRequestsRecord.where('archived',
                              isEqualTo: false),
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
                      List<PickupRequestsRecord>
                          listViewPickupRequestsRecordList = snapshot.data!;
                      if (listViewPickupRequestsRecordList.isEmpty) {
                        return NoDriversWidget();
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewPickupRequestsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewPickupRequestsRecord =
                              listViewPickupRequestsRecordList[listViewIndex];
                          return StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                listViewPickupRequestsRecord.driver!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitChasingDots(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final cardUsersRecord = snapshot.data!;
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF1F4F8),
                                                shape: BoxShape.circle,
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'DRIVER_REQUEST_DETAILS_CircleImage_o4al2');
                                                  logFirebaseEvent(
                                                      'CircleImage_expand_image');
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              cardUsersRecord
                                                                  .photoUrl!,
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: cardUsersRecord
                                                            .photoUrl!,
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag:
                                                      cardUsersRecord.photoUrl!,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl: cardUsersRecord
                                                          .photoUrl!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 10, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${cardUsersRecord.displayName} ${cardUsersRecord.displaySurname}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Text(
                                                    cardUsersRecord.gender!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 10, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                if (currentUserReference !=
                                                    widget.hailingDoc!
                                                        .hailingPassenger)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .moneyBillWave,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 18,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Text(
                                                          '${functions.twoDeci(listViewPickupRequestsRecord.pricePerSeat!)} ${listViewPickupRequestsRecord.currency}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if ((currentUserReference ==
                                                        widget.hailingDoc!
                                                            .hailingPassenger) &&
                                                    (cardUsersRecord.rating! >
                                                        0.0))
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        functions.twoDeci(
                                                            cardUsersRecord
                                                                .rating!),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                      Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 18,
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (currentUserReference ==
                                        widget.hailingDoc!.hailingPassenger)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child:
                                                  FutureBuilder<VehiclesRecord>(
                                                future: VehiclesRecord
                                                    .getDocumentOnce(
                                                        listViewPickupRequestsRecord
                                                            .vehicle!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            SpinKitChasingDots(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final imageVehiclesRecord =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'DRIVER_REQUEST_DETAILS_Image_ppod9h8a_ON');
                                                      logFirebaseEvent(
                                                          'Image_expand_image');
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  valueOrDefault<
                                                                      String>(
                                                                imageVehiclesRecord
                                                                    .imageURL,
                                                                'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                                              ),
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: valueOrDefault<
                                                                String>(
                                                              imageVehiclesRecord
                                                                  .imageURL,
                                                              'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3' +
                                                                  '$listViewIndex',
                                                            ),
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: valueOrDefault<
                                                          String>(
                                                        imageVehiclesRecord
                                                            .imageURL,
                                                        'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3' +
                                                            '$listViewIndex',
                                                      ),
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            imageVehiclesRecord
                                                                .imageURL,
                                                            'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                                          ),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 4, 4, 4),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 4, 0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .moneyBillWaveAlt,
                                                            color: Colors.black,
                                                            size: 19,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${functions.twoDeci(listViewPickupRequestsRecord.pricePerSeat!)} ${listViewPickupRequestsRecord.currency}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (currentUserReference ==
                                        widget.hailingDoc!.hailingPassenger)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 4, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'DRIVER_REQUEST_DETAILS_DECLINE_BTN_ON_TA');
                                                    logFirebaseEvent(
                                                        'Button_trigger_push_notification');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Pickup Request Rejected',
                                                      notificationText:
                                                          'Your request to drive ${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} from ${functions.trimCommaEnd('${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalTown!)}')} to ${functions.trimCommaEnd('${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalTown!)}')} has been declined.',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        listViewPickupRequestsRecord
                                                            .driver!
                                                      ],
                                                      initialPageName: 'seats',
                                                      parameterData: {},
                                                    );
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    final pickupRequestsUpdateData =
                                                        createPickupRequestsRecordData(
                                                      archived: true,
                                                    );
                                                    await listViewPickupRequestsRecord
                                                        .reference
                                                        .update(
                                                            pickupRequestsUpdateData);
                                                  },
                                                  text: 'Decline',
                                                  icon: Icon(
                                                    Icons.cancel_rounded,
                                                    size: 15,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 50,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                    elevation: 8,
                                                    borderSide: BorderSide(
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: FutureBuilder<
                                                    AppConstantsRecord>(
                                                  future: AppConstantsRecord
                                                      .getDocumentOnce(FFAppState()
                                                          .appConstantFreeApp!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              SpinKitChasingDots(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final buttonAppConstantsRecord =
                                                        snapshot.data!;
                                                    return FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'DRIVER_REQUEST_DETAILS_ACCEPT_BTN_ON_TAP');
                                                        var _shouldSetState =
                                                            false;
                                                        if (valueOrDefault<
                                                                bool>(
                                                            currentUserDocument
                                                                ?.verifiedUser,
                                                            false)) {
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          final commutesCreateData =
                                                              createCommutesRecordData(
                                                            vehicle:
                                                                listViewPickupRequestsRecord
                                                                    .vehicle,
                                                            availablePassengerSeats:
                                                                functions.availableSeatsMinusOne(
                                                                    listViewPickupRequestsRecord
                                                                        .availableSeats!),
                                                            pricePerSeat:
                                                                listViewPickupRequestsRecord
                                                                    .pricePerSeat,
                                                            driver:
                                                                listViewPickupRequestsRecord
                                                                    .driver,
                                                            departureDatetime:
                                                                widget
                                                                    .hailingDoc!
                                                                    .departureDatetime,
                                                            driversRating:
                                                                cardUsersRecord
                                                                    .rating,
                                                            currency:
                                                                listViewPickupRequestsRecord
                                                                    .currency,
                                                            archived: false,
                                                            originReversedGeocoded:
                                                                updateLatlngReverseGeocodingStruct(
                                                              widget.hailingDoc!
                                                                  .originReversedGeocoded,
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                            destinationReversedGeocoded:
                                                                updateLatlngReverseGeocodingStruct(
                                                              widget.hailingDoc!
                                                                  .destinationReversedGeocoded,
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                          );
                                                          var commutesRecordReference =
                                                              CommutesRecord
                                                                  .collection
                                                                  .doc();
                                                          await commutesRecordReference
                                                              .set(
                                                                  commutesCreateData);
                                                          createdCommute = CommutesRecord
                                                              .getDocumentFromData(
                                                                  commutesCreateData,
                                                                  commutesRecordReference);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          final passengersCreateData =
                                                              createPassengersRecordData(
                                                            passengerAccount: widget
                                                                .hailingDoc!
                                                                .hailingPassenger,
                                                            accepted: true,
                                                            commuteDatetime: widget
                                                                .hailingDoc!
                                                                .departureDatetime,
                                                            archived: false,
                                                          );
                                                          await PassengersRecord
                                                                  .createDoc(
                                                                      createdCommute!
                                                                          .reference)
                                                              .set(
                                                                  passengersCreateData);
                                                          logFirebaseEvent(
                                                              'Button_trigger_push_notification');
                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'Pickup Request Accepted',
                                                            notificationText:
                                                                'Your request to drive ${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} from ${functions.trimCommaEnd('${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.hailingDoc!.destinationReversedGeocoded.postalTown!)}')} to ${functions.trimCommaEnd('${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.hailingDoc!.originReversedGeocoded.postalTown!)}')}on ${dateTimeFormat(
                                                              'MMMEd',
                                                              widget.hailingDoc!
                                                                  .departureDatetime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}, ${dateTimeFormat(
                                                              'jm',
                                                              widget.hailingDoc!
                                                                  .departureDatetime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}has been accepted.',
                                                            userRefs: [
                                                              listViewPickupRequestsRecord
                                                                  .driver!
                                                            ],
                                                            initialPageName:
                                                                'drives',
                                                            parameterData: {},
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          final passengersHailingUpdateData =
                                                              createPassengersHailingRecordData(
                                                            archived: true,
                                                          );
                                                          await widget
                                                              .hailingDoc!
                                                              .reference
                                                              .update(
                                                                  passengersHailingUpdateData);
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          final pickupRequestsUpdateData =
                                                              createPickupRequestsRecordData(
                                                            archived: true,
                                                          );
                                                          await listViewPickupRequestsRecord
                                                              .reference
                                                              .update(
                                                                  pickupRequestsUpdateData);
                                                          logFirebaseEvent(
                                                              'Button_update_local_state');
                                                          FFAppState()
                                                              .seatsPageInitialIndex = 0;
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.pushNamed(
                                                              'seats');

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_alert_dialog');
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Account Verification'),
                                                                        content:
                                                                            Text('Your account is not verified.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Verify'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            logFirebaseEvent(
                                                                'Button_navigate_to');

                                                            context.pushNamed(
                                                                'account');

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          } else {
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      text: 'Accept',
                                                      icon: Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        size: 15,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 50,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                        elevation: 8,
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
