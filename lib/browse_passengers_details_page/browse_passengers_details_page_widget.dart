import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/no_drivers_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';

class BrowsePassengersDetailsPageWidget extends StatefulWidget {
  const BrowsePassengersDetailsPageWidget({
    Key? key,
    this.hailingDoc,
    this.passenger,
  }) : super(key: key);

  final PassengersHailingRecord? hailingDoc;
  final UsersRecord? passenger;

  @override
  _BrowsePassengersDetailsPageWidgetState createState() =>
      _BrowsePassengersDetailsPageWidgetState();
}

class _BrowsePassengersDetailsPageWidgetState
    extends State<BrowsePassengersDetailsPageWidget> {
  CommutesRecord? createdCommute;
  String _currentPageLink = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'browse_passengers_details_page'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('BROWSE_PASSENGERS_DETAILS_arrow_back_rou');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          'Commute Details',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
        actions: [
          Visibility(
            visible:
                currentUserReference == widget.hailingDoc!.hailingPassenger,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.share_rounded,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('BROWSE_PASSENGERS_DETAILS_share_rounded_');
                logFirebaseEvent('IconButton_Generate-Current-Page-Link');
                _currentPageLink = await generateCurrentPageLink(
                  context,
                  title: 'Commute: Driver Required',
                  description:
                      'Send me a request to drive me from ${widget.hailingDoc!.origin} to ${widget.hailingDoc!.destination}, on ${dateTimeFormat(
                    'MMMEd',
                    widget.hailingDoc!.departureDatetime,
                    locale: FFLocalizations.of(context).languageCode,
                  )}at ${dateTimeFormat(
                    'jm',
                    widget.hailingDoc!.departureDatetime,
                    locale: FFLocalizations.of(context).languageCode,
                  )}.',
                );

                logFirebaseEvent('IconButton_Share');
                await Share.share(_currentPageLink);
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
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 30,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'BROWSE_PASSENGERS_DETAILS_sendSeatReques');
                    if (sendSeatRequestIconAppConstantsRecord.freeApp!) {
                      if (functions.swaziNumberTest(currentPhoneNumber)) {
                        if (valueOrDefault<bool>(
                            currentUserDocument?.verifiedUser, false)) {
                          if (valueOrDefault<bool>(
                              currentUserDocument?.verifiedDriver, false)) {
                            logFirebaseEvent('sendSeatRequestIcon_Navigate-To');

                            context.pushNamed(
                              'propose_passenger_pickup_page',
                              queryParams: {
                                'passengerHail': serializeParam(
                                  widget.hailingDoc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'passengerHail': widget.hailingDoc,
                              },
                            );

                            return;
                          } else {
                            logFirebaseEvent(
                                'sendSeatRequestIcon_Alert-Dialog');
                            var confirmDialogResponse = await showDialog<bool>(
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
                                  'sendSeatRequestIcon_Navigate-To');

                              context.pushNamed('drivers_license_update_page');

                              return;
                            } else {
                              return;
                            }
                          }
                        } else {
                          logFirebaseEvent('sendSeatRequestIcon_Alert-Dialog');
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
                            logFirebaseEvent('sendSeatRequestIcon_Navigate-To');

                            context.pushNamed('account_page');

                            return;
                          } else {
                            return;
                          }
                        }
                      } else {
                        logFirebaseEvent('sendSeatRequestIcon_Revenue-Cat');
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
                              logFirebaseEvent(
                                  'sendSeatRequestIcon_Navigate-To');

                              context.pushNamed(
                                'propose_passenger_pickup_page',
                                queryParams: {
                                  'passengerHail': serializeParam(
                                    widget.hailingDoc,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'passengerHail': widget.hailingDoc,
                                },
                              );

                              return;
                            } else {
                              logFirebaseEvent(
                                  'sendSeatRequestIcon_Alert-Dialog');
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
                                    'sendSeatRequestIcon_Navigate-To');

                                context
                                    .pushNamed('drivers_license_update_page');

                                return;
                              } else {
                                return;
                              }
                            }
                          } else {
                            logFirebaseEvent(
                                'sendSeatRequestIcon_Alert-Dialog');
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
                                  'sendSeatRequestIcon_Navigate-To');

                              context.pushNamed('account_page');

                              return;
                            } else {
                              return;
                            }
                          }
                        } else {
                          logFirebaseEvent('sendSeatRequestIcon_Alert-Dialog');
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
                            logFirebaseEvent('sendSeatRequestIcon_Navigate-To');

                            context.pushNamed('subscriptions_page');
                          } else {
                            return;
                          }

                          return;
                        }
                      }
                    } else {
                      logFirebaseEvent('sendSeatRequestIcon_Revenue-Cat');
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
                            logFirebaseEvent('sendSeatRequestIcon_Navigate-To');

                            context.pushNamed(
                              'propose_passenger_pickup_page',
                              queryParams: {
                                'passengerHail': serializeParam(
                                  widget.hailingDoc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'passengerHail': widget.hailingDoc,
                              },
                            );

                            return;
                          } else {
                            logFirebaseEvent(
                                'sendSeatRequestIcon_Alert-Dialog');
                            var confirmDialogResponse = await showDialog<bool>(
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
                                  'sendSeatRequestIcon_Navigate-To');

                              context.pushNamed('drivers_license_update_page');

                              return;
                            } else {
                              return;
                            }
                          }
                        } else {
                          logFirebaseEvent('sendSeatRequestIcon_Alert-Dialog');
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
                            logFirebaseEvent('sendSeatRequestIcon_Navigate-To');

                            context.pushNamed('account_page');

                            return;
                          } else {
                            return;
                          }
                        }
                      } else {
                        logFirebaseEvent('sendSeatRequestIcon_Alert-Dialog');
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
                          logFirebaseEvent('sendSeatRequestIcon_Navigate-To');

                          context.pushNamed('subscriptions_page');
                        } else {
                          return;
                        }

                        return;
                      }
                    }
                  },
                );
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                                        'BROWSE_PASSENGERS_DETAILS_CircleImage_bb');
                                    logFirebaseEvent(
                                        'CircleImage_Expand-Image');
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
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Origin: ${widget.hailingDoc!.origin}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'Address: ${widget.hailingDoc!.originAddress}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
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
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Destination: ${widget.hailingDoc!.destination}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'Address: ${widget.hailingDoc!.destinationAddress}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
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
                    'Pickup Requests By Drivers',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: StreamBuilder<List<PickupRequestsRecord>>(
                    stream: queryPickupRequestsRecord(
                      parent: widget.hailingDoc!.reference,
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
                                                      'BROWSE_PASSENGERS_DETAILS_CircleImage_o4');
                                                  logFirebaseEvent(
                                                      'CircleImage_Expand-Image');
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
                                                          'BROWSE_PASSENGERS_DETAILS_Image_ppod9h8a');
                                                      logFirebaseEvent(
                                                          'Image_Expand-Image');
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
                                                        'BROWSE_PASSENGERS_DETAILS_DECLINE_BTN_ON');
                                                    logFirebaseEvent(
                                                        'Button_Trigger-Push-Notification');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Pickup Request Rejected',
                                                      notificationText:
                                                          'Your request to drive ${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} from ${widget.hailingDoc!.origin} to ${widget.hailingDoc!.destination} has been declined.',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        listViewPickupRequestsRecord
                                                            .driver!
                                                      ],
                                                      initialPageName:
                                                          'manage_commutes_passenger_page',
                                                      parameterData: {},
                                                    );
                                                    logFirebaseEvent(
                                                        'Button_Backend-Call');
                                                    await listViewPickupRequestsRecord
                                                        .reference
                                                        .delete();
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
                                                            'BROWSE_PASSENGERS_DETAILS_ACCEPT_BTN_ON_');
                                                        var _shouldSetState =
                                                            false;
                                                        if (valueOrDefault<
                                                                bool>(
                                                            currentUserDocument
                                                                ?.verifiedUser,
                                                            false)) {
                                                          logFirebaseEvent(
                                                              'Button_Backend-Call');

                                                          final commutesCreateData =
                                                              createCommutesRecordData(
                                                            origin: widget
                                                                .hailingDoc!
                                                                .origin,
                                                            destination: widget
                                                                .hailingDoc!
                                                                .destination,
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
                                                            originAddress: widget
                                                                .hailingDoc!
                                                                .originAddress,
                                                            destinationAddress:
                                                                widget
                                                                    .hailingDoc!
                                                                    .destinationAddress,
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
                                                              'Button_Backend-Call');

                                                          final passengersCreateData =
                                                              createPassengersRecordData(
                                                            passengerAccount: widget
                                                                .hailingDoc!
                                                                .hailingPassenger,
                                                            accepted: true,
                                                            commuteDatetime: widget
                                                                .hailingDoc!
                                                                .departureDatetime,
                                                          );
                                                          await PassengersRecord
                                                                  .createDoc(
                                                                      createdCommute!
                                                                          .reference)
                                                              .set(
                                                                  passengersCreateData);
                                                          logFirebaseEvent(
                                                              'Button_Trigger-Push-Notification');
                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'Pickup Request Accepted',
                                                            notificationText:
                                                                'Your request to drive ${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} from ${widget.hailingDoc!.origin} to ${widget.hailingDoc!.destination}on ${dateTimeFormat(
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
                                                                'delete_commutes_management_details_page',
                                                            parameterData: {
                                                              'commuteRef':
                                                                  createdCommute!
                                                                      .reference,
                                                            },
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_Backend-Call');
                                                          await widget
                                                              .hailingDoc!
                                                              .reference
                                                              .delete();
                                                          logFirebaseEvent(
                                                              'Button_Navigate-Back');
                                                          context.pop();
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_Alert-Dialog');
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
                                                                'Button_Navigate-To');

                                                            context.pushNamed(
                                                                'account_page');

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
