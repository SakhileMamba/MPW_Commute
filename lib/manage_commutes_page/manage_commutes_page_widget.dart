import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_commute_page/create_commute_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ManageCommutesPageWidget extends StatefulWidget {
  const ManageCommutesPageWidget({Key? key}) : super(key: key);

  @override
  _ManageCommutesPageWidgetState createState() =>
      _ManageCommutesPageWidgetState();
}

class _ManageCommutesPageWidgetState extends State<ManageCommutesPageWidget> {
  PagingController<DocumentSnapshot?, CommutesRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'manage_commutes_page'});
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
          'Manage Commutes',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyText1.override(
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
              Icons.add_rounded,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('MANAGE_COMMUTES_add_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_Navigate-To');
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateCommutePageWidget(),
                ),
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
                  (commutesRecord) => commutesRecord
                      .where('driver', isEqualTo: currentUserReference)
                      .orderBy('departure_datetime', descending: true);
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
                      .where('driver', isEqualTo: currentUserReference)
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
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: textController1 ??= TextEditingController(
                            text: listViewCommutesRecord.origin,
                          ),
                          readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Origin',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.trip_origin_rounded,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 24,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.multiline,
                        ),
                        TextFormField(
                          controller: textController2 ??= TextEditingController(
                            text: listViewCommutesRecord.destination,
                          ),
                          readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Destination',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.location_pin,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 24,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.multiline,
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
                            final textFieldVehiclesRecord = snapshot.data!;
                            return TextFormField(
                              controller: textController3 ??=
                                  TextEditingController(
                                text:
                                    '${textFieldVehiclesRecord.year} ${textFieldVehiclesRecord.make} ${textFieldVehiclesRecord.model}',
                              ),
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Vehicle',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.directions_car_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            );
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController4 ??=
                                    TextEditingController(
                                  text: dateTimeFormat('MMMMEEEEd',
                                      listViewCommutesRecord.departureDatetime),
                                ),
                                readOnly: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Date',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.date_range_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                keyboardType: TextInputType.datetime,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: textController5 ??=
                                    TextEditingController(
                                  text: dateTimeFormat('jm',
                                      listViewCommutesRecord.departureDatetime),
                                ),
                                readOnly: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Time',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.access_time_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: TextFormField(
                                  controller: textController6 ??=
                                      TextEditingController(
                                    text: listViewCommutesRecord
                                        .availablePassengerSeats
                                        .toString(),
                                  ),
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Available Seat(s)',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.airline_seat_recline_normal_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 24,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: textController7 ??=
                                    TextEditingController(
                                  text: formatNumber(
                                    listViewCommutesRecord.pricePerSeat,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.periodDecimal,
                                    currency: 'E',
                                  ),
                                ),
                                readOnly: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Price/Seat',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.monetization_on_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
