import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../phone_confirmation/phone_confirmation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneAuthWidget extends StatefulWidget {
  const PhoneAuthWidget({Key? key}) : super(key: key);

  @override
  _PhoneAuthWidgetState createState() => _PhoneAuthWidgetState();
}

class _PhoneAuthWidgetState extends State<PhoneAuthWidget> {
  TextEditingController? phoneNumberTextFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Phone_Auth'});
    phoneNumberTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          logFirebaseEvent('PHONE_AUTH_FloatingActionButton_76jr1fdt');
          logFirebaseEvent('FloatingActionButton_Auth');
          final phoneNumberVal = phoneNumberTextFieldController!.text;
          if (phoneNumberVal == null ||
              phoneNumberVal.isEmpty ||
              !phoneNumberVal.startsWith('+')) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Phone Number is required and has to start with +.'),
              ),
            );
            return;
          }
          await beginPhoneAuth(
            context: context,
            phoneNumber: phoneNumberVal,
            onCodeSent: () async {
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => PhoneConfirmationWidget(),
                ),
                (r) => false,
              );
            },
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        label: Text(
          'Request Code',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
              child: Text(
                'Authentication',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
              child: Text(
                'Please enter your phone number below. Include your country\'s dialing code.',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 15, 8, 8),
              child: TextFormField(
                controller: phoneNumberTextFieldController,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
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
                  prefixIcon: Icon(
                    Icons.phone_android_rounded,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
                maxLines: 1,
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
