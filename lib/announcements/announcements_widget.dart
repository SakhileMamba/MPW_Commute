import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnnouncementsWidget extends StatefulWidget {
  const AnnouncementsWidget({Key? key}) : super(key: key);

  @override
  _AnnouncementsWidgetState createState() => _AnnouncementsWidgetState();
}

class _AnnouncementsWidgetState extends State<AnnouncementsWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'announcements'});
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

    return YoutubeFullScreenWrapper(
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
                                      'ANNOUNCEMENTS_CircleImage_gabfgn9r_ON_TA');
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
                    logFirebaseEvent('ANNOUNCEMENTS_ListTile_ltcb74ff_ON_TAP');
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
                    logFirebaseEvent('ANNOUNCEMENTS_ListTile_8avjuzh0_ON_TAP');
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
                    logFirebaseEvent('ANNOUNCEMENTS_ListTile_ui93qh3k_ON_TAP');
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
                    logFirebaseEvent('ANNOUNCEMENTS_ListTile_4cfmyohd_ON_TAP');
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
                    logFirebaseEvent('ANNOUNCEMENTS_ListTile_nmixe2qq_ON_TAP');
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
                    logFirebaseEvent('ANNOUNCEMENTS_ListTile_8yegcgh7_ON_TAP');
                    logFirebaseEvent('ListTile_drawer');
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
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
                    logFirebaseEvent('ANNOUNCEMENTS_ListTile_nchnrdvp_ON_TAP');
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
                    logFirebaseEvent('ANNOUNCEMENTS_ListTile_4plp3r65_ON_TAP');
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
              logFirebaseEvent('ANNOUNCEMENTS_menu_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_drawer');
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(
            'Announcements',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryColor,
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
            child: StreamBuilder<List<AnnouncementsRecord>>(
              stream: queryAnnouncementsRecord(
                queryBuilder: (announcementsRecord) => announcementsRecord
                    .where('archived', isEqualTo: false)
                    .orderBy('created_time', descending: true),
              ),
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
                List<AnnouncementsRecord> listViewAnnouncementsRecordList =
                    snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewAnnouncementsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewAnnouncementsRecord =
                        listViewAnnouncementsRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listViewAnnouncementsRecord.title!,
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 22,
                                    ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                              child: Text(
                                '${dateTimeFormat(
                                  'jm',
                                  listViewAnnouncementsRecord.createdTime,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )}, ${dateTimeFormat(
                                  'yMMMd',
                                  listViewAnnouncementsRecord.createdTime,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                          if (listViewAnnouncementsRecord.message != null &&
                              listViewAnnouncementsRecord.message != '')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Text(
                                listViewAnnouncementsRecord.message!,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          if (listViewAnnouncementsRecord.mediaType == 'image')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  functions.returnImagePath(
                                      listViewAnnouncementsRecord.mediaURL!),
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (listViewAnnouncementsRecord.mediaType == 'video')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: FlutterFlowVideoPlayer(
                                path: functions.returnVideoPath(
                                    listViewAnnouncementsRecord.mediaURL!),
                                videoType: VideoType.network,
                                width: MediaQuery.of(context).size.width,
                                autoPlay: false,
                                looping: true,
                                showControls: true,
                                allowFullScreen: true,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ),
                          if (listViewAnnouncementsRecord.mediaType ==
                              'youtube')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: FlutterFlowYoutubePlayer(
                                url: functions.returnVideoPath(
                                    listViewAnnouncementsRecord.mediaURL!),
                                autoPlay: false,
                                looping: true,
                                mute: false,
                                showControls: true,
                                showFullScreen: true,
                              ),
                            ),
                          if (!listViewAnnouncementsRecord.readers!
                              .toList()
                              .contains(currentUserReference))
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ANNOUNCEMENTS_MARK_AS_READ_BTN_ON_TAP');
                                  logFirebaseEvent('Button_backend_call');

                                  final announcementsUpdateData = {
                                    'readers': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  };
                                  await listViewAnnouncementsRecord.reference
                                      .update(announcementsUpdateData);
                                },
                                text: 'Mark As Read',
                                icon: Icon(
                                  Icons.mark_chat_read_outlined,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          if (valueOrDefault<bool>(
                              currentUserDocument?.admin, false))
                            AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ANNOUNCEMENTS_DELETE_ANNOUNCEMENT_BTN_ON');
                                  logFirebaseEvent('Button_alert_dialog');
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Archive'),
                                                content: Text(
                                                    'Are you sure you want to archive this announcement?'),
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
                                                    child: Text('Confirm'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    logFirebaseEvent('Button_backend_call');

                                    final announcementsUpdateData =
                                        createAnnouncementsRecordData(
                                      archived: true,
                                    );
                                    await listViewAnnouncementsRecord.reference
                                        .update(announcementsUpdateData);
                                    return;
                                  } else {
                                    return;
                                  }
                                },
                                text: 'Delete Announcement',
                                icon: Icon(
                                  Icons.delete_outline_rounded,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
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
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
