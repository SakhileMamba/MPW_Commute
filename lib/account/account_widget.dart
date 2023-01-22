import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'account'});
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
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'ACCOUNT_PAGE_CircleImage_t6y1y94e_ON_TAP');
                                logFirebaseEvent(
                                    'CircleImage_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().currentPhotoURLTemp =
                                      currentUserPhoto;
                                });
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
                                child: Image.network(
                                  valueOrDefault<String>(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Icon(
                                    Icons.verified_rounded,
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
                  logFirebaseEvent('ACCOUNT_PAGE_ListTile_ampiihck_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.goNamed('beginRequest');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.directions_car_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  title: Text(
                    'Send Request',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                  tileColor: FlutterFlowTheme.of(context).primaryText,
                  dense: false,
                ),
              ),
              InkWell(
                onTap: () async {
                  logFirebaseEvent('ACCOUNT_PAGE_ListTile_6782g49s_ON_TAP');
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
              InkWell(
                onTap: () async {
                  logFirebaseEvent('ACCOUNT_PAGE_ListTile_035tqq1d_ON_TAP');
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
              InkWell(
                onTap: () async {
                  logFirebaseEvent('ACCOUNT_PAGE_ListTile_rvoq1qhl_ON_TAP');
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
              InkWell(
                onTap: () async {
                  logFirebaseEvent('ACCOUNT_PAGE_ListTile_yiavq52n_ON_TAP');
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
                  logFirebaseEvent('ACCOUNT_PAGE_ListTile_h7kt2z73_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.goNamed('announcements');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.announcement_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  title: Text(
                    'Announcements',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                  tileColor: FlutterFlowTheme.of(context).primaryText,
                  dense: false,
                ),
              ),
              InkWell(
                onTap: () async {
                  logFirebaseEvent('ACCOUNT_PAGE_ListTile_wqns8qn4_ON_TAP');
                  logFirebaseEvent('ListTile_drawer');
                  if (scaffoldKey.currentState!.isDrawerOpen ||
                      scaffoldKey.currentState!.isEndDrawerOpen) {
                    Navigator.pop(context);
                  }
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
              InkWell(
                onTap: () async {
                  logFirebaseEvent('ACCOUNT_PAGE_ListTile_2tln8wvo_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.pushNamed('referFriend');
                },
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.gift,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  title: Text(
                    'Refer A Friend',
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
            logFirebaseEvent('ACCOUNT_PAGE_menu_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_drawer');
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text(
          'Account',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                  child: Text(
                    'Settings',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('ACCOUNT_PAGE_ListTile_e5bpdppa_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.pushNamed('personalInformation');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.person_rounded,
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                    title: Text(
                      'Personal Information',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('ACCOUNT_PAGE_ListTile_y36q1130_ON_TAP');
                    logFirebaseEvent('ListTile_update_local_state');
                    FFAppState().update(() {
                      FFAppState().currentPhotoURLTempLicense = valueOrDefault(
                          currentUserDocument?.driverLicensePhotoPath, '');
                    });
                    logFirebaseEvent('ListTile_navigate_to');

                    context.pushNamed('driversLicense');
                  },
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.solidIdCard,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                    title: Text(
                      'Driver\'s License',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('ACCOUNT_PAGE_ListTile_j7g6skdv_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.pushNamed('subscription');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.monetization_on_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Subscriptions',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('ACCOUNT_PAGE_ListTile_57x6wv1u_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.pushNamed('vehicles');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.directions_car_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Vehicles',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                  child: Text(
                    'Legal',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('ACCOUNT_PAGE_ListTile_eg63mphu_ON_TAP');
                    logFirebaseEvent('ListTile_launch_u_r_l');
                    await launchURL(FFAppState().persistedTermsOfServiceURL);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.menu_book_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Terms of Service',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('ACCOUNT_PAGE_ListTile_5iujjfbm_ON_TAP');
                    logFirebaseEvent('ListTile_launch_u_r_l');
                    await launchURL(FFAppState().persistedPrivacyPolicyURL);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.privacy_tip_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    title: Text(
                      'Privacy Policy',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: false,
                  ),
                ),
                if (valueOrDefault<bool>(currentUserDocument?.admin, false))
                  AuthUserStreamWidget(
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                          child: Text(
                            'Administrative',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'ACCOUNT_PAGE_ListTile_fhye5ke8_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed('approveUsers');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.admin_panel_settings_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            title: Text(
                              'Approve Users',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            dense: false,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'ACCOUNT_PAGE_ListTile_9ajzln0i_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed('approveDrivers');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.admin_panel_settings_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            title: Text(
                              'Approve Drivers',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            dense: false,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'ACCOUNT_PAGE_ListTile_srvbpaag_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed('createAnnouncement');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.admin_panel_settings_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            title: Text(
                              'Create Announcement',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            dense: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ACCOUNT_PAGE_LOGOUT_BTN_ON_TAP');
                      logFirebaseEvent('Button_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await signOut();

                      context.goNamedAuth('phoneAuthentication', mounted);
                    },
                    text: 'Logout',
                    icon: Icon(
                      Icons.logout,
                      size: 24,
                    ),
                    options: FFButtonOptions(
                      width: 130,
                      height: 50,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyText2
                          .override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                      elevation: 8,
                      borderSide: BorderSide(
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
    );
  }
}
