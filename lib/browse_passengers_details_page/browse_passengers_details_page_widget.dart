import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/no_passengers_widget.dart';
import '../drivers_license_update_page/drivers_license_update_page_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../propose_passenger_pickup_page/propose_passenger_pickup_page_widget.dart';
import '../subscriptions_page/subscriptions_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

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
            Navigator.pop(context);
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
          FutureBuilder<AppConstantsRecord>(
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
                  logFirebaseEvent('BROWSE_PASSENGERS_DETAILS_sendSeatReques');
                  if (sendSeatRequestIconAppConstantsRecord.freeApp!) {
                    if (functions.swaziNumberTest(currentPhoneNumber)) {
                      if (valueOrDefault<bool>(
                          currentUserDocument?.verifiedUser, false)) {
                        if (valueOrDefault<bool>(
                            currentUserDocument?.verifiedDriver, false)) {
                          logFirebaseEvent('sendSeatRequestIcon_Navigate-To');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProposePassengerPickupPageWidget(
                                passengerHail: widget.hailingDoc,
                              ),
                            ),
                          );
                          return;
                        } else {
                          logFirebaseEvent('sendSeatRequestIcon_Alert-Dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title:
                                        Text('Driver\'s License Verification'),
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
                            logFirebaseEvent('sendSeatRequestIcon_Navigate-To');
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
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProposePassengerPickupPageWidget(
                                  passengerHail: widget.hailingDoc,
                                ),
                              ),
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
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubscriptionsPageWidget(),
                            ),
                          );
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
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProposePassengerPickupPageWidget(
                                passengerHail: widget.hailingDoc,
                              ),
                            ),
                          );
                          return;
                        } else {
                          logFirebaseEvent('sendSeatRequestIcon_Alert-Dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title:
                                        Text('Driver\'s License Verification'),
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
                            logFirebaseEvent('sendSeatRequestIcon_Navigate-To');
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
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Subscribe'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        logFirebaseEvent('sendSeatRequestIcon_Navigate-To');
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubscriptionsPageWidget(),
                          ),
                        );
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
                                  logFirebaseEvent('CircleImage_Expand-Image');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: CachedNetworkImage(
                                          imageUrl: widget.passenger!.photoUrl!,
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
                                        functions
                                            .twoDeci(widget.passenger!.rating!),
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
                    'Pickup Requests By Other Drivers',
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
                        return NoPassengersWidget();
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
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
                                child: Padding(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: CachedNetworkImage(
                                                      imageUrl: cardUsersRecord
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
                                              tag: cardUsersRecord.photoUrl!,
                                              transitionOnUserGestures: true,
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      cardUsersRecord.photoUrl!,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 10, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${cardUsersRecord.displayName} ${cardUsersRecord.displaySurname}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Text(
                                                cardUsersRecord.gender!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (cardUsersRecord.rating != null)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 10, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .moneyBillWave,
                                                    color: FlutterFlowTheme.of(
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
