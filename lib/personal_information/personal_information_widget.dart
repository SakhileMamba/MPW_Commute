import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'personal_information_model.dart';
export 'personal_information_model.dart';

class PersonalInformationWidget extends StatefulWidget {
  const PersonalInformationWidget({Key? key}) : super(key: key);

  @override
  _PersonalInformationWidgetState createState() =>
      _PersonalInformationWidgetState();
}

class _PersonalInformationWidgetState extends State<PersonalInformationWidget> {
  late PersonalInformationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalInformationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'personalInformation'});
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: Visibility(
          visible:
              valueOrDefault<bool>(currentUserDocument?.verifiedUser, false) ||
                  valueOrDefault<bool>(
                      currentUserDocument?.accountVerificationSent, false),
          child: AuthUserStreamWidget(
            builder: (context) => FlutterFlowIconButton(
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
                logFirebaseEvent('PERSONAL_INFORMATION_arrow_back_rounded_');
                if (valueOrDefault<bool>(
                        currentUserDocument?.verifiedUser, false) ||
                    valueOrDefault<bool>(
                        currentUserDocument?.accountVerificationSent, false)) {
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                  return;
                } else {
                  logFirebaseEvent('IconButton_alert_dialog');
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Account Verification'),
                        content: Text(
                            'Please verification for your account. If you need to edit your personal information, click on the info you\'d like to edit.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Continue'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }
              },
            ),
          ),
        ),
        title: Text(
          'Personal Information',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'PERSONAL_INFORMATION_ListTile_7mexss2q_O');
                          if (valueOrDefault<bool>(
                              currentUserDocument?.verifiedUser, false)) {
                            logFirebaseEvent('ListTile_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Alert'),
                                  content: Text(
                                      'You are not allowed to edit your personal information once your account is verified.'),
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
                            return;
                          } else {
                            if (valueOrDefault<bool>(
                                currentUserDocument?.accountVerificationSent,
                                false)) {
                              logFirebaseEvent('ListTile_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    content: Text(
                                        'You are not allowed to edit this information whilst your account is pending verification.'),
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
                              return;
                            } else {
                              logFirebaseEvent('ListTile_navigate_to');

                              context.goNamed('firstName');

                              return;
                            }
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'First Name',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                          subtitle: Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                        ),
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'PERSONAL_INFORMATION_ListTile_sy97y78h_O');
                          if (valueOrDefault<bool>(
                              currentUserDocument?.verifiedUser, false)) {
                            logFirebaseEvent('ListTile_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Alert'),
                                  content: Text(
                                      'You are not allowed to edit your personal information once your account is verified.'),
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
                            return;
                          } else {
                            if (valueOrDefault<bool>(
                                currentUserDocument?.accountVerificationSent,
                                false)) {
                              logFirebaseEvent('ListTile_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    content: Text(
                                        'You are not allowed to edit this information whilst your account is pending verification.'),
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
                              return;
                            } else {
                              logFirebaseEvent('ListTile_navigate_to');

                              context.goNamed('surname');

                              return;
                            }
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Surname',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                          subtitle: Text(
                            valueOrDefault(
                                currentUserDocument?.displaySurname, ''),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                        ),
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'PERSONAL_INFORMATION_ListTile_c23m4vko_O');
                          if (valueOrDefault<bool>(
                              currentUserDocument?.verifiedUser, false)) {
                            logFirebaseEvent('ListTile_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Alert'),
                                  content: Text(
                                      'You are not allowed to edit your personal information once your account is verified.'),
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
                            return;
                          } else {
                            if (valueOrDefault<bool>(
                                currentUserDocument?.accountVerificationSent,
                                false)) {
                              logFirebaseEvent('ListTile_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    content: Text(
                                        'You are not allowed to edit this information whilst your account is pending verification.'),
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
                              return;
                            } else {
                              logFirebaseEvent('ListTile_navigate_to');

                              context.goNamed('gender');

                              return;
                            }
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Gender',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                          subtitle: Text(
                            valueOrDefault(currentUserDocument?.gender, ''),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                        ),
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'PERSONAL_INFORMATION_ListTile_axbhcuft_O');
                          if (valueOrDefault<bool>(
                              currentUserDocument?.verifiedUser, false)) {
                            logFirebaseEvent('ListTile_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Alert'),
                                  content: Text(
                                      'You are not allowed to edit your personal information once your account is verified.'),
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
                            return;
                          } else {
                            if (valueOrDefault<bool>(
                                currentUserDocument?.accountVerificationSent,
                                false)) {
                              logFirebaseEvent('ListTile_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    content: Text(
                                        'You are not allowed to edit this information whilst your account is pending verification.'),
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
                              return;
                            } else {
                              logFirebaseEvent('ListTile_update_app_state');
                              FFAppState().userBirthDate =
                                  currentUserDocument!.birthDate;
                              logFirebaseEvent('ListTile_navigate_to');

                              context.goNamed('birthdate');

                              return;
                            }
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Birthdate',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                          subtitle: Text(
                            dateTimeFormat(
                              'yMMMd',
                              currentUserDocument!.birthDate!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                        ),
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'PERSONAL_INFORMATION_ListTile_pef9pwta_O');
                          if (valueOrDefault<bool>(
                              currentUserDocument?.verifiedUser, false)) {
                            logFirebaseEvent('ListTile_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Alert'),
                                  content: Text(
                                      'You are not allowed to edit your personal information once your account is verified.'),
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
                            return;
                          } else {
                            if (valueOrDefault<bool>(
                                currentUserDocument?.accountVerificationSent,
                                false)) {
                              logFirebaseEvent('ListTile_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    content: Text(
                                        'You are not allowed to edit this information whilst your account is pending verification.'),
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
                              return;
                            } else {
                              logFirebaseEvent('ListTile_update_app_state');
                              FFAppState().currentPhotoURLTempID =
                                  valueOrDefault(
                                      currentUserDocument?.nationalIdPhotoUrl,
                                      '');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.goNamed('governmentId');

                              return;
                            }
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Government ID',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                          subtitle: Text(
                            valueOrDefault(
                                            currentUserDocument
                                                ?.nationalIdPhotoUrl,
                                            '') !=
                                        null &&
                                    valueOrDefault(
                                            currentUserDocument
                                                ?.nationalIdPhotoUrl,
                                            '') !=
                                        ''
                                ? 'Provided'
                                : 'Not Provided',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!valueOrDefault<bool>(
                      currentUserDocument?.verifiedUser, false) &&
                  !valueOrDefault<bool>(
                      currentUserDocument?.accountVerificationSent, false))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'PERSONAL_INFORMATION_REQUEST_VERIFICATIO');
                        if (currentUserDisplayName != null &&
                            currentUserDisplayName != '') {
                          if (valueOrDefault(
                                      currentUserDocument?.displaySurname,
                                      '') !=
                                  null &&
                              valueOrDefault(
                                      currentUserDocument?.displaySurname,
                                      '') !=
                                  '') {
                            if (currentUserPhoto != null &&
                                currentUserPhoto != '') {
                              if (valueOrDefault(
                                          currentUserDocument
                                              ?.nationalIdPhotoUrl,
                                          '') !=
                                      null &&
                                  valueOrDefault(
                                          currentUserDocument
                                              ?.nationalIdPhotoUrl,
                                          '') !=
                                      '') {
                                if (valueOrDefault(
                                            currentUserDocument?.gender, '') !=
                                        null &&
                                    valueOrDefault(
                                            currentUserDocument?.gender, '') !=
                                        '') {
                                  logFirebaseEvent('Button_backend_call');

                                  final verificationRequestsCreateData =
                                      createVerificationRequestsRecordData(
                                    requestUserRef: currentUserReference,
                                    requestDatetime: getCurrentTimestamp,
                                  );
                                  await VerificationRequestsRecord.collection
                                      .doc()
                                      .set(verificationRequestsCreateData);
                                  logFirebaseEvent('Button_backend_call');

                                  final usersUpdateData = createUsersRecordData(
                                    accountVerificationSent: true,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Alert'),
                                        content: Text(
                                            'Account verification request sent.'),
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
                                  logFirebaseEvent('Button_navigate_to');

                                  context.goNamed('beginRequest');

                                  return;
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Missing Account Information'),
                                                content: Text(
                                                    'Please specify your gender.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Add Gender'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('personalInformation');

                                    return;
                                  } else {
                                    return;
                                  }
                                }
                              } else {
                                logFirebaseEvent('Button_alert_dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Missing Account Information'),
                                              content: Text(
                                                  'Please add your government issued national ID picture to your account.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Add ID'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed('governmentId');

                                  return;
                                } else {
                                  return;
                                }
                              }
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Missing Account Information'),
                                            content: Text(
                                                'Please add a profile picture to your account.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Add Picture'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('profilePicture');

                                return;
                              } else {
                                return;
                              }
                            }
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title:
                                          Text('Missing Account Information'),
                                      content: Text(
                                          'Please add your surname to your account.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Add Surname'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('personalInformation');

                              return;
                            } else {
                              return;
                            }
                          }
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Missing Account Information'),
                                    content: Text(
                                        'Please add your name to your account.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Add Name'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('personalInformation');

                            return;
                          } else {
                            return;
                          }
                        }
                      },
                      text: 'Request Verification',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
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
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
