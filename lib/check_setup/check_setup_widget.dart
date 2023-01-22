import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CheckSetupWidget extends StatefulWidget {
  const CheckSetupWidget({Key? key}) : super(key: key);

  @override
  _CheckSetupWidgetState createState() => _CheckSetupWidgetState();
}

class _CheckSetupWidgetState extends State<CheckSetupWidget> {
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic? currentDeviceLocationReverseGeocoded;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHECK_SETUP_PAGE_checkSetup_ON_PAGE_LOAD');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (FFAppState().referrerRef != null) {
        if (!(currentUserDocument!.referrerRef != null)) {
          logFirebaseEvent('checkSetup_backend_call');

          final usersUpdateData = createUsersRecordData(
            referrerRef: FFAppState().referrerRef,
            email: 'hggdfgfdgdfgfgdf',
          );
          await currentUserReference!.update(usersUpdateData);
        }
        logFirebaseEvent('checkSetup_backend_call');

        final usersUpdateData = {
          'users_referred_list': FieldValue.arrayUnion([currentUserReference]),
        };
        await FFAppState().referrerRef!.update(usersUpdateData);
        logFirebaseEvent('checkSetup_update_local_state');
        FFAppState().referrerRef = null;
      }
      logFirebaseEvent('checkSetup_backend_call');

      final appConstantsUpdateData = {
        'notificationReferenceList':
            FieldValue.arrayUnion([currentUserReference]),
      };
      await functions
          .returnAppContantsDocRefFromStringID(' kOOn2yvmHgWV3k61xPRS')
          .update(appConstantsUpdateData);
      logFirebaseEvent('checkSetup_update_local_state');
      FFAppState().filterCurrentDateTime = getCurrentTimestamp;
      logFirebaseEvent('checkSetup_custom_action');
      currentDeviceLocationReverseGeocoded = await actions.reverseGeocode(
        currentUserLocationValue!,
      );
      logFirebaseEvent('checkSetup_update_local_state');
      FFAppState().tempOriginReversed = currentDeviceLocationReverseGeocoded!;
      if (valueOrDefault<bool>(currentUserDocument?.verifiedUser, false) ||
          valueOrDefault<bool>(
              currentUserDocument?.accountVerificationSent, false)) {
        logFirebaseEvent('checkSetup_navigate_to');

        context.pushNamed('beginRequest');

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
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed('personalInformation');

                    return;
                  } else {
                    logFirebaseEvent('checkSetup_navigate_to');

                    context.pushNamed('governmentId');

                    return;
                  }
                } else {
                  logFirebaseEvent('checkSetup_navigate_to');

                  context.pushNamed('profilePicture');

                  return;
                }
              } else {
                logFirebaseEvent('checkSetup_navigate_to');

                context.pushNamed('birthdate');

                return;
              }
            } else {
              logFirebaseEvent('checkSetup_navigate_to');

              context.pushNamed('gender');

              return;
            }
          } else {
            logFirebaseEvent('checkSetup_navigate_to');

            context.pushNamed('surname');

            return;
          }
        } else {
          logFirebaseEvent('checkSetup_navigate_to');

          context.pushNamed('firstName');

          return;
        }
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'checkSetup'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
  }
}
