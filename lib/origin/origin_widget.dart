import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'origin_model.dart';
export 'origin_model.dart';

class OriginWidget extends StatefulWidget {
  const OriginWidget({Key? key}) : super(key: key);

  @override
  _OriginWidgetState createState() => _OriginWidgetState();
}

class _OriginWidgetState extends State<OriginWidget> {
  late OriginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OriginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'origin'});
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('ORIGIN_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Origin',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
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
              Icons.close_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('ORIGIN_PAGE_close_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_alert_dialog');
              var confirmDialogResponse = await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Cancel Request'),
                        content: Text(
                            'Are you sure you want to cancel this request?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  ) ??
                  false;
              if (confirmDialogResponse) {
                logFirebaseEvent('IconButton_update_app_state');
                FFAppState().tempRequestType = '';
                FFAppState().tempDepartureDateTime = null;
                FFAppState().tempSeats = 0;
                FFAppState().tempPrice = 0.0;
                FFAppState().tempChosenVehicleMaxSeats = 0;
                FFAppState().tempProposingToDrive = false;
                FFAppState().tempPassengerHailingDriverRef = null;
                FFAppState().tempHailingPassengerAccountRef = null;
                FFAppState().tempOriginLatLng = null;
                FFAppState().tempDestinationLatLng = null;
                FFAppState().tempOriginReversed = null;
                FFAppState().tempDestinationReversed = null;
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('beginRequest');

                return;
              } else {
                return;
              }
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Choose your origin. ',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: FlutterFlowPlacePicker(
                        iOSGoogleMapsApiKey:
                            'AIzaSyBv2c71scP8DWTtc-zAmpCniS3HgVP8vFM',
                        androidGoogleMapsApiKey:
                            'AIzaSyCDdREB-y1l84iC_QLbgPNlVDPeK7euRsg',
                        webGoogleMapsApiKey:
                            'AIzaSyAqMpvumo1SHrdsD9moyulPYRxC5O58XCg',
                        onSelect: (place) async {
                          setState(() => _model.placePickerValue = place);
                        },
                        defaultText: 'Select Location',
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
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ORIGIN_PAGE_NEXT_BTN_ON_TAP');
                    var _shouldSetState = false;
                    if (_model.placePickerValue != null) {
                      logFirebaseEvent('Button_custom_action');
                      _model.chosenOriginReversed =
                          await actions.reverseGeocode(
                        _model.placePickerValue.latLng,
                      );
                      _shouldSetState = true;
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().tempOriginReversed =
                          _model.chosenOriginReversed!;
                      FFAppState().tempOriginLatLng =
                          _model.placePickerValue.latLng;
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('destination');

                      if (_shouldSetState) setState(() {});
                      return;
                    } else {
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Choose your origin'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Continue'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    elevation: 8,
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
        ),
      ),
    );
  }
}
