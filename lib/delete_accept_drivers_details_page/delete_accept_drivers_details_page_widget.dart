import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/no_driver_requesting_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class DeleteAcceptDriversDetailsPageWidget extends StatefulWidget {
  const DeleteAcceptDriversDetailsPageWidget({
    Key? key,
    this.hailDoc,
  }) : super(key: key);

  final PassengersHailingRecord? hailDoc;

  @override
  _DeleteAcceptDriversDetailsPageWidgetState createState() =>
      _DeleteAcceptDriversDetailsPageWidgetState();
}

class _DeleteAcceptDriversDetailsPageWidgetState
    extends State<DeleteAcceptDriversDetailsPageWidget> {
  CommutesRecord? createdCommute;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'delete_accept_drivers_details_page'});
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
            logFirebaseEvent('DELETE_ACCEPT_DRIVERS_DETAILS_arrow_back');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          'Accept Driver',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Text(
                    'Requests',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<PickupRequestsRecord>>(
                    stream: queryPickupRequestsRecord(
                      parent: widget.hailDoc!.reference,
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
                        return Center(
                          child: NoDriverRequestingWidget(),
                        );
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
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: FutureBuilder<UsersRecord>(
                              future: UsersRecord.getDocumentOnce(
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
                                        0, 0, 0, 8),
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
                                                        'DELETE_ACCEPT_DRIVERS_DETAILS_CircleImag');
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
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CachedNetworkImage(
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
                                                      CrossAxisAlignment.start,
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
                                            if (cardUsersRecord.rating != null)
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
                                                          textAlign:
                                                              TextAlign.center,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FutureBuilder<
                                                    VehiclesRecord>(
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
                                                            'DELETE_ACCEPT_DRIVERS_DETAILS_Image_6rjp');
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
                                                              tag:
                                                                  valueOrDefault<
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
                                                            width:
                                                                MediaQuery.of(
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .moneyBillWaveAlt,
                                                              color:
                                                                  Colors.black,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                          'DELETE_ACCEPT_DRIVERS_DETAILS_DECLINE_BT');
                                                      logFirebaseEvent(
                                                          'Button_Trigger-Push-Notification');
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'Pickup Request Rejected',
                                                        notificationText:
                                                            'Your request to drive ${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} from ${widget.hailDoc!.origin} to ${widget.hailDoc!.destination} has been declined.',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                        .getDocumentOnce(
                                                            FFAppState()
                                                                .appConstantFreeApp!),
                                                    builder:
                                                        (context, snapshot) {
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
                                                              'DELETE_ACCEPT_DRIVERS_DETAILS_ACCEPT_BTN');
                                                          var _shouldSetState =
                                                              false;
                                                          if (cardUsersRecord
                                                              .verifiedUser!) {
                                                            logFirebaseEvent(
                                                                'Button_Backend-Call');

                                                            final commutesCreateData =
                                                                createCommutesRecordData(
                                                              origin: widget
                                                                  .hailDoc!
                                                                  .origin,
                                                              destination: widget
                                                                  .hailDoc!
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
                                                                      .hailDoc!
                                                                      .departureDatetime,
                                                              driversRating:
                                                                  cardUsersRecord
                                                                      .rating,
                                                              currency:
                                                                  listViewPickupRequestsRecord
                                                                      .currency,
                                                              originAddress: widget
                                                                  .hailDoc!
                                                                  .originAddress,
                                                              destinationAddress:
                                                                  widget
                                                                      .hailDoc!
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
                                                              passengerAccount:
                                                                  widget
                                                                      .hailDoc!
                                                                      .hailingPassenger,
                                                              accepted: true,
                                                              commuteDatetime:
                                                                  widget
                                                                      .hailDoc!
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
                                                                  'Your request to drive ${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} from ${widget.hailDoc!.origin} to ${widget.hailDoc!.destination}on ${dateTimeFormat(
                                                                'MMMEd',
                                                                widget.hailDoc!
                                                                    .departureDatetime,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )}, ${dateTimeFormat(
                                                                'jm',
                                                                widget.hailDoc!
                                                                    .departureDatetime,
                                                                locale: FFLocalizations.of(
                                                                        context)
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
                                                                .hailDoc!
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
                                                                          title:
                                                                              Text('Account Verification'),
                                                                          content:
                                                                              Text('Your account is not verified.'),
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
                                );
                              },
                            ),
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
