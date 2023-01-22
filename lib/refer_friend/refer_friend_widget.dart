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
import 'package:share_plus/share_plus.dart';

class ReferFriendWidget extends StatefulWidget {
  const ReferFriendWidget({Key? key}) : super(key: key);

  @override
  _ReferFriendWidgetState createState() => _ReferFriendWidgetState();
}

class _ReferFriendWidgetState extends State<ReferFriendWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'referFriend'});
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
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
                                      'REFER_FRIEND_CircleImage_d3auuw18_ON_TAP');
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
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
                    logFirebaseEvent('REFER_FRIEND_ListTile_nm6fj15n_ON_TAP');
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
                    logFirebaseEvent('REFER_FRIEND_ListTile_nr89fgb2_ON_TAP');
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
                    logFirebaseEvent('REFER_FRIEND_ListTile_azxzaj8e_ON_TAP');
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
                    logFirebaseEvent('REFER_FRIEND_ListTile_nwmowws1_ON_TAP');
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
                    logFirebaseEvent('REFER_FRIEND_ListTile_z8ipgml7_ON_TAP');
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
                    logFirebaseEvent('REFER_FRIEND_ListTile_dcqd3ifa_ON_TAP');
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
                    logFirebaseEvent('REFER_FRIEND_ListTile_1w387j93_ON_TAP');
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
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('REFER_FRIEND_ListTile_mjvrlxit_ON_TAP');
                    logFirebaseEvent('ListTile_drawer');
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
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
            logFirebaseEvent('REFER_FRIEND_menu_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Your Referrals',
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
              children: [
                Divider(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Referred Friends',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                      child: AuthUserStreamWidget(
                        builder: (context) => Text(
                          (currentUserDocument?.usersReferredList?.toList() ??
                                  [])
                              .length
                              .toString(),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 80,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('REFER_FRIEND_REFER_FRIEND_BTN_ON_TAP');
                      logFirebaseEvent('Button_share');
                      await Share.share(
                        valueOrDefault<String>(
                          'https://commuteridesharing.page.link?referrerRef=${currentUserUid}',
                          'generatedReferralLink',
                        ),
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                    text: 'Refer Friend',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
