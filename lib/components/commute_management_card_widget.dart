import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CommuteManagementCardWidget extends StatefulWidget {
  const CommuteManagementCardWidget({Key? key}) : super(key: key);

  @override
  _CommuteManagementCardWidgetState createState() =>
      _CommuteManagementCardWidgetState();
}

class _CommuteManagementCardWidgetState
    extends State<CommuteManagementCardWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: 'Manzini, Eswatini');
    textController2 = TextEditingController(text: 'Mbabane, Eswatini');
    textController3 = TextEditingController(text: 'Toyota Hilux');
    textController4 = TextEditingController(text: 'Friday 12, July');
    textController5 = TextEditingController(text: '9:40am');
    textController6 = TextEditingController(text: '3');
    textController7 = TextEditingController(text: '30.00');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).primaryBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: textController1,
                autofocus: true,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Origin',
                  hintText: 'Manzini, Eswatini',
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
                controller: textController2,
                autofocus: true,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Destination',
                  hintText: 'Mbabane, Eswatini',
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
              TextFormField(
                controller: textController3,
                autofocus: true,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Vehicle',
                  hintText: 'Toyota Hilux',
                  hintStyle: FlutterFlowTheme.of(context).bodyText2,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.directions_car_rounded,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 24,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textController4,
                      autofocus: true,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        hintText: 'Friday 12, July',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.date_range_rounded,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 24,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textController5,
                      autofocus: true,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Time',
                        hintText: '9:40am',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.access_time_rounded,
                          color: FlutterFlowTheme.of(context).primaryColor,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                      child: TextFormField(
                        controller: textController6,
                        autofocus: true,
                        readOnly: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Available Seat(s)',
                          hintText: '3',
                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.airline_seat_recline_normal_rounded,
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                      controller: textController7,
                      autofocus: true,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Price/Seat',
                        hintText: '30.00',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.monetization_on_rounded,
                          color: FlutterFlowTheme.of(context).primaryColor,
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
      ),
    );
  }
}
