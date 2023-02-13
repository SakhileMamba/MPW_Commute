import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/accept_driver_empty_widget.dart';
import '../components/seats_empty_widget.dart';
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
import 'package:share_plus/share_plus.dart';
import 'seats_model.dart';
export 'seats_model.dart';

class SeatsWidget extends StatefulWidget {
  const SeatsWidget({Key? key}) : super(key: key);

  @override
  _SeatsWidgetState createState() => _SeatsWidgetState();
}

class _SeatsWidgetState extends State<SeatsWidget> {
  late SeatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeatsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'seats'});
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
                                      'SEATS_PAGE_CircleImage_ecydk7za_ON_TAP');
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
                    logFirebaseEvent('SEATS_PAGE_ListTile_58xpqri1_ON_TAP');
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
                    logFirebaseEvent('SEATS_PAGE_ListTile_lbgje165_ON_TAP');
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
                    logFirebaseEvent('SEATS_PAGE_ListTile_lyobqfai_ON_TAP');
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
                    logFirebaseEvent('SEATS_PAGE_ListTile_lhogkwoa_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.goNamed('drives');
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
                    logFirebaseEvent('SEATS_PAGE_ListTile_f14tz03w_ON_TAP');
                    logFirebaseEvent('ListTile_drawer');
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
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
                    logFirebaseEvent('SEATS_PAGE_ListTile_3mcsgn99_ON_TAP');
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
                    logFirebaseEvent('SEATS_PAGE_ListTile_ygtuc6dp_ON_TAP');
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
              logFirebaseEvent('SEATS_PAGE_menu_rounded_ICN_ON_TAP');
              if (FFAppState().seatsPageInitialIndex == 1) {
                logFirebaseEvent('IconButton_update_app_state');
                FFAppState().seatsPageInitialIndex = 0;
              }
              logFirebaseEvent('IconButton_drawer');
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(
            'Seats',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryColor,
                  fontSize: 22,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: DefaultTabController(
              length: 2,
              initialIndex: min(
                  valueOrDefault<int>(
                    FFAppState().seatsPageInitialIndex,
                    0,
                  ),
                  1),
              child: Column(
                children: [
                  TabBar(
                    labelColor: FlutterFlowTheme.of(context).primaryColor,
                    labelStyle: FlutterFlowTheme.of(context).bodyText1,
                    indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                    tabs: [
                      Tab(
                        text: 'Confirmed',
                      ),
                      Tab(
                        text: 'Requested',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        StreamBuilder<List<PassengersRecord>>(
                          stream: queryPassengersRecord(
                            queryBuilder: (passengersRecord) => passengersRecord
                                .where('passenger_account',
                                    isEqualTo: currentUserReference)
                                .where('accepted', isEqualTo: true)
                                .where('archived', isEqualTo: false)
                                .orderBy('commute_datetime', descending: true),
                          ),
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
                            List<PassengersRecord>
                                listViewPassengersRecordList = snapshot.data!;
                            if (listViewPassengersRecordList.isEmpty) {
                              return Center(
                                child: SeatsEmptyWidget(),
                              );
                            }
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewPassengersRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewPassengersRecord =
                                    listViewPassengersRecordList[listViewIndex];
                                return FutureBuilder<CommutesRecord>(
                                  future: CommutesRecord.getDocumentOnce(
                                      listViewPassengersRecord.parentReference),
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
                                    final cardCommutesRecord = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SEATS_PAGE_Card_63fif4w3_ON_TAP');
                                        logFirebaseEvent('Card_navigate_to');

                                        context.pushNamed(
                                          'driveDetails',
                                          queryParams: {
                                            'commuteDoc': serializeParam(
                                              cardCommutesRecord,
                                              ParamType.Document,
                                            ),
                                            'notNotificationOpen':
                                                serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'commuteDoc': cardCommutesRecord,
                                          },
                                        );
                                      },
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        elevation: 0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 16, 16, 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child:
                                                    FutureBuilder<UsersRecord>(
                                                  future: UsersRecord
                                                      .getDocumentOnce(
                                                          cardCommutesRecord
                                                              .driver!),
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
                                                    final nameRatingUsersRecord =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SEATS_PAGE_CircleImage_2aoju39o_ON_TAP');
                                                            logFirebaseEvent(
                                                                'CircleImage_expand_image');
                                                            await Navigator
                                                                .push(
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
                                                                        nameRatingUsersRecord
                                                                            .photoUrl!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: nameRatingUsersRecord
                                                                      .photoUrl!,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag:
                                                                nameRatingUsersRecord
                                                                    .photoUrl!,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: Container(
                                                              width: 50,
                                                              height: 50,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    nameRatingUsersRecord
                                                                        .photoUrl!,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        10,
                                                                        0,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${nameRatingUsersRecord.displayName} ${nameRatingUsersRecord.displaySurname}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Text(
                                                                  nameRatingUsersRecord
                                                                      .gender!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if (nameRatingUsersRecord
                                                                .rating! >
                                                            0.0)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        10,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  functions.twoDeci(
                                                                      nameRatingUsersRecord
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
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: FutureBuilder<
                                                    VehiclesRecord>(
                                                  future: VehiclesRecord
                                                      .getDocumentOnce(
                                                          cardCommutesRecord
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
                                                            'SEATS_PAGE_Image_vw8ooa2q_ON_TAP');
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
                                                                    imageVehiclesRecord
                                                                        .imageURL!,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: imageVehiclesRecord
                                                                  .imageURL!,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: imageVehiclesRecord
                                                            .imageURL!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                imageVehiclesRecord
                                                                    .imageURL!,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Icon(
                                                        Icons
                                                            .trip_origin_rounded,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              functions
                                                                  .trimCommaEnd(
                                                                      '${functions.nullTest(cardCommutesRecord.originReversedGeocoded.neighborhood!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.locality!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.sublocality!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.country!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.postalCode!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(cardCommutesRecord.originReversedGeocoded.postalTown!)}'),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              functions
                                                                  .trimCommaEnd(
                                                                      '${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.locality!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocality!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.country!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.postalCode!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.postalTown!)}'),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 4, 0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                child: Icon(
                                                                  Icons
                                                                      .access_time_rounded,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                      'jm',
                                                                      cardCommutesRecord
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                child: Icon(
                                                                  Icons
                                                                      .date_range_rounded,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                      'MMMEd',
                                                                      cardCommutesRecord
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 4, 0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                child: Icon(
                                                                  Icons
                                                                      .airline_seat_recline_normal_rounded,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Text(
                                                                    cardCommutesRecord
                                                                        .availablePassengerSeats!
                                                                        .toString(),
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                  color: Colors
                                                                      .black,
                                                                  size: 19,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Text(
                                                                    '${functions.twoDeci(cardCommutesRecord.pricePerSeat!)} ${cardCommutesRecord.currency}',
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                              'SEATS_PAGE_ARCHIVE_BTN_ON_TAP');
                                                          if (getCurrentTimestamp <
                                                              cardCommutesRecord
                                                                  .departureDatetime!) {
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
                                                                          title:
                                                                              Text('Cancel Commute'),
                                                                          content:
                                                                              Text('Are you sure you want to give up this seat?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('No'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Yes'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              logFirebaseEvent(
                                                                  'Button_trigger_push_notification');
                                                              triggerPushNotification(
                                                                notificationTitle:
                                                                    'Cancellation Notice',
                                                                notificationText:
                                                                    'A passenger on your commute to ${functions.trimCommaEnd('${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.locality!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocality!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.country!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.postalCode!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(cardCommutesRecord.destinationReversedGeocoded.postalTown!)}')} on ${dateTimeFormat(
                                                                  'MMMMEEEEd',
                                                                  cardCommutesRecord
                                                                      .departureDatetime,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}, ${dateTimeFormat(
                                                                  'jm',
                                                                  cardCommutesRecord
                                                                      .departureDatetime,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )} has cancelled. The seat is now available for others to request.',
                                                                notificationSound:
                                                                    'default',
                                                                userRefs: [
                                                                  cardCommutesRecord
                                                                      .driver!
                                                                ],
                                                                initialPageName:
                                                                    'drives',
                                                                parameterData: {},
                                                              );
                                                              logFirebaseEvent(
                                                                  'Button_backend_call');

                                                              final commutesUpdateData =
                                                                  {
                                                                'available_passenger_seats':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              };
                                                              await cardCommutesRecord
                                                                  .reference
                                                                  .update(
                                                                      commutesUpdateData);
                                                              logFirebaseEvent(
                                                                  'Button_backend_call');

                                                              final passengersUpdateData1 =
                                                                  createPassengersRecordData(
                                                                archived: true,
                                                              );
                                                              await listViewPassengersRecord
                                                                  .reference
                                                                  .update(
                                                                      passengersUpdateData1);
                                                              return;
                                                            } else {
                                                              return;
                                                            }
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            final passengersUpdateData2 =
                                                                createPassengersRecordData(
                                                              archived: true,
                                                            );
                                                            await listViewPassengersRecord
                                                                .reference
                                                                .update(
                                                                    passengersUpdateData2);
                                                            return;
                                                          }
                                                        },
                                                        text: 'Archive',
                                                        icon: Icon(
                                                          Icons.archive_rounded,
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
                                                    child: Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'SEATS_PAGE_SECURE_BTN_ON_TAP');
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
                                                                          title:
                                                                              Text('Share Commute Details'),
                                                                          content:
                                                                              Text('Are you sure you want to share this commute\'s identifier? It can be used by authorities to request this commute\'s data in the case of an emergency.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('Cancel'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Confirm'),
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
                                                                '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} is a Commute passenger and has shared the commute identifier.  In the case of an emergency, share it with the police: ${functions.docRefToString(cardCommutesRecord.reference)}',
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
                                                            Icons
                                                                .security_rounded,
                                                            size: 15,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
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
                                                                    .circular(
                                                                        8),
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
                        StreamBuilder<List<PassengersHailingRecord>>(
                          stream: queryPassengersHailingRecord(
                            queryBuilder: (passengersHailingRecord) =>
                                passengersHailingRecord
                                    .where('departure_datetime',
                                        isGreaterThan:
                                            FFAppState().filterCurrentDateTime)
                                    .where('hailingPassenger',
                                        isEqualTo: currentUserReference)
                                    .where('archived', isEqualTo: false)
                                    .orderBy('departure_datetime'),
                          ),
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
                            List<PassengersHailingRecord>
                                listViewPassengersHailingRecordList =
                                snapshot.data!;
                            if (listViewPassengersHailingRecordList.isEmpty) {
                              return Center(
                                child: AcceptDriverEmptyWidget(),
                              );
                            }
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  listViewPassengersHailingRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewPassengersHailingRecord =
                                    listViewPassengersHailingRecordList[
                                        listViewIndex];
                                return FutureBuilder<UsersRecord>(
                                  future: UsersRecord.getDocumentOnce(
                                      listViewPassengersHailingRecord
                                          .hailingPassenger!),
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
                                    return InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SEATS_PAGE_Card_aqiey5u2_ON_TAP');
                                        logFirebaseEvent('Card_navigate_to');

                                        context.pushNamed(
                                          'driverRequestDetails',
                                          queryParams: {
                                            'hailingDoc': serializeParam(
                                              listViewPassengersHailingRecord,
                                              ParamType.Document,
                                            ),
                                            'passenger': serializeParam(
                                              cardUsersRecord,
                                              ParamType.Document,
                                            ),
                                            'notNotificationOpen':
                                                serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'hailingDoc':
                                                listViewPassengersHailingRecord,
                                            'passenger': cardUsersRecord,
                                          },
                                        );
                                      },
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        elevation: 0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 16, 16, 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Icon(
                                                        Icons
                                                            .trip_origin_rounded,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 3, 0, 0),
                                                        child: Container(
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Text(
                                                            functions.trimCommaEnd(
                                                                '${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.neighborhood!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.locality!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocality!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.country!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.postalCode!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.postalTown!)}'),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
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
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 3, 0, 0),
                                                        child: Container(
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Text(
                                                            functions.trimCommaEnd(
                                                                '${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.locality!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocality!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.country!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.postalCode!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.postalTown!)}'),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 4, 0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                child: Icon(
                                                                  Icons
                                                                      .access_time_rounded,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                      'jm',
                                                                      listViewPassengersHailingRecord
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                child: Icon(
                                                                  Icons
                                                                      .date_range_rounded,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                      'MMMEd',
                                                                      listViewPassengersHailingRecord
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                              'SEATS_PAGE_CANCEL_BTN_ON_TAP');
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
                                                                            'Cancel Driver Request'),
                                                                        content:
                                                                            Text('Are you sure you want to cancel this request for a driver?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('No'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
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
                                                                'Button_backend_call');

                                                            final passengersHailingUpdateData =
                                                                createPassengersHailingRecordData(
                                                              archived: true,
                                                            );
                                                            await listViewPassengersHailingRecord
                                                                .reference
                                                                .update(
                                                                    passengersHailingUpdateData);
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
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
