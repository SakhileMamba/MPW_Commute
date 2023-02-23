import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'check_setup_model.dart';
export 'check_setup_model.dart';

class CheckSetupWidget extends StatefulWidget {
  const CheckSetupWidget({Key? key}) : super(key: key);

  @override
  _CheckSetupWidgetState createState() => _CheckSetupWidgetState();
}

class _CheckSetupWidgetState extends State<CheckSetupWidget> {
  late CheckSetupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckSetupModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'checkSetup'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHECK_SETUP_PAGE_checkSetup_ON_PAGE_LOAD');
      logFirebaseEvent('checkSetup_wait__delay');
      await Future.delayed(const Duration(milliseconds: 5000));
      logFirebaseEvent('checkSetup_update_app_state');
      FFAppState().filterCurrentDateTime = getCurrentTimestamp;
      if (valueOrDefault<bool>(currentUserDocument?.verifiedUser, false) ||
          valueOrDefault<bool>(
              currentUserDocument?.accountVerificationSent, false)) {
        logFirebaseEvent('checkSetup_navigate_to');

        context.goNamed('beginRequest');

        return;
      } else {
        if (currentUserDisplayName != null && currentUserDisplayName != '') {
          if (valueOrDefault(currentUserDocument?.displaySurname, '') != null &&
              valueOrDefault(currentUserDocument?.displaySurname, '') != '') {
            if (valueOrDefault(currentUserDocument?.gender, '') != null &&
                valueOrDefault(currentUserDocument?.gender, '') != '') {
              if (currentUserDocument!.birthDate != null) {
                if (currentUserPhoto != null && currentUserPhoto != '') {
                  if (valueOrDefault(
                              currentUserDocument?.nationalIdPhotoUrl, '') !=
                          null &&
                      valueOrDefault(
                              currentUserDocument?.nationalIdPhotoUrl, '') !=
                          '') {
                    logFirebaseEvent('checkSetup_navigate_to');

                    context.goNamed('personalInformation');

                    return;
                  } else {
                    logFirebaseEvent('checkSetup_navigate_to');

                    context.goNamed('governmentId');

                    return;
                  }
                } else {
                  logFirebaseEvent('checkSetup_navigate_to');

                  context.goNamed('profilePicture');

                  return;
                }
              } else {
                logFirebaseEvent('checkSetup_navigate_to');

                context.goNamed('birthdate');

                return;
              }
            } else {
              logFirebaseEvent('checkSetup_navigate_to');

              context.goNamed('gender');

              return;
            }
          } else {
            logFirebaseEvent('checkSetup_navigate_to');

            context.goNamed('surname');

            return;
          }
        } else {
          logFirebaseEvent('checkSetup_navigate_to');

          context.goNamed('firstName');

          return;
        }
      }
    });

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitChasingDots(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final checkSetupUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Lottie.asset(
                    'assets/lottie_animations/lf30_editor_qvakyxtx.json',
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    fit: BoxFit.fitWidth,
                    animate: true,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
