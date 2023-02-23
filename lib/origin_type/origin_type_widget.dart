import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'origin_type_model.dart';
export 'origin_type_model.dart';

class OriginTypeWidget extends StatefulWidget {
  const OriginTypeWidget({Key? key}) : super(key: key);

  @override
  _OriginTypeWidgetState createState() => _OriginTypeWidgetState();
}

class _OriginTypeWidgetState extends State<OriginTypeWidget> {
  late OriginTypeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OriginTypeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'originType'});
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
            logFirebaseEvent('ORIGIN_TYPE_arrow_back_rounded_ICN_ON_TA');
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
              logFirebaseEvent('ORIGIN_TYPE_close_rounded_ICN_ON_TAP');
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
                      child: FlutterFlowRadioButton(
                        options: [
                          'Current Device Location',
                          'Choose Different Location'
                        ].toList(),
                        onChanged: (val) =>
                            setState(() => _model.radioButtonValue = val),
                        optionHeight: 30,
                        textStyle: FlutterFlowTheme.of(context).bodyText2,
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.vertical,
                        radioButtonColor:
                            FlutterFlowTheme.of(context).primaryColor,
                        inactiveRadioButtonColor: Color(0x8A000000),
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ORIGIN_TYPE_PAGE_NEXT_BTN_ON_TAP');
                    currentUserLocationValue = await getCurrentUserLocation(
                        defaultLocation: LatLng(0.0, 0.0));
                    var _shouldSetState = false;
                    if (_model.radioButtonValue == 'Current Device Location') {
                      logFirebaseEvent('Button_custom_action');
                      _model.isLocationServiceEnabled =
                          await actions.checkLocationServiceEnabled();
                      _shouldSetState = true;
                      if (_model.isLocationServiceEnabled!) {
                        if (currentUserLocationValue != null) {
                          logFirebaseEvent('Button_custom_action');
                          _model.currrentDeviceLocation =
                              await actions.reverseGeocode(
                            currentUserLocationValue!,
                          );
                          _shouldSetState = true;
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().tempOriginReversed =
                              _model.currrentDeviceLocation!;
                          FFAppState().tempOriginLatLng =
                              currentUserLocationValue;
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('destination');
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Alert'),
                                content: Text(
                                    'Make sure your device\'s location services are turned on.'),
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
                        }
                      } else {
                        logFirebaseEvent('Button_custom_action');
                        await actions.requestEnableLocationService();
                      }

                      if (_shouldSetState) setState(() {});
                      return;
                    } else {
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('origin');

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
