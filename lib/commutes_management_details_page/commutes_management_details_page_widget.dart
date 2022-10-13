import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../drivers_license_update_page/drivers_license_update_page_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../subscriptions_page/subscriptions_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class CommutesManagementDetailsPageWidget extends StatefulWidget {
  const CommutesManagementDetailsPageWidget({
    Key? key,
    this.commuteRef,
  }) : super(key: key);

  final DocumentReference? commuteRef;

  @override
  _CommutesManagementDetailsPageWidgetState createState() =>
      _CommutesManagementDetailsPageWidgetState();
}

class _CommutesManagementDetailsPageWidgetState
    extends State<CommutesManagementDetailsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'commutes_management_details_page'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CommutesRecord>(
      stream: CommutesRecord.getDocument(widget.commuteRef!),
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
        final commutesManagementDetailsPageCommutesRecord = snapshot.data!;
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
                logFirebaseEvent('COMMUTES_MANAGEMENT_DETAILS_arrow_back_r');
                logFirebaseEvent('IconButton_Navigate-Back');
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Details',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
            actions: [
              Visibility(
                visible: currentUserReference !=
                    commutesManagementDetailsPageCommutesRecord.driver,
                child: FutureBuilder<UsersRecord>(
                  future: UsersRecord.getDocumentOnce(
                      commutesManagementDetailsPageCommutesRecord.driver!),
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
                    final iconButtonUsersRecord = snapshot.data!;
                    return FlutterFlowIconButton(
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
                        logFirebaseEvent(
                            'COMMUTES_MANAGEMENT_DETAILS_call_rounded');
                        logFirebaseEvent('IconButton_Launch-U-R-L');
                        await launchURL(
                            'tel:${iconButtonUsersRecord.phoneNumber}');
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Text(
                        'Accepted Passengers',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<PassengersRecord>>(
                        stream: queryPassengersRecord(
                          parent: widget.commuteRef,
                          queryBuilder: (passengersRecord) => passengersRecord
                              .where('accepted', isEqualTo: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitChasingDots(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<PassengersRecord> listViewPassengersRecordList =
                              snapshot.data!;
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
                                                      'COMMUTES_MANAGEMENT_DETAILS_CircleImage_');
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
                                          if (currentUserReference ==
                                              commutesManagementDetailsPageCommutesRecord
                                                  .driver)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 10, 0, 0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderWidth: 1,
                                                buttonSize: 40,
                                                icon: Icon(
                                                  Icons.call_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'COMMUTES_MANAGEMENT_DETAILS_call_rounded');
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
                    Divider(
                      height: 32,
                      thickness: 1,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Text(
                        'New Requests',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<PassengersRecord>>(
                        stream: queryPassengersRecord(
                          parent: widget.commuteRef,
                          queryBuilder: (passengersRecord) => passengersRecord
                              .where('accepted', isEqualTo: false),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitChasingDots(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<PassengersRecord> listViewPassengersRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewPassengersRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewPassengersRecord =
                                  listViewPassengersRecordList[listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      listViewPassengersRecord
                                          .passengerAccount!),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 0),
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF1F4F8),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'COMMUTES_MANAGEMENT_DETAILS_CircleImage_');
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
                                                              shape: BoxShape
                                                                  .circle,
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 10, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${cardUsersRecord.displayName} ${cardUsersRecord.displaySurname}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                          Text(
                                                            cardUsersRecord
                                                                .gender!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (cardUsersRecord.rating !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                functions.twoDeci(
                                                                    cardUsersRecord
                                                                        .rating!),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .star_rounded,
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
                                                ],
                                              ),
                                              if (currentUserReference ==
                                                  commutesManagementDetailsPageCommutesRecord
                                                      .driver)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 4, 0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'COMMUTES_MANAGEMENT_DETAILS_DECLINE_BTN_');
                                                              logFirebaseEvent(
                                                                  'Button_Backend-Call');
                                                              await listViewPassengersRecord
                                                                  .reference
                                                                  .delete();
                                                              logFirebaseEvent(
                                                                  'Button_Trigger-Push-Notification');
                                                              triggerPushNotification(
                                                                notificationTitle:
                                                                    'Seat Request Declined',
                                                                notificationText:
                                                                    'Your request for a seat on the commute from ${commutesManagementDetailsPageCommutesRecord.origin} to ${commutesManagementDetailsPageCommutesRecord.destination} has been declined.',
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
                                                                    title: Text(
                                                                        'Notice'),
                                                                    content: Text(
                                                                        'The user has been notified of your decision.'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
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
                                                              Icons
                                                                  .cancel_rounded,
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
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
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
                                                                  child:
                                                                      SizedBox(
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
                                                                  snapshot
                                                                      .data!;
                                                              return FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'COMMUTES_MANAGEMENT_DETAILS_ACCEPT_BTN_O');
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
                                                                            commuteDatetime:
                                                                                commutesManagementDetailsPageCommutesRecord.departureDatetime,
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
                                                                                'Your request for a seat on the commute from ${commutesManagementDetailsPageCommutesRecord.origin} to ${commutesManagementDetailsPageCommutesRecord.destination} has been accepted.',
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
                                                                            logFirebaseEvent('Button_Navigate-To');
                                                                            await Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => DriversLicenseUpdatePageWidget(),
                                                                              ),
                                                                            );
                                                                            return;
                                                                          } else {
                                                                            return;
                                                                          }
                                                                        }
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_Alert-Dialog');
                                                                        var confirmDialogResponse = await showDialog<bool>(
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
                                                                          await Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                              builder: (context) => NavBarPage(initialPage: 'account_page'),
                                                                            ),
                                                                          );
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
                                                                              .isEntitled('Driver Access');
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
                                                                            logFirebaseEvent('Button_Backend-Call');

                                                                            final passengersUpdateData =
                                                                                createPassengersRecordData(
                                                                              accepted: true,
                                                                              commuteDatetime: commutesManagementDetailsPageCommutesRecord.departureDatetime,
                                                                            );
                                                                            await listViewPassengersRecord.reference.update(passengersUpdateData);
                                                                            logFirebaseEvent('Button_Backend-Call');

                                                                            final commutesUpdateData =
                                                                                {
                                                                              'available_passenger_seats': FieldValue.increment(-(1)),
                                                                            };
                                                                            await listViewPassengersRecord.parentReference.update(commutesUpdateData);
                                                                            logFirebaseEvent('Button_Trigger-Push-Notification');
                                                                            triggerPushNotification(
                                                                              notificationTitle: 'Seat Request Accepted',
                                                                              notificationText: 'Your request for a seat on the commute from ${commutesManagementDetailsPageCommutesRecord.origin} to ${commutesManagementDetailsPageCommutesRecord.destination} has been accepted.',
                                                                              notificationSound: 'default',
                                                                              userRefs: [
                                                                                cardUsersRecord.reference
                                                                              ],
                                                                              initialPageName: 'manage_commutes_passenger_page',
                                                                              parameterData: {},
                                                                            );
                                                                            logFirebaseEvent('Button_Alert-Dialog');
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
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
                                                                            logFirebaseEvent('Button_Alert-Dialog');
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
                                                                              logFirebaseEvent('Button_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => DriversLicenseUpdatePageWidget(),
                                                                                ),
                                                                              );
                                                                              return;
                                                                            } else {
                                                                              return;
                                                                            }
                                                                          }
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Button_Alert-Dialog');
                                                                          var confirmDialogResponse = await showDialog<bool>(
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
                                                                            logFirebaseEvent('Button_Navigate-To');
                                                                            await Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => NavBarPage(initialPage: 'account_page'),
                                                                              ),
                                                                            );
                                                                            return;
                                                                          } else {
                                                                            return;
                                                                          }
                                                                        }
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_Alert-Dialog');
                                                                        var confirmDialogResponse = await showDialog<bool>(
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
                                                                          await Navigator
                                                                              .push(
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
                                                                    logFirebaseEvent(
                                                                        'Button_Revenue-Cat');
                                                                    final isEntitled =
                                                                        await revenue_cat
                                                                            .isEntitled('Driver Access');
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
                                                                            commuteDatetime:
                                                                                commutesManagementDetailsPageCommutesRecord.departureDatetime,
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
                                                                                'Your request for a seat on the commute from ${commutesManagementDetailsPageCommutesRecord.origin} to ${commutesManagementDetailsPageCommutesRecord.destination} has been accepted.',
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
                                                                            logFirebaseEvent('Button_Navigate-To');
                                                                            await Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => DriversLicenseUpdatePageWidget(),
                                                                              ),
                                                                            );
                                                                            return;
                                                                          } else {
                                                                            return;
                                                                          }
                                                                        }
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_Alert-Dialog');
                                                                        var confirmDialogResponse = await showDialog<bool>(
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
                                                                          await Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                              builder: (context) => NavBarPage(initialPage: 'account_page'),
                                                                            ),
                                                                          );
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
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                SubscriptionsPageWidget(),
                                                                          ),
                                                                        );
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  textStyle: FlutterFlowTheme.of(
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
