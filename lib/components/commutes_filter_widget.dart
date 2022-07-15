import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
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
  DateTime? datePicked;
  String? dropDownValue1;
  String? dropDownValue2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
            height: 16,
            color: FlutterFlowTheme.of(context).primaryColor,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Container(
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
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<SupportedLocationsRecord>
                          dropDownSupportedLocationsRecordList = snapshot.data!;
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
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 16,
            color: FlutterFlowTheme.of(context).primaryColor,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Container(
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
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<SupportedLocationsRecord>
                          dropDownSupportedLocationsRecordList = snapshot.data!;
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
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 16,
            color: FlutterFlowTheme.of(context).primaryColor,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Container(
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
                      'Departure  Date',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'COMMUTES_FILTER_Container_tna3plk0_ON_TA');
                      logFirebaseEvent('Container_Date-Time-Picker');
                      final DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                          helpText: 'Select a date');

                      if (newDate != null) {
                        setState(() => datePicked = newDate);
                      }

                      logFirebaseEvent('Container_Update-Local-State');
                      setState(() =>
                          FFAppState().filterDate = datePicked!.toString());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
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
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.date_range,
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
          ),
          Divider(
            height: 16,
            color: FlutterFlowTheme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
