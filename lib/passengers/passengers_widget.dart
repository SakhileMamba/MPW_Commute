import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/browse_passengers_empty_widget.dart';
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

class PassengersWidget extends StatefulWidget {
  const PassengersWidget({Key? key}) : super(key: key);

  @override
  _PassengersWidgetState createState() => _PassengersWidgetState();
}

class _PassengersWidgetState extends State<PassengersWidget> {
  PagingController<DocumentSnapshot?, PassengersHailingRecord>?
      _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'passengers'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
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
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'PASSENGERS_CircleImage_5gc66woi_ON_TAP');
                                logFirebaseEvent(
                                    'CircleImage_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().currentPhotoURLTemp =
                                      currentUserPhoto;
                                });
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
                                child: Image.network(
                                  valueOrDefault<String>(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Icon(
                                    Icons.verified_rounded,
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
                  logFirebaseEvent('PASSENGERS_PAGE_ListTile_jtbuzllp_ON_TAP');
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
                  logFirebaseEvent('PASSENGERS_PAGE_ListTile_44jdd1kc_ON_TAP');
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
                  logFirebaseEvent('PASSENGERS_PAGE_ListTile_fgdrtyq4_ON_TAP');
                  logFirebaseEvent('ListTile_drawer');
                  if (scaffoldKey.currentState!.isDrawerOpen ||
                      scaffoldKey.currentState!.isEndDrawerOpen) {
                    Navigator.pop(context);
                  }
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
                  logFirebaseEvent('PASSENGERS_PAGE_ListTile_aujwlhys_ON_TAP');
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
                  logFirebaseEvent('PASSENGERS_PAGE_ListTile_yj09fyg5_ON_TAP');
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
                  logFirebaseEvent('PASSENGERS_PAGE_ListTile_tltjfsv8_ON_TAP');
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
                  logFirebaseEvent('PASSENGERS_PAGE_ListTile_lzogqpet_ON_TAP');
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
              InkWell(
                onTap: () async {
                  logFirebaseEvent('PASSENGERS_PAGE_ListTile_rxyodjk8_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.pushNamed('referFriend');
                },
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.gift,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  title: Text(
                    'Refer A Friend',
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
            logFirebaseEvent('PASSENGERS_PAGE_menu_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_drawer');
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text(
          'Hailers',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryColor,
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
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('PASSENGERS_filter_list_rounded_ICN_ON_TA');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed('filterCommutes');
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: RefreshIndicator(
            onRefresh: () async {
              logFirebaseEvent('PASSENGERS_ListView_f3i5h1o2_ON_PULL_TO_');
              logFirebaseEvent('ListView_update_local_state');
              FFAppState().update(() {
                FFAppState().filterCurrentDateTime = getCurrentTimestamp;
              });
            },
            child: PagedListView<DocumentSnapshot<Object?>?,
                PassengersHailingRecord>(
              pagingController: () {
                final Query<Object?> Function(Query<Object?>) queryBuilder =
                    (passengersHailingRecord) => passengersHailingRecord
                        .where('departure_datetime',
                            isLessThanOrEqualTo:
                                FFAppState().filterDepartureDatetime)
                        .where('departure_datetime',
                            isGreaterThanOrEqualTo:
                                FFAppState().filterCurrentDateTime)
                        .where('archived', isEqualTo: false)
                        .orderBy('departure_datetime', descending: true);
                if (_pagingController != null) {
                  final query =
                      queryBuilder(PassengersHailingRecord.collection);
                  if (query != _pagingQuery) {
                    // The query has changed
                    _pagingQuery = query;
                    _streamSubscriptions.forEach((s) => s?.cancel());
                    _streamSubscriptions.clear();
                    _pagingController!.refresh();
                  }
                  return _pagingController!;
                }

                _pagingController = PagingController(firstPageKey: null);
                _pagingQuery = queryBuilder(PassengersHailingRecord.collection);
                _pagingController!.addPageRequestListener((nextPageMarker) {
                  queryPassengersHailingRecordPage(
                    queryBuilder: (passengersHailingRecord) =>
                        passengersHailingRecord
                            .where('departure_datetime',
                                isLessThanOrEqualTo:
                                    FFAppState().filterDepartureDatetime)
                            .where('departure_datetime',
                                isGreaterThanOrEqualTo:
                                    FFAppState().filterCurrentDateTime)
                            .where('archived', isEqualTo: false)
                            .orderBy('departure_datetime', descending: true),
                    nextPageMarker: nextPageMarker,
                    pageSize: 25,
                    isStream: true,
                  ).then((page) {
                    _pagingController!.appendPage(
                      page.data,
                      page.nextPageMarker,
                    );
                    final streamSubscription = page.dataStream?.listen((data) {
                      data.forEach((item) {
                        final itemIndexes = _pagingController!.itemList!
                            .asMap()
                            .map((k, v) => MapEntry(v.reference.id, k));
                        final index = itemIndexes[item.reference.id];
                        final items = _pagingController!.itemList!;
                        if (index != null) {
                          items.replaceRange(index, index + 1, [item]);
                          _pagingController!.itemList = {
                            for (var item in items) item.reference: item
                          }.values.toList();
                        }
                      });
                      setState(() {});
                    });
                    _streamSubscriptions.add(streamSubscription);
                  });
                });
                return _pagingController!;
              }(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              builderDelegate:
                  PagedChildBuilderDelegate<PassengersHailingRecord>(
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
                  child: BrowsePassengersEmptyWidget(),
                ),
                itemBuilder: (context, _, listViewIndex) {
                  final listViewPassengersHailingRecord =
                      _pagingController!.itemList![listViewIndex];
                  return Visibility(
                    visible:
                        listViewPassengersHailingRecord.departureDatetime! >=
                            getCurrentTimestamp,
                    child: FutureBuilder<UsersRecord>(
                      future: UsersRecord.getDocumentOnce(
                          listViewPassengersHailingRecord.hailingPassenger!),
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
                                'PASSENGERS_PAGE_Card_olygjjj3_ON_TAP');
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
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'hailingDoc': listViewPassengersHailingRecord,
                                'passenger': cardUsersRecord,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PASSENGERS_CircleImage_w1v6emzl_ON_TAP');
                                            logFirebaseEvent(
                                                'CircleImage_expand_image');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: CachedNetworkImage(
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      cardUsersRecord.photoUrl,
                                                      'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: valueOrDefault<String>(
                                                    cardUsersRecord.photoUrl,
                                                    'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3' +
                                                        '$listViewIndex',
                                                  ),
                                                  useHeroAnimation: true,
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
                                                    valueOrDefault<String>(
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
                                        if (cardUsersRecord.rating! > 0.0)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  functions.twoDeci(
                                                      cardUsersRecord.rating!),
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
                                                    '${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.neighborhood!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.locality!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocality!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.country!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.postalCode!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.postalTown!)}'),
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
                                                    '${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.locality!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocality!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(listViewPassengersHailingRecord.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.country!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.postalCode!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(listViewPassengersHailingRecord.destinationReversedGeocoded.postalTown!)}'),
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
                                      mainAxisSize: MainAxisSize.min,
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
                                                          listViewPassengersHailingRecord
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
                                                          listViewPassengersHailingRecord
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
      ),
    );
  }
}
