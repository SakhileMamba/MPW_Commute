import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/browse_drivers_empty_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'drivers_model.dart';
export 'drivers_model.dart';

class DriversWidget extends StatefulWidget {
  const DriversWidget({Key? key}) : super(key: key);

  @override
  _DriversWidgetState createState() => _DriversWidgetState();
}

class _DriversWidgetState extends State<DriversWidget> {
  late DriversModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriversModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'drivers'});
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
                                      'DRIVERS_PAGE_CircleImage_cywylmaq_ON_TAP');
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
                    logFirebaseEvent('DRIVERS_PAGE_ListTile_9afde16y_ON_TAP');
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
                    logFirebaseEvent('DRIVERS_PAGE_ListTile_51j8n8uu_ON_TAP');
                    logFirebaseEvent('ListTile_drawer');
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
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
                    logFirebaseEvent('DRIVERS_PAGE_ListTile_ynjqk234_ON_TAP');
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
                    logFirebaseEvent('DRIVERS_PAGE_ListTile_ngj344h8_ON_TAP');
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
                    logFirebaseEvent('DRIVERS_PAGE_ListTile_0ztj0gnx_ON_TAP');
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
                    logFirebaseEvent('DRIVERS_PAGE_ListTile_av4fegzz_ON_TAP');
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
                    logFirebaseEvent('DRIVERS_PAGE_ListTile_3ajrr93g_ON_TAP');
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
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
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
                  logFirebaseEvent('DRIVERS_PAGE_menu_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_drawer');
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              title: Text(
                'Drivers',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.filter_list_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('DRIVERS_filter_list_rounded_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().filterCallingSource = 'drivers';
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed('filterOriginType');
                  },
                ),
              ],
              centerTitle: true,
              elevation: 0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                child: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      logFirebaseEvent(
                          'DRIVERS_Column_rh28ie7s_ON_PULL_TO_REFRE');
                      logFirebaseEvent('ListView_update_app_state');
                      FFAppState().update(() {
                        FFAppState().filterCurrentDateTime =
                            getCurrentTimestamp;
                      });
                    },
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        CommutesRecord>(
                      pagingController: () {
                        final Query<Object?> Function(Query<Object?>)
                            queryBuilder = (commutesRecord) => commutesRecord
                                .where('departure_datetime',
                                    isLessThanOrEqualTo:
                                        FFAppState().filterDepartureDatetime)
                                .where('departure_datetime',
                                    isGreaterThanOrEqualTo:
                                        FFAppState().filterCurrentDateTime)
                                .where('archived', isEqualTo: false)
                                .where('originReversedGeocoded.neighborhood',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['neighborhood']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['neighborhood']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.locality',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['locality']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['locality']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.sublocality',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_1',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_1']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_1']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_2',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_2']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_2']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_3',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_3']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_3']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_4',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_4']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_4']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_5',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_5']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_5']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_1',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_1']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_1']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_2',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_2']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_2']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_3',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_3']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_3']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_4',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_4']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_4']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_5',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_5']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_5']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_6',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_6']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_6']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_7',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_7']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_7']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.country',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['country']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['country']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.postal_code',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['postal_code']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['postal_code']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.postal_code_prefix',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['postal_code_prefix']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['postal_code_prefix']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.postal_town',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['postal_town']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['postal_town']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.neighborhood',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['neighborhood']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['neighborhood']''',
                                          ).toString()
                                        : null)
                                .where('destinationReversedGeocoded.locality',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['locality']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['locality']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_1',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_1']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_1']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_2',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_2']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_2']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_3',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_3']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_3']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_4',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_4']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_4']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_5',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_5']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_5']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_1',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_1']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_1']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_2',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_2']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_2']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_3',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_3']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_3']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_4',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_4']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_4']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_5',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_5']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_5']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_6',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_6']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_6']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_7',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_7']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_7']''',
                                          ).toString()
                                        : null)
                                .where('destinationReversedGeocoded.country',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['country']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['country']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.postal_code',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['postal_code']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['postal_code']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.postal_code_prefix',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['postal_code_prefix']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['postal_code_prefix']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.postal_town',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['postal_town']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['postal_town']''',
                                          ).toString()
                                        : null)
                                .orderBy('departure_datetime', descending: true)
                                .orderBy('available_passenger_seats',
                                    descending: true)
                                .orderBy('driversRating', descending: true);
                        if (_model.pagingController != null) {
                          final query = queryBuilder(CommutesRecord.collection);
                          if (query != _model.pagingQuery) {
                            // The query has changed
                            _model.pagingQuery = query;
                            _model.streamSubscriptions
                                .forEach((s) => s?.cancel());
                            _model.streamSubscriptions.clear();
                            _model.pagingController!.refresh();
                          }
                          return _model.pagingController!;
                        }

                        _model.pagingController =
                            PagingController(firstPageKey: null);
                        _model.pagingQuery =
                            queryBuilder(CommutesRecord.collection);
                        _model.pagingController!
                            .addPageRequestListener((nextPageMarker) {
                          queryCommutesRecordPage(
                            queryBuilder: (commutesRecord) => commutesRecord
                                .where('departure_datetime',
                                    isLessThanOrEqualTo:
                                        FFAppState().filterDepartureDatetime)
                                .where('departure_datetime',
                                    isGreaterThanOrEqualTo:
                                        FFAppState().filterCurrentDateTime)
                                .where('archived', isEqualTo: false)
                                .where('originReversedGeocoded.neighborhood',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['neighborhood']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['neighborhood']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.locality',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['locality']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['locality']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.sublocality',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_1',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_1']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_1']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_2',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_2']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_2']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_3',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_3']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_3']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_4',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_4']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_4']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.sublocality_level_5',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['sublocality_level_5']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['sublocality_level_5']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_1',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_1']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_1']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_2',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_2']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_2']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_3',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_3']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_3']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_4',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_4']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_4']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_5',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_5']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_5']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_6',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_6']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_6']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.administrative_area_level_7',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['administrative_area_level_7']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['administrative_area_level_7']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.country',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['country']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['country']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.postal_code',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['postal_code']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['postal_code']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'originReversedGeocoded.postal_code_prefix',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['postal_code_prefix']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['postal_code_prefix']''',
                                          ).toString()
                                        : null)
                                .where('originReversedGeocoded.postal_town',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempOriginReversed,
                                              r'''$['postal_town']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempOriginReversed,
                                            r'''$['postal_town']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.neighborhood',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['neighborhood']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['neighborhood']''',
                                          ).toString()
                                        : null)
                                .where('destinationReversedGeocoded.locality',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['locality']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['locality']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_1',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_1']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_1']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_2',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_2']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_2']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_3',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_3']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_3']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_4',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_4']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_4']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.sublocality_level_5',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['sublocality_level_5']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['sublocality_level_5']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_1',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_1']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_1']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_2',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_2']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_2']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_3',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_3']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_3']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_4',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_4']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_4']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_5',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_5']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_5']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_6',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_6']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_6']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.administrative_area_level_7',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['administrative_area_level_7']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['administrative_area_level_7']''',
                                          ).toString()
                                        : null)
                                .where('destinationReversedGeocoded.country',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['country']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['country']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.postal_code',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['postal_code']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['postal_code']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.postal_code_prefix',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['postal_code_prefix']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['postal_code_prefix']''',
                                          ).toString()
                                        : null)
                                .where(
                                    'destinationReversedGeocoded.postal_town',
                                    isEqualTo: getJsonField(
                                              FFAppState()
                                                  .filterTempDestinationReversed,
                                              r'''$['postal_town']''',
                                            ).toString() !=
                                            ''
                                        ? getJsonField(
                                            FFAppState()
                                                .filterTempDestinationReversed,
                                            r'''$['postal_town']''',
                                          ).toString()
                                        : null)
                                .orderBy('departure_datetime', descending: true)
                                .orderBy('available_passenger_seats',
                                    descending: true)
                                .orderBy('driversRating', descending: true),
                            nextPageMarker: nextPageMarker,
                            pageSize: 25,
                            isStream: true,
                          ).then((page) {
                            _model.pagingController!.appendPage(
                              page.data,
                              page.nextPageMarker,
                            );
                            final streamSubscription =
                                page.dataStream?.listen((data) {
                              data.forEach((item) {
                                final itemIndexes = _model
                                    .pagingController!.itemList!
                                    .asMap()
                                    .map((k, v) => MapEntry(v.reference.id, k));
                                final index = itemIndexes[item.reference.id];
                                final items =
                                    _model.pagingController!.itemList!;
                                if (index != null) {
                                  items.replaceRange(index, index + 1, [item]);
                                  _model.pagingController!.itemList = {
                                    for (var item in items) item.reference: item
                                  }.values.toList();
                                }
                              });
                              setState(() {});
                            });
                            _model.streamSubscriptions.add(streamSubscription);
                          });
                        });
                        return _model.pagingController!;
                      }(),
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      builderDelegate:
                          PagedChildBuilderDelegate<CommutesRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitChasingDots(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => Center(
                          child: BrowseDriversEmptyWidget(),
                        ),
                        itemBuilder: (context, _, listViewIndex) {
                          final listViewCommutesRecord =
                              _model.pagingController!.itemList![listViewIndex];
                          return Visibility(
                            visible:
                                listViewCommutesRecord.departureDatetime! >=
                                    getCurrentTimestamp,
                            child: FutureBuilder<UsersRecord>(
                              future: UsersRecord.getDocumentOnce(
                                  listViewCommutesRecord.driver!),
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
                                        'DRIVERS_PAGE_Card_64cz7cnr_ON_TAP');
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    elevation: 0,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'DRIVERS_PAGE_CircleImage_lyk7aa0f_ON_TAP');
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
                                                                valueOrDefault<
                                                                    String>(
                                                              cardUsersRecord
                                                                  .photoUrl,
                                                              'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: valueOrDefault<
                                                              String>(
                                                            cardUsersRecord
                                                                .photoUrl,
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
                                                    tag: valueOrDefault<String>(
                                                      cardUsersRecord.photoUrl,
                                                      'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3' +
                                                          '$listViewIndex',
                                                    ),
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
                                                            valueOrDefault<
                                                                String>(
                                                          cardUsersRecord
                                                              .photoUrl,
                                                          'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                                        ),
                                                        fit: BoxFit.cover,
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
                                                if (cardUsersRecord.rating! >
                                                    0.0)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 10, 0, 0),
                                                    child: Row(
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
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child:
                                                FutureBuilder<VehiclesRecord>(
                                              future: VehiclesRecord
                                                  .getDocumentOnce(
                                                      listViewCommutesRecord
                                                          .vehicle!),
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
                                                final imageVehiclesRecord =
                                                    snapshot.data!;
                                                return InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'DRIVERS_PAGE_Image_cckz8ort_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Image_expand_image');
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
                                                                valueOrDefault<
                                                                    String>(
                                                              imageVehiclesRecord
                                                                  .imageURL,
                                                              'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
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
                                                    tag: valueOrDefault<String>(
                                                      imageVehiclesRecord
                                                          .imageURL,
                                                      'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3' +
                                                          '$listViewIndex',
                                                    ),
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: CachedNetworkImage(
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
                                          Padding(
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
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: Icon(
                                                    Icons.trip_origin_rounded,
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
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Text(
                                                        functions.trimCommaEnd(
                                                            '${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.neighborhood!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.locality!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocality!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.country!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.postalCode!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(listViewCommutesRecord.originReversedGeocoded.postalTown!)}'),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
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
                                                    0, 0, 0, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
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
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Text(
                                                        functions.trimCommaEnd(
                                                            '${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.locality!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocality!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.country!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.postalCode!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(listViewCommutesRecord.destinationReversedGeocoded.postalTown!)}'),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
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
                                                    0, 0, 0, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
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
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              color:
                                                                  Colors.black,
                                                              size: 24,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
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
                                                                  listViewCommutesRecord
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
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              color:
                                                                  Colors.black,
                                                              size: 24,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
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
                                                                  listViewCommutesRecord
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 4, 0),
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
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Text(
                                                              listViewCommutesRecord
                                                                  .availablePassengerSeats!
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 0, 0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                        Expanded(
                                                          child: Container(
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Text(
                                                              '${functions.twoDeci(listViewCommutesRecord.pricePerSeat!)} ${listViewCommutesRecord.currency}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
