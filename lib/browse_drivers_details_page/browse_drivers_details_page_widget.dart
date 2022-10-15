import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/no_passengers_widget.dart';
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

class BrowseDriversDetailsPageWidget extends StatefulWidget {
  const BrowseDriversDetailsPageWidget({
    Key? key,
    this.commuteDoc,
    this.driverDoc,
  }) : super(key: key);

  final CommutesRecord? commuteDoc;
  final UsersRecord? driverDoc;

  @override
  _BrowseDriversDetailsPageWidgetState createState() =>
      _BrowseDriversDetailsPageWidgetState();
}

class _BrowseDriversDetailsPageWidgetState
    extends State<BrowseDriversDetailsPageWidget> {
  String _currentPageLink = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'browse_drivers_details_page'});
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
            logFirebaseEvent('BROWSE_DRIVERS_DETAILS_arrow_back_rounde');
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
          FlutterFlowIconButton(
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
              logFirebaseEvent('BROWSE_DRIVERS_DETAILS_share_rounded_ICN');
              logFirebaseEvent('IconButton_Generate-Current-Page-Link');
              _currentPageLink = await generateCurrentPageLink(
                context,
                title: 'Commute: Passengers  Required',
                description:
                    'Send me a seat request to join my drive from ${widget.commuteDoc!.origin} to ${widget.commuteDoc!.destination}, on ${dateTimeFormat(
                  'MMMMEEEEd',
                  widget.commuteDoc!.departureDatetime,
                  locale: FFLocalizations.of(context).languageCode,
                )}, at ${dateTimeFormat(
                  'jm',
                  widget.commuteDoc!.departureDatetime,
                  locale: FFLocalizations.of(context).languageCode,
                )}.',
              );

              logFirebaseEvent('IconButton_Share');
              await Share.share(_currentPageLink);
            },
          ),
          Visibility(
            visible: currentUserReference != widget.commuteDoc!.driver,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.call_rounded,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('BROWSE_DRIVERS_DETAILS_call_rounded_ICN_');
                logFirebaseEvent('IconButton_Launch-U-R-L');
                await launchURL('tel:${widget.driverDoc!.phoneNumber}');
              },
            ),
          ),
          Visibility(
            visible: currentUserReference != widget.driverDoc!.reference,
            child: FlutterFlowIconButton(
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
                logFirebaseEvent('BROWSE_DRIVERS_DETAILS_sendSeatRequestIc');
                if (valueOrDefault<bool>(
                    currentUserDocument?.verifiedUser, false)) {
                  logFirebaseEvent('sendSeatRequestIcon_Backend-Call');

                  final passengersCreateData = createPassengersRecordData(
                    passengerAccount: currentUserReference,
                    accepted: false,
                  );
                  await PassengersRecord.createDoc(widget.commuteDoc!.reference)
                      .set(passengersCreateData);
                  logFirebaseEvent('sendSeatRequestIcon_Trigger-Push-Notific');
                  triggerPushNotification(
                    notificationTitle: 'New Seat Request',
                    notificationText:
                        'You have recieved a new seat request for your commute to ${widget.commuteDoc!.destination} on ${dateTimeFormat(
                      'MMMMEEEEd',
                      widget.commuteDoc!.departureDatetime,
                      locale: FFLocalizations.of(context).languageCode,
                    )} at ${dateTimeFormat(
                      'jm',
                      widget.commuteDoc!.departureDatetime,
                      locale: FFLocalizations.of(context).languageCode,
                    )}.',
                    notificationSound: 'default',
                    userRefs: [widget.commuteDoc!.driver!],
                    initialPageName: 'manage_commutes_driver_page',
                    parameterData: {},
                  );
                  logFirebaseEvent('sendSeatRequestIcon_Alert-Dialog');
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Seat Request Confirmation'),
                        content: Text(
                            'Your request for a seat on this commute has been sent to the driver. You will receive a notification to inform you whether your request has been accepted or rejected.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  logFirebaseEvent('sendSeatRequestIcon_Navigate-Back');
                  context.pop();
                  return;
                } else {
                  logFirebaseEvent('sendSeatRequestIcon_Alert-Dialog');
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
                    logFirebaseEvent('sendSeatRequestIcon_Navigate-To');

                    context.goNamed('account_page');

                    return;
                  } else {
                    return;
                  }
                }
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
                  child: FutureBuilder<UsersRecord>(
                    future:
                        UsersRecord.getDocumentOnce(widget.commuteDoc!.driver!),
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
                      final cardUsersRecord = snapshot.data!;
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        elevation: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'BROWSE_DRIVERS_DETAILS_CircleImage_rjes6');
                                      logFirebaseEvent(
                                          'CircleImage_Expand-Image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                cardUsersRecord.photoUrl,
                                                'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: valueOrDefault<String>(
                                              cardUsersRecord.photoUrl,
                                              'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                            ),
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: valueOrDefault<String>(
                                        cardUsersRecord.photoUrl,
                                        'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                      ),
                                      transitionOnUserGestures: true,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: valueOrDefault<String>(
                                            cardUsersRecord.photoUrl,
                                            'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                          ),
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
                                            '${cardUsersRecord.displayName} ${cardUsersRecord.displaySurname}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Text(
                                            cardUsersRecord.gender!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (cardUsersRecord.rating! > 0.0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            functions.twoDeci(
                                                cardUsersRecord.rating!),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: FutureBuilder<VehiclesRecord>(
                                future: VehiclesRecord.getDocumentOnce(
                                    widget.commuteDoc!.vehicle!),
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
                                  final imageVehiclesRecord = snapshot.data!;
                                  return InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'BROWSE_DRIVERS_DETAILS_Image_ksspjqww_ON');
                                      logFirebaseEvent('Image_Expand-Image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                imageVehiclesRecord.imageURL,
                                                'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: valueOrDefault<String>(
                                              imageVehiclesRecord.imageURL,
                                              'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                            ),
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: valueOrDefault<String>(
                                        imageVehiclesRecord.imageURL,
                                        'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                      ),
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl: valueOrDefault<String>(
                                            imageVehiclesRecord.imageURL,
                                            'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
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
                                            'Origin: ${widget.commuteDoc!.origin}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              'Address: ${widget.commuteDoc!.originAddress}',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
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
                                            'Destination: ${widget.commuteDoc!.destination}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              'Address: ${widget.commuteDoc!.destinationAddress}',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
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
                                                child: Text(
                                                  dateTimeFormat(
                                                    'jm',
                                                    widget.commuteDoc!
                                                        .departureDatetime!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
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
                                                child: Text(
                                                  dateTimeFormat(
                                                    'MMMEd',
                                                    widget.commuteDoc!
                                                        .departureDatetime!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                            Row(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Text(
                                                widget.commuteDoc!
                                                    .availablePassengerSeats!
                                                    .toString(),
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
                                            child: FaIcon(
                                              FontAwesomeIcons.moneyBillWaveAlt,
                                              color: Colors.black,
                                              size: 19,
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
                                                '${functions.twoDeci(widget.commuteDoc!.pricePerSeat!)} ${widget.commuteDoc!.currency}',
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
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                  child: Text(
                    'Pending Seat Requests',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: StreamBuilder<List<PassengersRecord>>(
                    stream: queryPassengersRecord(
                      parent: widget.commuteDoc!.reference,
                      queryBuilder: (passengersRecord) =>
                          passengersRecord.where('accepted', isEqualTo: false),
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
                      List<PassengersRecord> listViewPassengersRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewPassengersRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewPassengersRecord =
                              listViewPassengersRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  listViewPassengersRecord.passengerAccount!),
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
                                        0, 0, 0, 8),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 4, 0),
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
                                                          'BROWSE_DRIVERS_DETAILS_CircleImage_y0dr9');
                                                      logFirebaseEvent(
                                                          'CircleImage_Expand-Image');
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
                                                                  cardUsersRecord
                                                                      .photoUrl!,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: cardUsersRecord
                                                                .photoUrl!,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: cardUsersRecord
                                                          .photoUrl!,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              cardUsersRecord
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${cardUsersRecord.displayName} ${cardUsersRecord.displaySurname}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                      Text(
                                                        cardUsersRecord.gender!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (cardUsersRecord.rating !=
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            functions.twoDeci(
                                                                cardUsersRecord
                                                                    .rating!),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                          Icon(
                                                            Icons.star_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                          if (currentUserReference ==
                                              widget.commuteDoc!.driver)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'BROWSE_DRIVERS_DETAILS_DECLINE_BTN_ON_TA');
                                                          logFirebaseEvent(
                                                              'Button_Trigger-Push-Notification');
                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'Seat Request Declined',
                                                            notificationText:
                                                                'Your request for a seat on the commute from ${widget.commuteDoc!.origin} to ${widget.commuteDoc!.destination} has been declined.',
                                                            notificationSound:
                                                                'default',
                                                            userRefs: [
                                                              cardUsersRecord
                                                                  .reference
                                                            ],
                                                            initialPageName:
                                                                'manage_commutes_passenger_page',
                                                            parameterData: {},
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_Backend-Call');
                                                          await listViewPassengersRecord
                                                              .reference
                                                              .delete();
                                                          logFirebaseEvent(
                                                              'Button_Alert-Dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Notice'),
                                                                content: Text(
                                                                    'The user has been notified of your decision.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        text: 'Decline',
                                                        icon: Icon(
                                                          Icons.cancel_rounded,
                                                          size: 15,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 50,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
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
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: FutureBuilder<
                                                          AppConstantsRecord>(
                                                        future: AppConstantsRecord
                                                            .getDocumentOnce(
                                                                FFAppState()
                                                                    .appConstantFreeApp!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitChasingDots(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final buttonAppConstantsRecord =
                                                              snapshot.data!;
                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'BROWSE_DRIVERS_DETAILS_ACCEPT_BTN_ON_TAP');
                                                              if (buttonAppConstantsRecord
                                                                  .freeApp!) {
                                                                if (functions
                                                                    .swaziNumberTest(
                                                                        currentPhoneNumber)) {
                                                                  if (cardUsersRecord
                                                                      .verifiedUser!) {
                                                                    if (cardUsersRecord
                                                                        .verifiedDriver!) {
                                                                      logFirebaseEvent(
                                                                          'Button_Backend-Call');

                                                                      final passengersUpdateData =
                                                                          createPassengersRecordData(
                                                                        accepted:
                                                                            true,
                                                                        commuteDatetime: widget
                                                                            .commuteDoc!
                                                                            .departureDatetime,
                                                                      );
                                                                      await listViewPassengersRecord
                                                                          .reference
                                                                          .update(
                                                                              passengersUpdateData);
                                                                      logFirebaseEvent(
                                                                          'Button_Backend-Call');

                                                                      final commutesUpdateData =
                                                                          {
                                                                        'available_passenger_seats':
                                                                            FieldValue.increment(-(1)),
                                                                      };
                                                                      await listViewPassengersRecord
                                                                          .parentReference
                                                                          .update(
                                                                              commutesUpdateData);
                                                                      logFirebaseEvent(
                                                                          'Button_Trigger-Push-Notification');
                                                                      triggerPushNotification(
                                                                        notificationTitle:
                                                                            'Seat Request Accepted',
                                                                        notificationText:
                                                                            'Your request for a seat on the commute from ${widget.commuteDoc!.origin} to ${widget.commuteDoc!.destination} has been accepted.',
                                                                        notificationSound:
                                                                            'default',
                                                                        userRefs: [
                                                                          cardUsersRecord
                                                                              .reference
                                                                        ],
                                                                        initialPageName:
                                                                            'manage_commutes_passenger_page',
                                                                        parameterData: {},
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_Alert-Dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Notice'),
                                                                            content:
                                                                                Text('The user has been notified of your decision.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      return;
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_Alert-Dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Driver\'s License Verification'),
                                                                                content: Text('Please upload your driver\'s license and send a request to verify it.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Verify'),
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
                                                                            'drivers_license_update_page');

                                                                        return;
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_Alert-Dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Account Verification'),
                                                                                  content: Text('Your account is not verified.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Verify'),
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

                                                                      return;
                                                                    } else {
                                                                      return;
                                                                    }
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Button_Revenue-Cat');
                                                                  final isEntitled =
                                                                      await revenue_cat
                                                                          .isEntitled(
                                                                              'Driver Access');
                                                                  if (isEntitled ==
                                                                      null) {
                                                                    return;
                                                                  } else if (!isEntitled) {
                                                                    await revenue_cat
                                                                        .loadOfferings();
                                                                  }

                                                                  if (isEntitled) {
                                                                    if (cardUsersRecord
                                                                        .verifiedUser!) {
                                                                      if (cardUsersRecord
                                                                          .verifiedDriver!) {
                                                                        logFirebaseEvent(
                                                                            'Button_Backend-Call');

                                                                        final passengersUpdateData =
                                                                            createPassengersRecordData(
                                                                          accepted:
                                                                              true,
                                                                          commuteDatetime: widget
                                                                              .commuteDoc!
                                                                              .departureDatetime,
                                                                        );
                                                                        await listViewPassengersRecord
                                                                            .reference
                                                                            .update(passengersUpdateData);
                                                                        logFirebaseEvent(
                                                                            'Button_Backend-Call');

                                                                        final commutesUpdateData =
                                                                            {
                                                                          'available_passenger_seats':
                                                                              FieldValue.increment(-(1)),
                                                                        };
                                                                        await listViewPassengersRecord
                                                                            .parentReference
                                                                            .update(commutesUpdateData);
                                                                        logFirebaseEvent(
                                                                            'Button_Trigger-Push-Notification');
                                                                        triggerPushNotification(
                                                                          notificationTitle:
                                                                              'Seat Request Accepted',
                                                                          notificationText:
                                                                              'Your request for a seat on the commute from ${widget.commuteDoc!.origin} to ${widget.commuteDoc!.destination} has been accepted.',
                                                                          notificationSound:
                                                                              'default',
                                                                          userRefs: [
                                                                            cardUsersRecord.reference
                                                                          ],
                                                                          initialPageName:
                                                                              'manage_commutes_passenger_page',
                                                                          parameterData: {},
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_Alert-Dialog');
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Notice'),
                                                                              content: Text('The user has been notified of your decision.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        return;
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_Alert-Dialog');
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Driver\'s License Verification'),
                                                                                  content: Text('Please upload your driver\'s license and send a request to verify it.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Verify'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          logFirebaseEvent(
                                                                              'Button_Navigate-To');

                                                                          context
                                                                              .pushNamed('drivers_license_update_page');

                                                                          return;
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      }
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_Alert-Dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Account Verification'),
                                                                                content: Text('Your account is not verified.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Verify'),
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

                                                                        return;
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_Alert-Dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Driver Subscription'),
                                                                                  content: Text('To accept passengers into your commute, please subscribe.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Subscribe'),
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
                                                                          'subscriptions_page');
                                                                    } else {
                                                                      return;
                                                                    }

                                                                    return;
                                                                  }
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Button_Revenue-Cat');
                                                                final isEntitled =
                                                                    await revenue_cat
                                                                        .isEntitled(
                                                                            'Driver Access');
                                                                if (isEntitled ==
                                                                    null) {
                                                                  return;
                                                                } else if (!isEntitled) {
                                                                  await revenue_cat
                                                                      .loadOfferings();
                                                                }

                                                                if (isEntitled) {
                                                                  if (cardUsersRecord
                                                                      .verifiedUser!) {
                                                                    if (cardUsersRecord
                                                                        .verifiedDriver!) {
                                                                      logFirebaseEvent(
                                                                          'Button_Backend-Call');

                                                                      final passengersUpdateData =
                                                                          createPassengersRecordData(
                                                                        accepted:
                                                                            true,
                                                                        commuteDatetime: widget
                                                                            .commuteDoc!
                                                                            .departureDatetime,
                                                                      );
                                                                      await listViewPassengersRecord
                                                                          .reference
                                                                          .update(
                                                                              passengersUpdateData);
                                                                      logFirebaseEvent(
                                                                          'Button_Backend-Call');

                                                                      final commutesUpdateData =
                                                                          {
                                                                        'available_passenger_seats':
                                                                            FieldValue.increment(-(1)),
                                                                      };
                                                                      await listViewPassengersRecord
                                                                          .parentReference
                                                                          .update(
                                                                              commutesUpdateData);
                                                                      logFirebaseEvent(
                                                                          'Button_Trigger-Push-Notification');
                                                                      triggerPushNotification(
                                                                        notificationTitle:
                                                                            'Seat Request Accepted',
                                                                        notificationText:
                                                                            'Your request for a seat on the commute from ${widget.commuteDoc!.origin} to ${widget.commuteDoc!.destination} has been accepted.',
                                                                        notificationSound:
                                                                            'default',
                                                                        userRefs: [
                                                                          cardUsersRecord
                                                                              .reference
                                                                        ],
                                                                        initialPageName:
                                                                            'manage_commutes_passenger_page',
                                                                        parameterData: {},
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_Alert-Dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Notice'),
                                                                            content:
                                                                                Text('The user has been notified of your decision.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      return;
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_Alert-Dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Driver\'s License Verification'),
                                                                                content: Text('Please upload your driver\'s license and send a request to verify it.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Verify'),
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
                                                                            'drivers_license_update_page');

                                                                        return;
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_Alert-Dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Account Verification'),
                                                                                  content: Text('Your account is not verified.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Verify'),
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

                                                                      return;
                                                                    } else {
                                                                      return;
                                                                    }
                                                                  }
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
                                                                                title: Text('Driver Subscription'),
                                                                                content: Text('To accept passengers into your commute, please subscribe.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Subscribe'),
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
                                                                        'subscriptions_page');
                                                                  } else {
                                                                    return;
                                                                  }

                                                                  return;
                                                                }
                                                              }
                                                            },
                                                            text: 'Accept',
                                                            icon: Icon(
                                                              Icons
                                                                  .check_circle_rounded,
                                                              size: 15,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 130,
                                                              height: 50,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                              elevation: 8,
                                                              borderSide:
                                                                  BorderSide(
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
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
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                  child: Text(
                    'Accepted Passengers',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: StreamBuilder<List<PassengersRecord>>(
                    stream: queryPassengersRecord(
                      parent: widget.commuteDoc!.reference,
                      queryBuilder: (passengersRecord) =>
                          passengersRecord.where('accepted', isEqualTo: true),
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
                      List<PassengersRecord> listViewPassengersRecordList =
                          snapshot.data!;
                      if (listViewPassengersRecordList.isEmpty) {
                        return NoPassengersWidget();
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewPassengersRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewPassengersRecord =
                              listViewPassengersRecordList[listViewIndex];
                          return StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                listViewPassengersRecord.passengerAccount!),
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
                                                  'BROWSE_DRIVERS_DETAILS_CircleImage_ym60z');
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
                                                  Text(
                                                    functions.twoDeci(
                                                        cardUsersRecord
                                                            .rating!),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 18,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (currentUserReference ==
                                          widget.commuteDoc!.driver)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            icon: Icon(
                                              Icons.call_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'BROWSE_DRIVERS_DETAILS_call_rounded_ICN_');
                                              logFirebaseEvent(
                                                  'IconButton_Launch-U-R-L');
                                              await launchURL(
                                                  'tel:${cardUsersRecord.phoneNumber}');
                                            },
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
