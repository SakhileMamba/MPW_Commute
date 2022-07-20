import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CommutesFilterWidget extends StatefulWidget {
  const CommutesFilterWidget({Key? key}) : super(key: key);

  @override
  _CommutesFilterWidgetState createState() => _CommutesFilterWidgetState();
}

class _CommutesFilterWidgetState extends State<CommutesFilterWidget> {
  DateTime? datePicked1;
  String? dropDownValue1;
  String? dropDownValue2;
  DateTime? datePicked2;
  String? dropDownValue3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryColor,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Commutes Filters',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                ),
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Origin',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                        ),
                      ),
                      StreamBuilder<List<SupportedLocationsRecord>>(
                        stream: querySupportedLocationsRecord(
                          singleRecord: true,
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
                          List<SupportedLocationsRecord>
                              dropDownSupportedLocationsRecordList =
                              snapshot.data!;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final dropDownSupportedLocationsRecord =
                              dropDownSupportedLocationsRecordList.first;
                          return FlutterFlowDropDown(
                            options: dropDownSupportedLocationsRecord!
                                .eswatiniLocations!
                                .toList()!
                                .toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue1 = val),
                            width: double.infinity,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                    ),
                            hintText: 'Please select...',
                            icon: Icon(
                              Icons.trip_origin_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            borderWidth: 0,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Destination',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                        ),
                      ),
                      StreamBuilder<List<SupportedLocationsRecord>>(
                        stream: querySupportedLocationsRecord(
                          singleRecord: true,
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
                          List<SupportedLocationsRecord>
                              dropDownSupportedLocationsRecordList =
                              snapshot.data!;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final dropDownSupportedLocationsRecord =
                              dropDownSupportedLocationsRecordList.first;
                          return FlutterFlowDropDown(
                            options: dropDownSupportedLocationsRecord!
                                .eswatiniLocations!
                                .toList()!
                                .toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue2 = val),
                            width: double.infinity,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                    ),
                            hintText: 'Please select...',
                            icon: Icon(
                              Icons.location_pin,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderWidth: 0,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Departure Date',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'COMMUTES_FILTER_Container_48sa85mx_ON_TA');
                          logFirebaseEvent('Container_Date-Time-Picker');
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked1 = date);
                            },
                            currentTime: getCurrentTimestamp,
                            minTime: getCurrentTimestamp,
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: null,
                            ),
                          );

                          logFirebaseEvent('Container_Update-Local-State');
                          setState(() => FFAppState().filterDate =
                              dateTimeFormat('MMMEd', datePicked1!));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                                    child: Text(
                                      FFAppState().filterDate!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.date_range_rounded,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Latest Departure Time',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'COMMUTES_FILTER_Container_ver1au6f_ON_TA');
                          logFirebaseEvent('Container_Date-Time-Picker');
                          await DatePicker.showTimePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked2 = date);
                            },
                            currentTime: getCurrentTimestamp,
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: null,
                            ),
                          );

                          logFirebaseEvent('Container_Update-Local-State');
                          setState(() =>
                              FFAppState().filterLatestDepartureTime =
                                  dateTimeFormat('jm', datePicked2!));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                                    child: Text(
                                      FFAppState().filterLatestDepartureTime!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Minimum Available Seats',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                        ),
                      ),
                      StreamBuilder<List<SupportedLocationsRecord>>(
                        stream: querySupportedLocationsRecord(
                          singleRecord: true,
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
                          List<SupportedLocationsRecord>
                              dropDownSupportedLocationsRecordList =
                              snapshot.data!;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final dropDownSupportedLocationsRecord =
                              dropDownSupportedLocationsRecordList.first;
                          return FlutterFlowDropDown(
                            initialOption: dropDownValue3 ??= '1',
                            options: FFAppState()
                                .filterMinimumAvailableSeats!
                                .map((e) => e.toString())
                                .toList()
                                .toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue3 = val),
                            width: double.infinity,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                    ),
                            hintText: 'Please select...',
                            icon: Icon(
                              Icons.airline_seat_recline_normal_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            borderWidth: 0,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Clear',
                          icon: Icon(
                            Icons.clear_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 130,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Filter',
                          icon: Icon(
                            Icons.filter_list_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 130,
                            height: 50,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }
}
