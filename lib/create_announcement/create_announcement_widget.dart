import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CreateAnnouncementWidget extends StatefulWidget {
  const CreateAnnouncementWidget({Key? key}) : super(key: key);

  @override
  _CreateAnnouncementWidgetState createState() =>
      _CreateAnnouncementWidgetState();
}

class _CreateAnnouncementWidgetState extends State<CreateAnnouncementWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  String? radioButtonValue;
  TextEditingController? textController1;
  TextEditingController? textController2;
  bool? switchValue;
  TextEditingController? textController3;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createAnnouncement'});
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
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
        title: Text(
          'Create Announcement',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
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
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
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
                    maxLines: null,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: TextFormField(
                    controller: textController2,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Message',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
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
                    maxLines: null,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Send Push Notification Image',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Switch(
                        value: switchValue ??= true,
                        onChanged: (newValue) async {
                          setState(() => switchValue = newValue!);
                        },
                        activeColor: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                  child: Text(
                    'Media Type',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: FlutterFlowRadioButton(
                    options: ['none', 'image', 'video', 'youtube'].toList(),
                    onChanged: (val) => setState(() => radioButtonValue = val),
                    optionHeight: 25,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                    buttonPosition: RadioButtonPosition.left,
                    direction: Axis.vertical,
                    radioButtonColor: FlutterFlowTheme.of(context).primaryColor,
                    inactiveRadioButtonColor: Color(0x8A000000),
                    toggleable: false,
                    horizontalAlignment: WrapAlignment.start,
                    verticalAlignment: WrapCrossAlignment.start,
                  ),
                ),
                if (radioButtonValue == 'youtube')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: TextFormField(
                      controller: textController3,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'YouTube URL',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                if ((radioButtonValue == 'image') ||
                    (radioButtonValue == 'video'))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (radioButtonValue == 'image')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CREATE_ANNOUNCEMENT_Image_ey76rmn9_ON_TA');
                                  logFirebaseEvent('Image_expand_image');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: CachedNetworkImage(
                                          imageUrl: uploadedFileUrl,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: uploadedFileUrl,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: uploadedFileUrl,
                                  transitionOnUserGestures: true,
                                  child: CachedNetworkImage(
                                    imageUrl: uploadedFileUrl,
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          if (radioButtonValue == 'video')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: FlutterFlowVideoPlayer(
                                path: uploadedFileUrl,
                                videoType: VideoType.network,
                                autoPlay: false,
                                looping: true,
                                showControls: true,
                                allowFullScreen: true,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ),
                          if (uploadedFileUrl == null || uploadedFileUrl == '')
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CREATE_ANNOUNCEMENT_UPLOAD_BTN_ON_TAP');
                                if (FFAppState().currentAnnouncementMediaURL !=
                                        null &&
                                    FFAppState().currentAnnouncementMediaURL !=
                                        '') {
                                  logFirebaseEvent('Button_delete_media');
                                  await FirebaseStorage.instance
                                      .refFromURL(FFAppState()
                                          .currentAnnouncementMediaURL)
                                      .delete();
                                }
                                logFirebaseEvent(
                                    'Button_upload_media_to_firebase');
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  imageQuality: 100,
                                  allowPhoto: true,
                                  allowVideo: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => isMediaUploading = true);
                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    isMediaUploading = false;
                                  }
                                  if (downloadUrls.length ==
                                      selectedMedia.length) {
                                    setState(() =>
                                        uploadedFileUrl = downloadUrls.first);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                    return;
                                  }
                                }

                                logFirebaseEvent('Button_update_local_state');
                                setState(() {
                                  FFAppState().currentAnnouncementMediaURL =
                                      uploadedFileUrl;
                                });
                              },
                              text: 'Upload',
                              icon: Icon(
                                Icons.upload_rounded,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CREATE_ANNOUNCEMENT_CANCEL_BTN_ON_TAP');
                              if (FFAppState().currentAnnouncementMediaURL !=
                                      null &&
                                  FFAppState().currentAnnouncementMediaURL !=
                                      '') {
                                logFirebaseEvent('Button_delete_media');
                                await FirebaseStorage.instance
                                    .refFromURL(FFAppState()
                                        .currentAnnouncementMediaURL)
                                    .delete();
                              }
                              logFirebaseEvent('Button_navigate_back');
                              context.pop();
                            },
                            text: 'Cancel',
                            icon: Icon(
                              Icons.cancel_rounded,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
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
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: StreamBuilder<List<AppConstantsRecord>>(
                            stream: queryAppConstantsRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitChasingDots(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<AppConstantsRecord>
                                  buttonAppConstantsRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final buttonAppConstantsRecord =
                                  buttonAppConstantsRecordList.isNotEmpty
                                      ? buttonAppConstantsRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CREATE_ANNOUNCEMENT_PAGE_SAVE_BTN_ON_TAP');
                                  if (textController1!.text != null &&
                                      textController1!.text != '') {
                                    if (textController2!.text != null &&
                                        textController2!.text != '') {
                                      if (radioButtonValue != null &&
                                          radioButtonValue != '') {
                                        if (radioButtonValue == 'none') {
                                          if (switchValue!) {
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            final announcementsCreateData =
                                                createAnnouncementsRecordData(
                                              createdTime: getCurrentTimestamp,
                                              title: textController1!.text,
                                              message: textController2!.text,
                                              archived: false,
                                            );
                                            await AnnouncementsRecord.collection
                                                .doc()
                                                .set(announcementsCreateData);
                                            logFirebaseEvent(
                                                'Button_trigger_push_notification');
                                            triggerPushNotification(
                                              notificationTitle: 'Announcement',
                                              notificationText:
                                                  'Commute Ridesharing has sent you a new announcement.',
                                              notificationImageUrl:
                                                  buttonAppConstantsRecord!
                                                      .pushNotificationImageURL,
                                              notificationSound: 'default',
                                              userRefs: buttonAppConstantsRecord!
                                                  .notificationReferenceList!
                                                  .toList(),
                                              initialPageName: 'announcements',
                                              parameterData: {},
                                            );
                                            logFirebaseEvent(
                                                'Button_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Notice'),
                                                  content: Text(
                                                      'Announcement sent.'),
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
                                            logFirebaseEvent(
                                                'Button_navigate_back');
                                            context.pop();
                                            return;
                                          } else {
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            final announcementsCreateData =
                                                createAnnouncementsRecordData(
                                              createdTime: getCurrentTimestamp,
                                              title: textController1!.text,
                                              message: textController2!.text,
                                              archived: false,
                                            );
                                            await AnnouncementsRecord.collection
                                                .doc()
                                                .set(announcementsCreateData);
                                            logFirebaseEvent(
                                                'Button_trigger_push_notification');
                                            triggerPushNotification(
                                              notificationTitle: 'Announcement',
                                              notificationText:
                                                  'Commute Ridesharing has sent you a new announcement.',
                                              notificationSound: 'default',
                                              userRefs: buttonAppConstantsRecord!
                                                  .notificationReferenceList!
                                                  .toList(),
                                              initialPageName: 'announcements',
                                              parameterData: {},
                                            );
                                            logFirebaseEvent(
                                                'Button_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Notice'),
                                                  content: Text(
                                                      'Announcement sent.'),
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
                                            logFirebaseEvent(
                                                'Button_navigate_back');
                                            context.pop();
                                            return;
                                          }
                                        } else {
                                          if (radioButtonValue == 'youtube') {
                                            if (textController3!.text != null &&
                                                textController3!.text != '') {
                                              if (switchValue!) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                final announcementsCreateData =
                                                    createAnnouncementsRecordData(
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  title: textController1!.text,
                                                  message:
                                                      textController2!.text,
                                                  mediaType: radioButtonValue,
                                                  mediaURL:
                                                      textController3!.text,
                                                  archived: false,
                                                );
                                                await AnnouncementsRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        announcementsCreateData);
                                                logFirebaseEvent(
                                                    'Button_trigger_push_notification');
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'Announcement',
                                                  notificationText:
                                                      'Commute Ridesharing has sent you a new announcement.',
                                                  notificationImageUrl:
                                                      buttonAppConstantsRecord!
                                                          .pushNotificationImageURL,
                                                  notificationSound: 'default',
                                                  userRefs:
                                                      buttonAppConstantsRecord!
                                                          .notificationReferenceList!
                                                          .toList(),
                                                  initialPageName:
                                                      'announcements',
                                                  parameterData: {},
                                                );
                                                logFirebaseEvent(
                                                    'Button_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Notice'),
                                                      content: Text(
                                                          'Announcement sent.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child:
                                                              Text('Continue'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                logFirebaseEvent(
                                                    'Button_navigate_back');
                                                context.pop();
                                                return;
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                final announcementsCreateData =
                                                    createAnnouncementsRecordData(
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  title: textController1!.text,
                                                  message:
                                                      textController2!.text,
                                                  mediaType: radioButtonValue,
                                                  mediaURL:
                                                      textController3!.text,
                                                  archived: false,
                                                );
                                                await AnnouncementsRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        announcementsCreateData);
                                                logFirebaseEvent(
                                                    'Button_trigger_push_notification');
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'Announcement',
                                                  notificationText:
                                                      'Commute Ridesharing has sent you a new announcement.',
                                                  notificationSound: 'default',
                                                  userRefs:
                                                      buttonAppConstantsRecord!
                                                          .notificationReferenceList!
                                                          .toList(),
                                                  initialPageName:
                                                      'announcements',
                                                  parameterData: {},
                                                );
                                                logFirebaseEvent(
                                                    'Button_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Notice'),
                                                      content: Text(
                                                          'Announcement sent.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child:
                                                              Text('Continue'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                logFirebaseEvent(
                                                    'Button_navigate_back');
                                                context.pop();
                                                return;
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Error'),
                                                    content: Text(
                                                        'Missing youtube media URL'),
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
                                            if (uploadedFileUrl != null &&
                                                uploadedFileUrl != '') {
                                              if (switchValue!) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                final announcementsCreateData =
                                                    createAnnouncementsRecordData(
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  title: textController1!.text,
                                                  message:
                                                      textController2!.text,
                                                  mediaType: radioButtonValue,
                                                  mediaURL: uploadedFileUrl,
                                                  archived: false,
                                                );
                                                await AnnouncementsRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        announcementsCreateData);
                                                logFirebaseEvent(
                                                    'Button_trigger_push_notification');
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'Announcement',
                                                  notificationText:
                                                      'Commute Ridesharing has sent you a new announcement.',
                                                  notificationImageUrl:
                                                      buttonAppConstantsRecord!
                                                          .pushNotificationImageURL,
                                                  notificationSound: 'default',
                                                  userRefs:
                                                      buttonAppConstantsRecord!
                                                          .notificationReferenceList!
                                                          .toList(),
                                                  initialPageName:
                                                      'announcements',
                                                  parameterData: {},
                                                );
                                                logFirebaseEvent(
                                                    'Button_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Notice'),
                                                      content: Text(
                                                          'Announcement sent.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child:
                                                              Text('Continue'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                logFirebaseEvent(
                                                    'Button_navigate_back');
                                                context.pop();
                                                return;
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                final announcementsCreateData =
                                                    createAnnouncementsRecordData(
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  title: textController1!.text,
                                                  message:
                                                      textController2!.text,
                                                  mediaType: radioButtonValue,
                                                  archived: false,
                                                );
                                                await AnnouncementsRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        announcementsCreateData);
                                                logFirebaseEvent(
                                                    'Button_trigger_push_notification');
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'Announcement',
                                                  notificationText:
                                                      'Commute Ridesharing has sent you a new announcement.',
                                                  notificationSound: 'default',
                                                  userRefs:
                                                      buttonAppConstantsRecord!
                                                          .notificationReferenceList!
                                                          .toList(),
                                                  initialPageName:
                                                      'announcements',
                                                  parameterData: {},
                                                );
                                                logFirebaseEvent(
                                                    'Button_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Notice'),
                                                      content: Text(
                                                          'Announcement sent.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child:
                                                              Text('Continue'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                logFirebaseEvent(
                                                    'Button_navigate_back');
                                                context.pop();
                                                return;
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Error'),
                                                    content:
                                                        Text('Missing media'),
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
                                          }
                                        }
                                      } else {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content:
                                                  Text('Media type not set'),
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
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text('Message is missing'),
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
                                  } else {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text('Title is missing'),
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
                                },
                                text: 'Save',
                                icon: Icon(
                                  Icons.check_circle_rounded,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                              );
                            },
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
    );
  }
}
