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
import 'filter_origin_model.dart';
export 'filter_origin_model.dart';

class FilterOriginWidget extends StatefulWidget {
  const FilterOriginWidget({Key? key}) : super(key: key);

  @override
  _FilterOriginWidgetState createState() => _FilterOriginWidgetState();
}

class _FilterOriginWidgetState extends State<FilterOriginWidget> {
  late FilterOriginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterOriginModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'filterOrigin'});
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
        title: Text(
          'Origin Filter',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
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
                    logFirebaseEvent('FILTER_ORIGIN_PAGE_NEXT_BTN_ON_TAP');
                    var _shouldSetState = false;
                    if (_model.placePickerValue != null) {
                      logFirebaseEvent('Button_custom_action');
                      _model.chosenOriginReversed =
                          await actions.reverseGeocode(
                        _model.placePickerValue.latLng,
                      );
                      _shouldSetState = true;
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().filterTempOriginReversed =
                          _model.chosenOriginReversed!;
                      FFAppState().filterTempOriginLatLng =
                          _model.placePickerValue.latLng;
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('filterDestination');

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
