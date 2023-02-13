import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'request_type_model.dart';
export 'request_type_model.dart';

class RequestTypeWidget extends StatefulWidget {
  const RequestTypeWidget({Key? key}) : super(key: key);

  @override
  _RequestTypeWidgetState createState() => _RequestTypeWidgetState();
}

class _RequestTypeWidgetState extends State<RequestTypeWidget> {
  late RequestTypeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestTypeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'requestType'});
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
            logFirebaseEvent('REQUEST_TYPE_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Request Type',
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
                      'Are you looking for drivers or passengers?',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: FlutterFlowRadioButton(
                        options: ['Drivers', 'Passengers'].toList(),
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
                    logFirebaseEvent('REQUEST_TYPE_PAGE_NEXT_BTN_ON_TAP');
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().tempRequestType = _model.radioButtonValue!;
                    if (FFAppState().tempRequestType == 'Passengers') {
                      if (valueOrDefault<bool>(
                          currentUserDocument?.verifiedDriver, false)) {
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('originType');

                        return;
                      } else {
                        logFirebaseEvent('Button_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Driver\'s License Verification'),
                                  content: Text(
                                      'Please upload your driver\'s license and send a request to verify it before you can request for passengers to rideshare with you.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Verify License'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('driversLicense');

                          return;
                        } else {
                          return;
                        }
                      }
                    } else {
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('originType');

                      return;
                    }
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
