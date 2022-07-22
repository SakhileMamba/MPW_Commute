import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../phone_authentication_page/phone_authentication_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({Key? key}) : super(key: key);

  @override
  _AccountPageWidgetState createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'account_page'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.insert_photo_rounded,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 50,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Container(
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://media-exp1.licdn.com/dms/image/C4D03AQEU0zOhidilGg/profile-displayphoto-shrink_200_200/0/1658364381892?e=1663804800&v=beta&t=k0EFoa4LhAgD59C5k8u7z3GhcVaOLBuysWbBINLOFqU',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: Text(
                      'Account Settings',
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: Colors.black,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                'Personal Infomation',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.black,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                'Subscription',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_car_rounded,
                            color: Colors.black,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                'Vehicles',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: Text(
                      'Legal',
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu_book_rounded,
                            color: Colors.black,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                'Terms of Service',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.privacy_tip_rounded,
                            color: Colors.black,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                'Privacy Policy',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('ACCOUNT_PAGE_PAGE_LOGOUT_BTN_ON_TAP');
                        logFirebaseEvent('Button_Auth');
                        await signOut();
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PhoneAuthenticationPageWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'Logout',
                      icon: Icon(
                        Icons.logout,
                        size: 24,
                      ),
                      options: FFButtonOptions(
                        width: 130,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
