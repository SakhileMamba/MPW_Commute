import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateCommuteWidget extends StatefulWidget {
  const CreateCommuteWidget({Key? key}) : super(key: key);

  @override
  _CreateCommuteWidgetState createState() => _CreateCommuteWidgetState();
}

class _CreateCommuteWidgetState extends State<CreateCommuteWidget> {
  DateTime? datePicked1;
  var placePickerValue1 = FFPlace();
  var placePickerValue2 = FFPlace();
  DateTime? datePicked2;
  String? dropDownValue1;
  String? dropDownValue2;
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Create Commute',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'Origin',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                      FlutterFlowPlacePicker(
                        iOSGoogleMapsApiKey:
                            'AIzaSyBv2c71scP8DWTtc-zAmpCniS3HgVP8vFM',
                        androidGoogleMapsApiKey:
                            'AIzaSyCDdREB-y1l84iC_QLbgPNlVDPeK7euRsg',
                        webGoogleMapsApiKey:
                            'AIzaSyAqMpvumo1SHrdsD9moyulPYRxC5O58XCg',
                        onSelect: (place) async {
                          setState(() => placePickerValue1 = place);
                        },
                        defaultText: 'Please select',
                        icon: Icon(
                          Icons.trip_origin_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        buttonOptions: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
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
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'Destination',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                      FlutterFlowPlacePicker(
                        iOSGoogleMapsApiKey:
                            'AIzaSyBv2c71scP8DWTtc-zAmpCniS3HgVP8vFM',
                        androidGoogleMapsApiKey:
                            'AIzaSyCDdREB-y1l84iC_QLbgPNlVDPeK7euRsg',
                        webGoogleMapsApiKey:
                            'AIzaSyAqMpvumo1SHrdsD9moyulPYRxC5O58XCg',
                        onSelect: (place) async {
                          setState(() => placePickerValue2 = place);
                        },
                        defaultText: 'Please select',
                        icon: Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 24,
                        ),
                        buttonOptions: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
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
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'Departure Date',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'CREATE_COMMUTE_Container_q9dpexct_ON_TAP');
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
                              orElse: () => LocaleType.en,
                            ),
                          );

                          logFirebaseEvent('Container_Update-Local-State');
                          setState(() => FFAppState().filterDate =
                              dateTimeFormat('MMMEd', datePicked1));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
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
                                      FFAppState().filterDate,
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
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'Departure Time',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'CREATE_COMMUTE_Container_1q49yntm_ON_TAP');
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
                              orElse: () => LocaleType.en,
                            ),
                          );

                          logFirebaseEvent('Container_Update-Local-State');
                          setState(() =>
                              FFAppState().filterLatestDepartureTime =
                                  dateTimeFormat('jm', datePicked2));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
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
                                      FFAppState().filterLatestDepartureTime,
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
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'Vehicle',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
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
                            options: dropDownSupportedLocationsRecord
                                .eswatiniLocations!
                                .toList()
                                .toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue1 = val),
                            width: double.infinity,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            hintText: 'Please select',
                            icon: Icon(
                              Icons.directions_car_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
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
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'Available Seats',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
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
                            options: ['1', '2', '3', '4'],
                            onChanged: (val) =>
                                setState(() => dropDownValue2 = val),
                            width: double.infinity,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                    ),
                            hintText: 'Please select',
                            icon: Icon(
                              Icons.airline_seat_recline_normal_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
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
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'Price/Seat',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Please input',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                  suffixIcon: Icon(
                                    Icons.monetization_on_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(
                              width: 6,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryBackground,
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
                          text: 'Cancel',
                          icon: Icon(
                            Icons.cancel_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
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
                              color: Colors.black,
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
                          text: 'Proceed',
                          icon: Icon(
                            Icons.check_circle_rounded,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 130,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
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
