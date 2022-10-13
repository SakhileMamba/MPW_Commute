import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInformationUpdatePageWidget extends StatefulWidget {
  const PersonalInformationUpdatePageWidget({Key? key}) : super(key: key);

  @override
  _PersonalInformationUpdatePageWidgetState createState() =>
      _PersonalInformationUpdatePageWidgetState();
}

class _PersonalInformationUpdatePageWidgetState
    extends State<PersonalInformationUpdatePageWidget> {
  DateTime? datePicked;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  String? dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'personal_information_update_page'});
    textController1 = TextEditingController(text: currentUserDisplayName);
    textController2 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.displaySurname, ''));
    textController3 = TextEditingController(text: currentPhoneNumber);
    textController4 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.referrersCode, ''));
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('PERSONAL_INFORMATION_UPDATE_arrow_back_r');
            logFirebaseEvent('IconButton_Navigate-Back');
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Personal Info',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: InkWell(
              onTap: () async {
                logFirebaseEvent('PERSONAL_INFORMATION_UPDATE_Column_z9py0');
                logFirebaseEvent('Column_Backend-Call');

                final usersUpdateData = createUsersRecordData(
                  displayName: textController1!.text,
                  displaySurname: textController2!.text,
                  gender: dropDownValue,
                );
                await currentUserReference!.update(usersUpdateData);
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: AuthUserStreamWidget(
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
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
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: AuthUserStreamWidget(
                        child: TextFormField(
                          controller: textController2,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Surname',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
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
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: AuthUserStreamWidget(
                        child: TextFormField(
                          controller: textController3,
                          readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
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
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                    if (valueOrDefault(
                                currentUserDocument?.referrersCode, '') ==
                            null ||
                        valueOrDefault(
                                currentUserDocument?.referrersCode, '') ==
                            '')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: AuthUserStreamWidget(
                          child: TextFormField(
                            controller: textController4,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Referrer\'s Code',
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'Birth Date',
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'PERSONAL_INFORMATION_UPDATE_Container_sv');
                          logFirebaseEvent('Container_Date-Time-Picker');
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked = date);
                            },
                            currentTime: getCurrentTimestamp,
                            minTime: DateTime(0, 0, 0),
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: () => LocaleType.en,
                            ),
                          );

                          logFirebaseEvent('Container_Update-Local-State');
                          setState(
                              () => FFAppState().userBirthDate = datePicked);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            child: Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  'yMMMd',
                                  FFAppState().userBirthDate,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                'Select date',
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'Gender',
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: AuthUserStreamWidget(
                        child: FlutterFlowDropDown(
                          initialOption: dropDownValue ??=
                              valueOrDefault(currentUserDocument?.gender, ''),
                          options: ['Male', 'Female'],
                          onChanged: (val) =>
                              setState(() => dropDownValue = val),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Select gender',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: FlutterFlowTheme.of(context).primaryText,
                          borderWidth: 0,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(14, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                    ),
                    if (!valueOrDefault<bool>(
                        currentUserDocument?.verifiedUser, false))
                      AuthUserStreamWidget(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PERSONAL_INFORMATION_UPDATE_CANCEL_BTN_O');
                                    logFirebaseEvent('Button_Navigate-Back');
                                    Navigator.pop(context);
                                  },
                                  text: 'Cancel',
                                  icon: Icon(
                                    Icons.cancel_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    elevation: 8,
                                    borderSide: BorderSide(
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PERSONAL_INFORMATION_UPDATE_SAVE_BTN_ON_');
                                    if (textController1!.text != null &&
                                        textController1!.text != '') {
                                      if (textController2!.text != null &&
                                          textController2!.text != '') {
                                        if (dateTimeFormat(
                                                  'yMMMd',
                                                  FFAppState().userBirthDate,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ) !=
                                                null &&
                                            dateTimeFormat(
                                                  'yMMMd',
                                                  FFAppState().userBirthDate,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ) !=
                                                '') {
                                          if (!(dropDownValue != null &&
                                              dropDownValue != '')) {
                                            logFirebaseEvent(
                                                'Button_Alert-Dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Missing Profile Information'),
                                                  content: Text(
                                                      'Please choose your gender.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Continue'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            return;
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Button_Alert-Dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Missing Profile Information'),
                                                content: Text(
                                                    'Please choose your date of birth.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Continue'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          return;
                                        }
                                      } else {
                                        logFirebaseEvent('Button_Alert-Dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Missing Profile Information'),
                                              content: Text(
                                                  'Please input your surname.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Continue'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        return;
                                      }
                                    } else {
                                      logFirebaseEvent('Button_Alert-Dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Missing Profile Information'),
                                            content: Text(
                                                'Please input your name. '),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Continue'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      return;
                                    }

                                    logFirebaseEvent('Button_Backend-Call');

                                    final usersUpdateData =
                                        createUsersRecordData(
                                      displayName: textController1!.text,
                                      displaySurname: textController2!.text,
                                      gender: dropDownValue,
                                      birthDate: datePicked,
                                      referrersCode: textController4!.text,
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    logFirebaseEvent('Button_Navigate-To');
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'account_page'),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                  text: 'Save',
                                  icon: Icon(
                                    Icons.check_circle_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    elevation: 8,
                                    borderSide: BorderSide(
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
