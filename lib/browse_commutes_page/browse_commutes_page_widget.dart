import '../backend/backend.dart';
import '../components/commutes_filter_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
          'Find Commutes',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryBackground,
                fontSize: 18,
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
              logFirebaseEvent('IconButton_Bottom-Sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: CommutesFilterWidget(),
                    ),
                  );
                },
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: PagedListView<DocumentSnapshot<Object?>?, CommutesRecord>(
            pagingController: () {
              final Query<Object?> Function(Query<Object?>) queryBuilder =
                  (commutesRecord) => commutesRecord.orderBy('departure_date',
                      descending: true);
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
                      .orderBy('departure_date', descending: true),
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

              itemBuilder: (context, _, listViewIndex) {
                final listViewCommutesRecord =
                    _pagingController!.itemList![listViewIndex];
                return StreamBuilder<UsersRecord>(
                  stream:
                      UsersRecord.getDocument(listViewCommutesRecord.driver!),
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
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                  'BROWSE_COMMUTES_CircleImage_bg66tdo9_ON_');
                                              logFirebaseEvent(
                                                  'CircleImage_Expand-Image');
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      cardUsersRecord.photoUrl!,
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
                                                width: 120,
                                                height: 120,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  cardUsersRecord.photoUrl!,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Driver',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            Text(
                                              '${cardUsersRecord.displayName} ${cardUsersRecord.displaySurname}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Rating',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                formatNumber(
                                                  cardUsersRecord.rating!,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.periodDecimal,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Icon(
                                                Icons.star_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              StreamBuilder<VehiclesRecord>(
                                stream: VehiclesRecord.getDocument(
                                    listViewCommutesRecord.vehicle!),
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
                                          'BROWSE_COMMUTES_Image_bvpy6fpb_ON_TAP');
                                      logFirebaseEvent('Image_Expand-Image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              imageVehiclesRecord.imageURL!,
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: imageVehiclesRecord.imageURL!,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: imageVehiclesRecord.imageURL!,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          imageVehiclesRecord.imageURL!,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Divider(
                                height: 8,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Icon(
                                        Icons.access_time_rounded,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                        child: Wrap(
                                          spacing: 0,
                                          runSpacing: 0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
                                              child: Text(
                                                'Departure Time:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                  'jm',
                                                  listViewCommutesRecord
                                                      .departureTime!),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 8,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Icon(
                                        Icons.date_range_rounded,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                        child: Wrap(
                                          spacing: 0,
                                          runSpacing: 0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
                                              child: Text(
                                                'Departure Date:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                  'MMMMEEEEd',
                                                  listViewCommutesRecord
                                                      .departureTime!),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 8,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Icon(
                                        Icons
                                            .airline_seat_recline_normal_rounded,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                        child: Wrap(
                                          spacing: 0,
                                          runSpacing: 0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
                                              child: Text(
                                                'Available Seat(s):',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              listViewCommutesRecord
                                                  .availablePassengerSeats!
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 8,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Icon(
                                        Icons.monetization_on_rounded,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                        child: Wrap(
                                          spacing: 0,
                                          runSpacing: 0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
                                              child: Text(
                                                'Price/Seat',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              formatNumber(
                                                listViewCommutesRecord
                                                    .pricePerSeat!,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: '',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 0,
                                thickness: 1,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ],
                          ),
                        ),
                      ),
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
