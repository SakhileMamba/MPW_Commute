import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/commutes_empty_widget.dart';
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
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'drives_model.dart';
export 'drives_model.dart';

class DrivesWidget extends StatefulWidget {
  const DrivesWidget({Key? key}) : super(key: key);

  @override
  _DrivesWidgetState createState() => _DrivesWidgetState();
}

class _DrivesWidgetState extends State<DrivesWidget> {
  late DrivesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrivesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'drives'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 48, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DRIVES_PAGE_CircleImage_tghl7lml_ON_TAP');
                                  logFirebaseEvent(
                                      'CircleImage_update_app_state');
                                  FFAppState().currentPhotoURLTemp =
                                      currentUserPhoto;
                                  logFirebaseEvent('CircleImage_navigate_to');

                                  context.pushNamed('profilePicture');
                                },
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.6,
                                ),
                                decoration: BoxDecoration(),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.verifiedUser, false))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Icon(
                                      Icons.verified_user_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24,
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
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('DRIVES_PAGE_ListTile_9agyyi4k_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.goNamed('beginRequest');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.directions_car_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Send Request',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryText,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('DRIVES_PAGE_ListTile_zntqrzan_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.goNamed('drivers');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.commute_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Browse Drivers',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryText,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('DRIVES_PAGE_ListTile_g2iiey4u_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.goNamed('passengers');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.emoji_people,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Browse Hailers',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryText,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('DRIVES_PAGE_ListTile_rf71qzwc_ON_TAP');
                    logFirebaseEvent('ListTile_drawer');
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
                  },
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.road,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Manage Drives',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryText,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('DRIVES_PAGE_ListTile_drrv9qyb_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.goNamed('seats');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.airline_seat_recline_normal_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Manage Seats',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryText,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('DRIVES_PAGE_ListTile_bfmcnu0m_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.goNamed('announcements');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.announcement_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Announcements',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryText,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('DRIVES_PAGE_ListTile_s72l9e7q_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.goNamed('account');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Account',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryText,
                    dense: false,
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.menu_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('DRIVES_PAGE_menu_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_drawer');
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(
            'Drives',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: StreamBuilder<List<CommutesRecord>>(
              stream: queryCommutesRecord(
                queryBuilder: (commutesRecord) => commutesRecord
                    .where('driver', isEqualTo: currentUserReference)
                    .where('archived', isEqualTo: false)
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
                List<CommutesRecord> listViewCommutesRecordList =
                    snapshot.data!;
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
                    return StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(
                          listViewCommutesRecord.driver!),
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
                        final cardUsersRecord = snapshot.data!;
                        return InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'DRIVES_PAGE_Card_8fa1qyo0_ON_TAP');
                            logFirebaseEvent('Card_navigate_to');

                            context.pushNamed(
                              'driveDetails',
                              queryParams: {
                                'commuteDoc': serializeParam(
                                  listViewCommutesRecord,
                                  ParamType.Document,
                                ),
                                'driverDoc': serializeParam(
                                  cardUsersRecord,
                                  ParamType.Document,
                                ),
                                'notNotificationOpen': serializeParam(
                                  true,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'commuteDoc': listViewCommutesRecord,
                                'driverDoc': cardUsersRecord,
                              },
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 4, 0),
                                          child: Icon(
                                            Icons.trip_origin_rounded,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 3, 0, 0),
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Text(
                                                functions.trimCommaEnd(
                                                    '${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.neighborhood!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.locality!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocality!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.country!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.postalCode!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.postalTown!)}'),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 4, 0),
                                          child: Icon(
                                            Icons.location_pin,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 3, 0, 0),
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Text(
                                                functions.trimCommaEnd(
                                                    '${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.locality!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocality!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.country!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.postalCode!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.postalTown!)}'),
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
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          'jm',
                                                          listViewCommutesRecord
                                                              .departureDatetime!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          'MMMEd',
                                                          listViewCommutesRecord
                                                              .departureDatetime!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Text(
                                                        listViewCommutesRecord
                                                            .availablePassengerSeats!
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 0),
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Text(
                                                        '${functions.twoDeci(listViewCommutesRecord.pricePerSeat!)} ${listViewCommutesRecord.currency}',
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 4, 0),
                                          child: StreamBuilder<
                                              List<PassengersRecord>>(
                                            stream: queryPassengersRecord(
                                              parent: listViewCommutesRecord
                                                  .reference,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PassengersRecord>
                                                  buttonPassengersRecordList =
                                                  snapshot.data!;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'DRIVES_PAGE_ARCHIVE_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_alert_dialog');
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Archive Commute'),
                                                                content: Text(
                                                                    'Are you sure you want to archive this commute?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'No'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Yes'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    if (getCurrentTimestamp <
                                                        listViewCommutesRecord
                                                            .departureDatetime!) {
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      final messagesCreateData =
                                                          createMessagesRecordData();
                                                      await MessagesRecord.createDoc(
                                                              listViewCommutesRecord
                                                                  .reference)
                                                          .set(
                                                              messagesCreateData);
                                                      logFirebaseEvent(
                                                          'Button_trigger_push_notification');
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'Commute Cancelled',
                                                        notificationText:
                                                            'Your driver to ${functions.trimCommaEnd('${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.locality!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocality!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.country!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.postalCode!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.postalTown!)}')} on ${dateTimeFormat(
                                                          'MMMMEEEEd',
                                                          listViewCommutesRecord
                                                              .departureDatetime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}, ${dateTimeFormat(
                                                          'jm',
                                                          listViewCommutesRecord
                                                              .departureDatetime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )} has cancelled.',
                                                        notificationSound:
                                                            'default',
                                                        userRefs:
                                                            buttonPassengersRecordList
                                                                .map((e) => e
                                                                    .passengerAccount)
                                                                .withoutNulls
                                                                .toList(),
                                                        initialPageName:
                                                            'seats',
                                                        parameterData: {},
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      final commutesUpdateData1 =
                                                          createCommutesRecordData(
                                                        archived: true,
                                                      );
                                                      await listViewCommutesRecord
                                                          .reference
                                                          .update(
                                                              commutesUpdateData1);
                                                      return;
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      final commutesUpdateData2 =
                                                          createCommutesRecordData(
                                                        archived: true,
                                                      );
                                                      await listViewCommutesRecord
                                                          .reference
                                                          .update(
                                                              commutesUpdateData2);
                                                      return;
                                                    }
                                                  } else {
                                                    return;
                                                  }
                                                },
                                                text: 'Archive',
                                                icon: Icon(
                                                  Icons.archive_rounded,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                  elevation: 8,
                                                  borderSide: BorderSide(
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'DRIVES_PAGE_SECURE_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_alert_dialog');
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Share Commute Details'),
                                                              content: Text(
                                                                  'Are you sure you want to share this commute\'s identifier? It can be used by authorities to request this commute\'s data in the case of an emergency.'),
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
                                                  logFirebaseEvent(
                                                      'Button_share');
                                                  await Share.share(
                                                    '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')}is a Commute driver and has shared the following commute identifier with you. In the case of an emergency, share it with the police:${functions.docRefToString(listViewCommutesRecord.reference)}',
                                                    sharePositionOrigin:
                                                        getWidgetBoundingBox(
                                                            context),
                                                  );
                                                  return;
                                                } else {
                                                  return;
                                                }
                                              },
                                              text: 'Secure',
                                              icon: Icon(
                                                Icons.security_rounded,
                                                size: 15,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 50,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                    BorderRadius.circular(8),
                                              ),
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
      ),
    );
  }
}
