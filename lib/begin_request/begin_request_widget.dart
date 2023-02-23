import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'begin_request_model.dart';
export 'begin_request_model.dart';

class BeginRequestWidget extends StatefulWidget {
  const BeginRequestWidget({Key? key}) : super(key: key);

  @override
  _BeginRequestWidgetState createState() => _BeginRequestWidgetState();
}

class _BeginRequestWidgetState extends State<BeginRequestWidget> {
  late BeginRequestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeginRequestModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'beginRequest'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BEGIN_REQUEST_beginRequest_ON_LOAD');
      logFirebaseEvent('beginRequest_update_app_state');
      FFAppState().filterCurrentDateTime = getCurrentTimestamp;
      if (FFAppState().privacyPolicyAndTermsOfServiceAgreement) {
        return;
      }

      logFirebaseEvent('beginRequest_alert_dialog');
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(
                'Please note that by using this app, you are consenting to Commute\'s privacy policy and terms of use.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      logFirebaseEvent('beginRequest_update_app_state');
      FFAppState().privacyPolicyAndTermsOfServiceAgreement = true;
      return;
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 48, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'BEGIN_REQUEST_CircleImage_pzl93xht_ON_TA');
                                  logFirebaseEvent(
                                      'CircleImage_update_app_state');
                                  FFAppState().currentPhotoURLTemp =
                                      currentUserPhoto;
                                  logFirebaseEvent('CircleImage_navigate_to');

                                  context.pushNamed('profilePicture');
                                },
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.6,
                                ),
                                decoration: BoxDecoration(),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.verifiedUser, false))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Icon(
                                      Icons.verified_user_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24,
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
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('BEGIN_REQUEST_ListTile_30uwqzc5_ON_TAP');
                    logFirebaseEvent('ListTile_drawer');
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.directions_car_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      FFAppState().driverMode
                          ? 'Request Passengers'
                          : 'Request Drivers',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryText,
                    dense: false,
                  ),
                ),
                if (!FFAppState().driverMode)
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BEGIN_REQUEST_ListTile_7axxhrki_ON_TAP');
                      logFirebaseEvent('ListTile_navigate_to');

                      context.goNamed('drivers');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.commute_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      title: Text(
                        'Browse Drivers',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      tileColor: FlutterFlowTheme.of(context).primaryText,
                      dense: false,
                    ),
                  ),
                if (FFAppState().driverMode)
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BEGIN_REQUEST_ListTile_z30ejh90_ON_TAP');
                      logFirebaseEvent('ListTile_navigate_to');

                      context.goNamed('passengers');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.emoji_people,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      title: Text(
                        'Browse Hailers',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      tileColor: FlutterFlowTheme.of(context).primaryText,
                      dense: false,
                    ),
                  ),
                if (FFAppState().driverMode)
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BEGIN_REQUEST_ListTile_bieut4nu_ON_TAP');
                      logFirebaseEvent('ListTile_navigate_to');

                      context.goNamed('drives');
                    },
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.road,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      title: Text(
                        'Manage Drives',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      tileColor: FlutterFlowTheme.of(context).primaryText,
                      dense: false,
                    ),
                  ),
                if (!FFAppState().driverMode)
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BEGIN_REQUEST_ListTile_eyolh82l_ON_TAP');
                      logFirebaseEvent('ListTile_navigate_to');

                      context.goNamed('seats');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.airline_seat_recline_normal_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      title: Text(
                        'Manage Seats',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      tileColor: FlutterFlowTheme.of(context).primaryText,
                      dense: false,
                    ),
                  ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('BEGIN_REQUEST_ListTile_rlxte28l_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.goNamed('account');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Account',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryText,
                    dense: false,
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.menu_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('BEGIN_REQUEST_menu_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_drawer');
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(
            'Request',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (FFAppState().driverMode)
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Text(
                        'Request passengers to share your ride',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  if (!FFAppState().driverMode)
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Text(
                        'Request drivers to pick you up',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('BEGIN_REQUEST_PAGE_BEGIN_BTN_ON_TAP');
                      if (valueOrDefault<bool>(
                          currentUserDocument?.verifiedUser, false)) {
                        if (FFAppState().driverMode) {
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
                                      title: Text(
                                          'Driver\'s License Verification'),
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
                      } else {
                        logFirebaseEvent('Button_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Verification Error'),
                                  content:
                                      Text('Your account is not verified yet.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Verify'),
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
                    text: 'Begin',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
