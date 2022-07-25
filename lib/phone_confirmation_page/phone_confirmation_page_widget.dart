import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
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
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'phone_confirmation_page'});
    securityCodeTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          logFirebaseEvent('PHONE_CONFIRMATION_FloatingActionButton_');
          logFirebaseEvent('FloatingActionButton_Auth');
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
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        label: Text(
          'Verify',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                child: Text(
                  'Phone Confirmation',
                  style: FlutterFlowTheme.of(context).title1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                child: Text(
                  'Please enter the confirmation code we just sent to your phone number. Find it in your messages.',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 15, 8, 8),
                child: TextFormField(
                  controller: securityCodeTextFieldController,
                  autofocus: true,
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
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
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
        ),
      ),
    );
  }
}
