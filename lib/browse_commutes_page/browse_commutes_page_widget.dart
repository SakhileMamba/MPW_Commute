import '../backend/backend.dart';
import '../browse_commutes_details_page/browse_commutes_details_page_widget.dart';
import '../components/browse_empty_widget.dart';
import '../filter_commutes_page/filter_commutes_page_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';

class BrowseCommutesPageWidget extends StatefulWidget {
  const BrowseCommutesPageWidget({Key? key}) : super(key: key);

  @override
  _BrowseCommutesPageWidgetState createState() =>
      _BrowseCommutesPageWidgetState();
}

class _BrowseCommutesPageWidgetState extends State<BrowseCommutesPageWidget> {
  PagingController<DocumentSnapshot?, CommutesRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BROWSE_COMMUTES_browse_commutes_page_ON_');
      logFirebaseEvent('browse_commutes_page_Update-Local-State');
      setState(() => FFAppState().filterCurrentDateTime = getCurrentTimestamp);
      if (FFAppState().privacyPolicyAndTermsOfServiceAgreement) {
        return;
      }

      logFirebaseEvent('browse_commutes_page_Alert-Dialog');
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(
                'Please note that by using this app, you are consenting to Commute\'s privacy policy and terms of use.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      logFirebaseEvent('browse_commutes_page_Update-Local-State');
      setState(
          () => FFAppState().privacyPolicyAndTermsOfServiceAgreement = true);
      return;
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'browse_commutes_page'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Browse',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
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
              Icons.filter_list_rounded,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('BROWSE_COMMUTES_filter_list_rounded_ICN_');
              logFirebaseEvent('IconButton_Navigate-To');
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterCommutesPageWidget(),
                ),
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: RefreshIndicator(
            onRefresh: () async {
              logFirebaseEvent('BROWSE_COMMUTES_Column_rh28ie7s_ON_PULL_');
              logFirebaseEvent('ListView_Update-Local-State');
              setState(() =>
                  FFAppState().filterCurrentDateTime = getCurrentTimestamp);
            },
            child: PagedListView<DocumentSnapshot<Object?>?, CommutesRecord>(
              pagingController: () {
                final Query<Object?> Function(Query<Object?>) queryBuilder =
                    (commutesRecord) => commutesRecord
                        .where('origin',
                            isEqualTo: FFAppState().filterOrigin != ''
                                ? FFAppState().filterOrigin
                                : null)
                        .where('destination',
                            isEqualTo: FFAppState().filterDestination != ''
                                ? FFAppState().filterDestination
                                : null)
                        .where('departure_datetime',
                            isLessThanOrEqualTo:
                                FFAppState().filterDepartureDatetime)
                        .where('departure_datetime',
                            isGreaterThanOrEqualTo:
                                FFAppState().filterCurrentDateTime)
                        .orderBy('departure_datetime', descending: true)
                        .orderBy('available_passenger_seats', descending: true)
                        .orderBy('driversRating', descending: true);
                if (_pagingController != null) {
                  final query = queryBuilder(CommutesRecord.collection);
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
                _pagingQuery = queryBuilder(CommutesRecord.collection);
                _pagingController!.addPageRequestListener((nextPageMarker) {
                  queryCommutesRecordPage(
                    queryBuilder: (commutesRecord) => commutesRecord
                        .where('origin',
                            isEqualTo: FFAppState().filterOrigin != ''
                                ? FFAppState().filterOrigin
                                : null)
                        .where('destination',
                            isEqualTo: FFAppState().filterDestination != ''
                                ? FFAppState().filterDestination
                                : null)
                        .where('departure_datetime',
                            isLessThanOrEqualTo:
                                FFAppState().filterDepartureDatetime)
                        .where('departure_datetime',
                            isGreaterThanOrEqualTo:
                                FFAppState().filterCurrentDateTime)
                        .orderBy('departure_datetime', descending: true)
                        .orderBy('available_passenger_seats', descending: true)
                        .orderBy('driversRating', descending: true),
                    nextPageMarker: nextPageMarker,
                    pageSize: 25,
                    isStream: true,
                  ).then((page) {
                    _pagingController!.appendPage(
                      page.data,
                      page.nextPageMarker,
                    );
                    final streamSubscription = page.dataStream?.listen((data) {
                      final itemIndexes = _pagingController!.itemList!
                          .asMap()
                          .map((k, v) => MapEntry(v.reference.id, k));
                      data.forEach((item) {
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
              builderDelegate: PagedChildBuilderDelegate<CommutesRecord>(
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
                  child: BrowseEmptyWidget(),
                ),
                itemBuilder: (context, _, listViewIndex) {
                  final listViewCommutesRecord =
                      _pagingController!.itemList![listViewIndex];
                  return Visibility(
                    visible: listViewCommutesRecord.departureDatetime! >=
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
                                'BROWSE_COMMUTES_Card_64cz7cnr_ON_TAP');
                            logFirebaseEvent('Card_Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BrowseCommutesDetailsPageWidget(
                                  commuteRef: listViewCommutesRecord.reference,
                                ),
                              ),
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
                                        0, 0, 0, 4),
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
                                                'BROWSE_COMMUTES_CircleImage_lyk7aa0f_ON_');
                                            logFirebaseEvent(
                                                'CircleImage_Expand-Image');
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
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
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
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
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
                                        0, 0, 0, 4),
                                    child: FutureBuilder<VehiclesRecord>(
                                      future: VehiclesRecord.getDocumentOnce(
                                          listViewCommutesRecord.vehicle!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                'BROWSE_COMMUTES_Image_cckz8ort_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_Expand-Image');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: CachedNetworkImage(
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      imageVehiclesRecord
                                                          .imageURL,
                                                      'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: valueOrDefault<String>(
                                                    imageVehiclesRecord
                                                        .imageURL,
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
                                              imageVehiclesRecord.imageURL,
                                              'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3' +
                                                  '$listViewIndex',
                                            ),
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  imageVehiclesRecord.imageURL,
                                                  'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                                ),
                                                width: MediaQuery.of(context)
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
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
                                          child: Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Name: ${listViewCommutesRecord.origin}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    'Address: ${listViewCommutesRecord.originAddress}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
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
                                          child: Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Name: ${listViewCommutesRecord.destination}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    'Address: ${listViewCommutesRecord.destinationAddress}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
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
                                                            listViewCommutesRecord
                                                                .departureDatetime!),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
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
                                                                .departureDatetime!),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
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
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
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
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
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
      ),
    );
  }
}
