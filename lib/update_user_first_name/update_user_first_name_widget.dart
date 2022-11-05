import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateUserFirstNameWidget extends StatefulWidget {
  const UpdateUserFirstNameWidget({Key? key}) : super(key: key);

  @override
  _UpdateUserFirstNameWidgetState createState() =>
      _UpdateUserFirstNameWidgetState();
}

class _UpdateUserFirstNameWidgetState extends State<UpdateUserFirstNameWidget> {
  TextEditingController? firstNameController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('UPDATE_USER_FIRST_NAME_update_user_first');
      logFirebaseEvent('update_user_first_name_update_local_stat');
      setState(() => FFAppState().filterCurrentDateTime = getCurrentTimestamp);
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'update_user_first_name'});
    firstNameController = TextEditingController(text: currentUserDisplayName);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    firstNameController?.dispose();
    super.dispose();
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
                      'Personal Information',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'Please enter your first name. Make sure it matches the name in your government ID.',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: AuthUserStreamWidget(
                        child: TextFormField(
                          controller: firstNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'First Name',
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
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: Icon(
                              Icons.account_circle_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal,
                                  ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'UPDATE_USER_FIRST_NAME_UPDATE_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');

                    final usersUpdateData = createUsersRecordData(
                      displayName: firstNameController!.text,
                    );
                    await currentUserReference!.update(usersUpdateData);
                  },
                  text: 'Update',
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
