import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
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
import 'package:provider/provider.dart';

class RequestConfirmationWidget extends StatefulWidget {
  const RequestConfirmationWidget({Key? key}) : super(key: key);

  @override
  _RequestConfirmationWidgetState createState() =>
      _RequestConfirmationWidgetState();
}

class _RequestConfirmationWidgetState extends State<RequestConfirmationWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'requestConfirmation'});
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
            logFirebaseEvent('REQUEST_CONFIRMATION_arrow_back_rounded_');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Confirmation',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.close_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('REQUEST_CONFIRMATION_close_rounded_ICN_O');
              logFirebaseEvent('IconButton_alert_dialog');
              var confirmDialogResponse = await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Cancel Request'),
                        content: Text(
                            'Are you sure you want to cancel this request?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  ) ??
                  false;
              if (confirmDialogResponse) {
                logFirebaseEvent('IconButton_update_local_state');
                FFAppState().tempRequestType = '';
                FFAppState().tempDepartureDateTime = null;
                FFAppState().tempSeats = 0;
                FFAppState().tempPrice = 0.0;
                FFAppState().tempChosenVehicleMaxSeats = 0;
                FFAppState().tempProposingToDrive = false;
                FFAppState().tempPassengerHailingDriverRef = null;
                FFAppState().tempHailingPassengerAccountRef = null;
                FFAppState().tempOriginLatLng = null;
                FFAppState().tempDestinationLatLng = null;
                FFAppState().tempOriginReversed = null;
                FFAppState().tempDestinationReversed = null;
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('beginRequest');

                return;
              } else {
                return;
              }
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  elevation: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          () {
                            if (FFAppState().tempRequestType == 'Drivers') {
                              return 'Request Drivers';
                            } else if (FFAppState().tempProposingToDrive) {
                              return 'Propose To Drive';
                            } else {
                              return 'Request Paasengers';
                            }
                          }(),
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                      ),
                      if (FFAppState().tempOriginReversed != null)
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
                                          '${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['neighborhood']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['locality']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['sublocality']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['sublocality_level_1']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['sublocality_level_2']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['sublocality_level_3']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['sublocality_level_4']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['sublocality_level_5']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['administrative_area_level_1']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['administrative_area_level_2']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['administrative_area_level_3']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['administrative_area_level_4']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['administrative_area_level_5']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['administrative_area_level_6']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['administrative_area_level_7']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['country']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['postal_code']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['postal_code_prefix']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempOriginReversed,
                                        r'''$['postal_town']''',
                                      ).toString())}'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState().tempDestinationReversed != null)
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
                                          '${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['neighborhood']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['locality']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['sublocality']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['sublocality_level_1']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['sublocality_level_2']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['sublocality_level_3']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['sublocality_level_4']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['sublocality_level_5']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['administrative_area_level_1']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['administrative_area_level_2']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['administrative_area_level_3']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['administrative_area_level_4']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['administrative_area_level_5']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['administrative_area_level_6']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['administrative_area_level_7']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['country']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['postal_code']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['postal_code_prefix']''',
                                      ).toString())}${functions.nullTest(getJsonField(
                                        FFAppState().tempDestinationReversed,
                                        r'''$['postal_town']''',
                                      ).toString())}'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState().tempDepartureDateTime != null)
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
                                                FFAppState()
                                                    .tempDepartureDateTime,
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
                                                FFAppState()
                                                    .tempDepartureDateTime,
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
                      if ((FFAppState().tempRequestType == 'Passengers') ||
                          (FFAppState().tempProposingToDrive == true))
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Text(
                                            FFAppState().tempSeats.toString(),
                                            style: FlutterFlowTheme.of(context)
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Text(
                                            '${functions.twoDeci(FFAppState().tempPrice)} ${FFAppState().pickedCurrency}',
                                            style: FlutterFlowTheme.of(context)
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
                      if (FFAppState().chosenVehicle != null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                          child: FutureBuilder<VehiclesRecord>(
                            future: VehiclesRecord.getDocumentOnce(
                                FFAppState().chosenVehicle!),
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
                                      'REQUEST_CONFIRMATION_Image_10rjm7bj_ON_T');
                                  logFirebaseEvent('Image_expand_image');
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
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'REQUEST_CONFIRMATION_SEND_REQUEST_BTN_ON');
                    if (FFAppState().tempRequestType == 'Passengers') {
                      if (FFAppState().tempOriginReversed != null) {
                        if (FFAppState().tempDestinationReversed != null) {
                          if (FFAppState().tempDepartureDateTime != null) {
                            if (FFAppState().chosenVehicle != null) {
                              if (FFAppState().tempSeats != null) {
                                if (functions.isIntGreaterThanZero(
                                    functions.stringNumbertoInt(
                                        FFAppState().tempSeats.toString()))) {
                                  if (FFAppState().tempPrice != null) {
                                    if (functions.isDoubleGreaterThanZero(
                                        functions.stringNumbertoDouble(
                                            FFAppState()
                                                .tempPrice
                                                .toString()))) {
                                      logFirebaseEvent('Button_backend_call');

                                      final commutesCreateData =
                                          createCommutesRecordData(
                                        availablePassengerSeats:
                                            FFAppState().tempSeats,
                                        pricePerSeat: FFAppState().tempPrice,
                                        driver: currentUserReference,
                                        vehicle: FFAppState().chosenVehicle,
                                        departureDatetime:
                                            FFAppState().tempDepartureDateTime,
                                        driversRating: valueOrDefault(
                                            currentUserDocument?.rating, 0.0),
                                        currency: FFAppState().pickedCurrency,
                                        archived: false,
                                        originReversedGeocoded:
                                            createLatlngReverseGeocodingStruct(
                                          neighborhood: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['neighborhood']''',
                                          ).toString(),
                                          locality: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['locality']''',
                                          ).toString(),
                                          sublocality: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['sublocality']''',
                                          ).toString(),
                                          sublocalityLevel1: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['sublocality_level_1']''',
                                          ).toString(),
                                          sublocalityLevel2: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['sublocality_level_2']''',
                                          ).toString(),
                                          sublocalityLevel3: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['sublocality_level_3']''',
                                          ).toString(),
                                          sublocalityLevel4: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['sublocality_level_4']''',
                                          ).toString(),
                                          sublocalityLevel5: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['sublocality_level_5']''',
                                          ).toString(),
                                          administrativeAreaLevel1:
                                              getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['administrative_area_level_1']''',
                                          ).toString(),
                                          administrativeAreaLevel2:
                                              getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['administrative_area_level_2']''',
                                          ).toString(),
                                          administrativeAreaLevel3:
                                              getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['administrative_area_level_3']''',
                                          ).toString(),
                                          administrativeAreaLevel4:
                                              getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['administrative_area_level_4']''',
                                          ).toString(),
                                          administrativeAreaLevel5:
                                              getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['administrative_area_level_5']''',
                                          ).toString(),
                                          administrativeAreaLevel6:
                                              getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['administrative_area_level_6']''',
                                          ).toString(),
                                          administrativeAreaLevel7:
                                              getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['administrative_area_level_7']''',
                                          ).toString(),
                                          country: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['country']''',
                                          ).toString(),
                                          postalCode: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['postal_code']''',
                                          ).toString(),
                                          postalCodePrefix: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['postal_code_prefix']''',
                                          ).toString(),
                                          postalTown: getJsonField(
                                            FFAppState().tempOriginReversed,
                                            r'''$['postal_town']''',
                                          ).toString(),
                                          latlng: FFAppState().tempOriginLatLng,
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        destinationReversedGeocoded:
                                            createLatlngReverseGeocodingStruct(
                                          neighborhood: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['neighborhood']''',
                                          ).toString(),
                                          locality: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['locality']''',
                                          ).toString(),
                                          sublocality: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['sublocality']''',
                                          ).toString(),
                                          sublocalityLevel1: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['sublocality_level_1']''',
                                          ).toString(),
                                          sublocalityLevel2: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['sublocality_level_2']''',
                                          ).toString(),
                                          sublocalityLevel3: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['sublocality_level_3']''',
                                          ).toString(),
                                          sublocalityLevel4: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['sublocality_level_4']''',
                                          ).toString(),
                                          sublocalityLevel5: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['sublocality_level_5']''',
                                          ).toString(),
                                          administrativeAreaLevel1:
                                              getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['administrative_area_level_1']''',
                                          ).toString(),
                                          administrativeAreaLevel2:
                                              getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['administrative_area_level_2']''',
                                          ).toString(),
                                          administrativeAreaLevel3:
                                              getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['administrative_area_level_3']''',
                                          ).toString(),
                                          administrativeAreaLevel4:
                                              getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['administrative_area_level_4']''',
                                          ).toString(),
                                          administrativeAreaLevel5:
                                              getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['administrative_area_level_5']''',
                                          ).toString(),
                                          administrativeAreaLevel6:
                                              getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['administrative_area_level_6']''',
                                          ).toString(),
                                          administrativeAreaLevel7:
                                              getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['administrative_area_level_7']''',
                                          ).toString(),
                                          country: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['country']''',
                                          ).toString(),
                                          postalCode: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['postal_code']''',
                                          ).toString(),
                                          postalCodePrefix: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['postal_code_prefix']''',
                                          ).toString(),
                                          postalTown: getJsonField(
                                            FFAppState()
                                                .tempDestinationReversed,
                                            r'''$['postal_town']''',
                                          ).toString(),
                                          latlng: FFAppState()
                                              .tempDestinationLatLng,
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        createdDatetime: getCurrentTimestamp,
                                      );
                                      await CommutesRecord.collection
                                          .doc()
                                          .set(commutesCreateData);
                                      logFirebaseEvent(
                                          'Button_update_local_state');
                                      FFAppState().chosenVehicle = null;
                                      FFAppState().tempOriginReversed = null;
                                      FFAppState().tempDestinationReversed =
                                          null;
                                      FFAppState().tempRequestType = '';
                                      FFAppState().tempDepartureDateTime = null;
                                      FFAppState().tempSeats = 0;
                                      FFAppState().tempPrice = 0.0;
                                      FFAppState().tempOriginLatLng = null;
                                      FFAppState().tempDestinationLatLng = null;
                                      FFAppState().tempChosenVehicleMaxSeats =
                                          0;
                                      FFAppState().tempProposingToDrive = false;
                                      FFAppState().pickedCurrency = '';
                                      logFirebaseEvent('Button_navigate_to');

                                      context.goNamed('drives');

                                      return;
                                    } else {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Correct Seat Price'),
                                            content: Text(
                                                'Please correctly input the price per seat for your commute.'),
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
                                      return;
                                    }
                                  } else {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(
                                              'Missing Commute Seat Price'),
                                          content: Text(
                                              'Please input your price per seat on this commute.'),
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
                                    return;
                                  }
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Correct Seat Number Info'),
                                        content: Text(
                                            'Please correctly input the number of passenger seats available for sale on your commute. '),
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
                                  return;
                                }
                              } else {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title:
                                          Text('Missing Commute Information'),
                                      content: Text(
                                          'Please input the number of available passenger seats for your commute.'),
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
                                return;
                              }
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Missing Commute Vehicle'),
                                    content: Text(
                                        'Please select a vehicle for your commute.'),
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
                              return;
                            }
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Missing Commute Date and Time'),
                                  content: Text(
                                      'Please select your commute\'s daparture date and time'),
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
                            return;
                          }
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Missing Commute Destination'),
                                content: Text(
                                    'Please select your commute\'s destination physical address.'),
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
                          return;
                        }
                      } else {
                        logFirebaseEvent('Button_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Missing Commute Origin'),
                              content: Text(
                                  'Please select your commute\'s origin physical address.'),
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
                        return;
                      }
                    } else {
                      if (FFAppState().tempProposingToDrive) {
                        if (FFAppState().chosenVehicle != null) {
                          if (FFAppState().tempSeats != null) {
                            if (FFAppState().tempPrice != null) {
                              if (functions.isDoubleGreaterThanZero(
                                  functions.stringNumbertoDouble(
                                      FFAppState().tempPrice.toString()))) {
                                logFirebaseEvent('Button_alert_dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Request To Drive'),
                                              content: Text(
                                                  'Are you sure you want to send this proposal to pick up and drive the passenger to the designated destination?'),
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
                                                  child: Text('Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent('Button_backend_call');

                                  final pickupRequestsCreateData =
                                      createPickupRequestsRecordData(
                                    driver: currentUserReference,
                                    vehicle: FFAppState().chosenVehicle,
                                    availableSeats: FFAppState().tempSeats,
                                    pricePerSeat: FFAppState().tempPrice,
                                    currency: FFAppState().pickedCurrency,
                                    archived: false,
                                  );
                                  await PickupRequestsRecord.createDoc(
                                          FFAppState()
                                              .tempPassengerHailingDriverRef!)
                                      .set(pickupRequestsCreateData);
                                  logFirebaseEvent(
                                      'Button_trigger_push_notification');
                                  triggerPushNotification(
                                    notificationTitle: 'New Pickup Request',
                                    notificationText:
                                        '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} has requested to pick you up for your trip.',
                                    notificationSound: 'default',
                                    userRefs: [
                                      FFAppState()
                                          .tempHailingPassengerAccountRef!
                                    ],
                                    initialPageName: 'driverRequestDetails',
                                    parameterData: {
                                      'hailingDoc': FFAppState()
                                          .tempPassengerHailingDriverRef,
                                      'passenger': FFAppState()
                                          .tempHailingPassengerAccountRef,
                                    },
                                  );
                                  logFirebaseEvent('Button_update_local_state');
                                  FFAppState().tempSeats = 0;
                                  FFAppState().tempPrice = 0.0;
                                  FFAppState().chosenVehicle = null;
                                  FFAppState().tempChosenVehicleMaxSeats = 0;
                                  FFAppState().tempProposingToDrive = false;
                                  FFAppState().tempPassengerHailingDriverRef =
                                      null;
                                  FFAppState().tempHailingPassengerAccountRef =
                                      null;
                                  FFAppState().pickedCurrency = '';
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Pickup Request'),
                                        content: Text(
                                            'Your request has been sent successfully. If approved, you will recieve a notification and the drive will be available to manage.'),
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
                                  logFirebaseEvent('Button_navigate_to');

                                  context.goNamed('drives');

                                  return;
                                } else {
                                  return;
                                }
                              } else {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Correct Seat Price'),
                                      content: Text(
                                          'Please correctly input the price per seat for your commute.'),
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
                                return;
                              }
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Missing Commute Seat Price'),
                                    content: Text(
                                        'Please input your price per seat on this commute.'),
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
                              return;
                            }
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Missing Commute Information'),
                                  content: Text(
                                      'Please input the number of available passenger seats for your commute.'),
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
                            return;
                          }
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Missing Commute Vehicle'),
                                content: Text(
                                    'Please select a vehicle for your commute.'),
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
                          return;
                        }
                      } else {
                        if (FFAppState().tempOriginReversed != null) {
                          if (FFAppState().tempDestinationReversed != null) {
                            if (FFAppState().tempDepartureDateTime != null) {
                              logFirebaseEvent('Button_backend_call');

                              final passengersHailingCreateData =
                                  createPassengersHailingRecordData(
                                departureDatetime:
                                    FFAppState().tempDepartureDateTime,
                                archived: false,
                                originReversedGeocoded:
                                    createLatlngReverseGeocodingStruct(
                                  neighborhood: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['neighborhood']''',
                                  ).toString(),
                                  locality: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['locality']''',
                                  ).toString(),
                                  sublocality: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['sublocality']''',
                                  ).toString(),
                                  sublocalityLevel1: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['sublocality_level_1']''',
                                  ).toString(),
                                  sublocalityLevel2: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['sublocality_level_2']''',
                                  ).toString(),
                                  sublocalityLevel3: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['sublocality_level_3']''',
                                  ).toString(),
                                  sublocalityLevel4: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['sublocality_level_4']''',
                                  ).toString(),
                                  sublocalityLevel5: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['sublocality_level_5']''',
                                  ).toString(),
                                  administrativeAreaLevel1: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['administrative_area_level_1']''',
                                  ).toString(),
                                  administrativeAreaLevel2: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['administrative_area_level_2']''',
                                  ).toString(),
                                  administrativeAreaLevel3: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['administrative_area_level_3']''',
                                  ).toString(),
                                  administrativeAreaLevel4: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['administrative_area_level_4']''',
                                  ).toString(),
                                  administrativeAreaLevel5: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['administrative_area_level_5']''',
                                  ).toString(),
                                  administrativeAreaLevel6: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['administrative_area_level_6']''',
                                  ).toString(),
                                  administrativeAreaLevel7: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['administrative_area_level_7']''',
                                  ).toString(),
                                  country: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['country']''',
                                  ).toString(),
                                  postalCode: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['postal_code']''',
                                  ).toString(),
                                  postalCodePrefix: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['postal_code_prefix']''',
                                  ).toString(),
                                  postalTown: getJsonField(
                                    FFAppState().tempOriginReversed,
                                    r'''$['postal_town']''',
                                  ).toString(),
                                  latlng: FFAppState().tempOriginLatLng,
                                  clearUnsetFields: false,
                                  create: true,
                                ),
                                destinationReversedGeocoded:
                                    createLatlngReverseGeocodingStruct(
                                  neighborhood: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['neighborhood']''',
                                  ).toString(),
                                  locality: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['locality']''',
                                  ).toString(),
                                  sublocality: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['sublocality']''',
                                  ).toString(),
                                  sublocalityLevel1: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['sublocality_level_1']''',
                                  ).toString(),
                                  sublocalityLevel2: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['sublocality_level_2']''',
                                  ).toString(),
                                  sublocalityLevel3: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['sublocality_level_3']''',
                                  ).toString(),
                                  sublocalityLevel4: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['sublocality_level_4']''',
                                  ).toString(),
                                  sublocalityLevel5: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['sublocality_level_5']''',
                                  ).toString(),
                                  administrativeAreaLevel1: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['administrative_area_level_1']''',
                                  ).toString(),
                                  administrativeAreaLevel2: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['administrative_area_level_2']''',
                                  ).toString(),
                                  administrativeAreaLevel3: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['administrative_area_level_3']''',
                                  ).toString(),
                                  administrativeAreaLevel4: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['administrative_area_level_4']''',
                                  ).toString(),
                                  administrativeAreaLevel5: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['administrative_area_level_5']''',
                                  ).toString(),
                                  administrativeAreaLevel6: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['administrative_area_level_6']''',
                                  ).toString(),
                                  administrativeAreaLevel7: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['administrative_area_level_7']''',
                                  ).toString(),
                                  country: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['country']''',
                                  ).toString(),
                                  postalCode: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['postal_code']''',
                                  ).toString(),
                                  postalCodePrefix: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['postal_code_prefix']''',
                                  ).toString(),
                                  postalTown: getJsonField(
                                    FFAppState().tempDestinationReversed,
                                    r'''$['postal_town']''',
                                  ).toString(),
                                  latlng: FFAppState().tempDestinationLatLng,
                                  clearUnsetFields: false,
                                  create: true,
                                ),
                                hailingPassenger: currentUserReference,
                                createdDatetime: getCurrentTimestamp,
                              );
                              await PassengersHailingRecord.collection
                                  .doc()
                                  .set(passengersHailingCreateData);
                              logFirebaseEvent('Button_update_local_state');
                              FFAppState().seatsPageInitialIndex = 1;
                              FFAppState().tempOriginReversed = null;
                              FFAppState().tempDestinationReversed = null;
                              FFAppState().tempDepartureDateTime = null;
                              logFirebaseEvent('Button_navigate_to');

                              context.goNamed('seats');

                              return;
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title:
                                        Text('Missing Commute Date and Time'),
                                    content: Text(
                                        'Please select your commute\'s daparture date and time'),
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
                              return;
                            }
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Missing Commute Destination'),
                                  content: Text(
                                      'Please select your commute\'s destination physical address.'),
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
                            return;
                          }
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Missing Commute Origin'),
                                content: Text(
                                    'Please select your commute\'s origin physical address.'),
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
                          return;
                        }
                      }
                    }
                  },
                  text: 'Send Request',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    elevation: 8,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
