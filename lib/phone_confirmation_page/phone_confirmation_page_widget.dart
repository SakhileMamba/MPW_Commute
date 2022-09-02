import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneConfirmationPageWidget extends StatefulWidget {
  const PhoneConfirmationPageWidget({Key? key}) : super(key: key);

  @override
  _PhoneConfirmationPageWidgetState createState() =>
      _PhoneConfirmationPageWidgetState();
}

class _PhoneConfirmationPageWidgetState
    extends State<PhoneConfirmationPageWidget> {
  TextEditingController? securityCodeTextFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PHONE_CONFIRMATION_phone_confirmation_pa');
      logFirebaseEvent('phone_confirmation_page_Update-Local-Sta');
      setState(() => FFAppState().filterCurrentDateTime = getCurrentTimestamp);
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'phone_confirmation_page'});
    securityCodeTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Phone Confirmation',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'Please enter the confirmation code we just sent to your phone number. Find it in your messages.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: TextFormField(
                        controller: securityCodeTextFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Confirmation Code',
                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          suffixIcon: Icon(
                            Icons.security_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('PHONE_CONFIRMATION_VERIFY_BTN_ON_TAP');
                    logFirebaseEvent('Button_Auth');
                    final smsCodeVal = securityCodeTextFieldController!.text;
                    if (smsCodeVal == null || smsCodeVal.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enter SMS verification code.'),
                        ),
                      );
                      return;
                    }
                    final phoneVerifiedUser = await verifySmsCode(
                      context: context,
                      smsCode: smsCodeVal,
                    );
                    if (phoneVerifiedUser == null) {
                      return;
                    }

                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NavBarPage(initialPage: 'browse_commutes_page'),
                      ),
                      (r) => false,
                    );
                  },
                  text: 'Verify',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
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
