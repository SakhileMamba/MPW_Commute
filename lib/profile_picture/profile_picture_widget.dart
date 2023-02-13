import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'profile_picture_model.dart';
export 'profile_picture_model.dart';

class ProfilePictureWidget extends StatefulWidget {
  const ProfilePictureWidget({Key? key}) : super(key: key);

  @override
  _ProfilePictureWidgetState createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  late ProfilePictureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePictureModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'profilePicture'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_PICTURE_profilePicture_ON_LOAD');
      if (FFAppState().isProfilePicHintGiven) {
        return;
      }

      logFirebaseEvent('profilePicture_alert_dialog');
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(
                'Your profile picture should be of your face and it should match the face in your government-issued identification for successful account verification.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Continue'),
              ),
            ],
          );
        },
      );
      logFirebaseEvent('profilePicture_update_app_state');
      FFAppState().isProfilePicHintGiven = true;
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
                logFirebaseEvent('PROFILE_PICTURE_arrow_back_rounded_ICN_O');
                if (FFAppState().currentPhotoURLTemp != null &&
                    FFAppState().currentPhotoURLTemp != '') {
                  if (FFAppState().currentPhotoURLTemp == currentUserPhoto) {
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().currentPhotoURLTemp = '';
                    FFAppState().oldPhotoURLTemp = '';
                    if (valueOrDefault<bool>(
                            currentUserDocument?.verifiedUser, false) ||
                        valueOrDefault<bool>(
                            currentUserDocument?.accountVerificationSent,
                            false)) {
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                      return;
                    } else {
                      logFirebaseEvent('IconButton_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Alert'),
                            content: Text(
                                'You are required to save a profile picture for verification.'),
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
                    }
                  } else {
                    logFirebaseEvent('IconButton_delete_media');
                    await FirebaseStorage.instance
                        .refFromURL(FFAppState().currentPhotoURLTemp)
                        .delete();
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().currentPhotoURLTemp = '';
                    FFAppState().oldPhotoURLTemp = '';
                    if (valueOrDefault<bool>(
                            currentUserDocument?.verifiedUser, false) ||
                        valueOrDefault<bool>(
                            currentUserDocument?.accountVerificationSent,
                            false)) {
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                      return;
                    } else {
                      logFirebaseEvent('IconButton_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Alert'),
                            content: Text(
                                'You are required to save a profile picture for verification.'),
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
                    }
                  }
                } else {
                  if (valueOrDefault<bool>(
                          currentUserDocument?.verifiedUser, false) ||
                      valueOrDefault<bool>(
                          currentUserDocument?.accountVerificationSent,
                          false)) {
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                    return;
                  } else {
                    logFirebaseEvent('IconButton_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Alert'),
                          content: Text(
                              'You are required to save a profile picture for verification.'),
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
                  }
                }
              },
            ),
          ),
        ),
        title: Text(
          'Profile Picture',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'PROFILE_PICTURE_Image_thg3v6ne_ON_TAP');
                            logFirebaseEvent('Image_expand_image');
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: CachedNetworkImage(
                                    imageUrl: valueOrDefault<String>(
                                      FFAppState().currentPhotoURLTemp,
                                      'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: valueOrDefault<String>(
                                    FFAppState().currentPhotoURLTemp,
                                    'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                                  ),
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: valueOrDefault<String>(
                              FFAppState().currentPhotoURLTemp,
                              'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                            ),
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: valueOrDefault<String>(
                                  FFAppState().currentPhotoURLTemp,
                                  'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                                ),
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PROFILE_PICTURE_UPLOAD_NEW_BTN_ON_TAP');
                            if (FFAppState().currentPhotoURLTemp != null &&
                                FFAppState().currentPhotoURLTemp != '') {
                              logFirebaseEvent('Button_delete_media');
                              await FirebaseStorage.instance
                                  .refFromURL(FFAppState().currentPhotoURLTemp)
                                  .delete();
                            }
                            if (currentUserPhoto != null &&
                                currentUserPhoto != '') {
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().oldPhotoURLTemp = currentUserPhoto;
                            }
                            logFirebaseEvent('Button_upload_media_to_firebase');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              imageQuality: 50,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isMediaUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                        ))
                                    .toList();

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
                                _model.isMediaUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload media');
                                return;
                              }
                            }

                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().currentPhotoURLTemp =
                                _model.uploadedFileUrl;
                          },
                          text: 'Upload New',
                          icon: Icon(
                            Icons.upload_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
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
                    ],
                  ),
                ),
                if (_model.uploadedFileUrl != null &&
                    _model.uploadedFileUrl != '')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                                    'PROFILE_PICTURE_PAGE_CANCEL_BTN_ON_TAP');
                                if (_model.isMediaUploading) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Alert'),
                                        content: Text(
                                            'Please wait for upload to finish'),
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
                                } else {
                                  if (FFAppState().currentPhotoURLTemp !=
                                          null &&
                                      FFAppState().currentPhotoURLTemp != '') {
                                    if (FFAppState().currentPhotoURLTemp ==
                                        currentUserPhoto) {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().currentPhotoURLTemp = '';
                                      FFAppState().oldPhotoURLTemp = '';
                                      if (valueOrDefault<bool>(
                                              currentUserDocument?.verifiedUser,
                                              false) ||
                                          valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.accountVerificationSent,
                                              false)) {
                                        logFirebaseEvent(
                                            'Button_navigate_back');
                                        context.pop();
                                        return;
                                      } else {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text(
                                                  'You are required to save a profile picture for verification.'),
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
                                      logFirebaseEvent('Button_delete_media');
                                      await FirebaseStorage.instance
                                          .refFromURL(
                                              FFAppState().currentPhotoURLTemp)
                                          .delete();
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().currentPhotoURLTemp = '';
                                      FFAppState().oldPhotoURLTemp = '';
                                      if (valueOrDefault<bool>(
                                              currentUserDocument?.verifiedUser,
                                              false) ||
                                          valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.accountVerificationSent,
                                              false)) {
                                        logFirebaseEvent(
                                            'Button_navigate_back');
                                        context.pop();
                                        return;
                                      } else {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text(
                                                  'You are required to save a profile picture for verification.'),
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
                                  } else {
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.verifiedUser,
                                            false) ||
                                        valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.accountVerificationSent,
                                            false)) {
                                      logFirebaseEvent('Button_navigate_back');
                                      context.pop();
                                      return;
                                    } else {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Alert'),
                                            content: Text(
                                                'You are required to save a profile picture for verification.'),
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
                                  }
                                }
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
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PROFILE_PICTURE_PAGE_SAVE_BTN_ON_TAP');
                                if (_model.isMediaUploading) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Alert'),
                                        content: Text(
                                            'Please wait for upload to finish'),
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
                                } else {
                                  if (_model.uploadedFileUrl != null &&
                                      _model.uploadedFileUrl != '') {
                                    logFirebaseEvent('Button_backend_call');

                                    final usersUpdateData =
                                        createUsersRecordData(
                                      photoUrl: _model.uploadedFileUrl,
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    if (FFAppState().oldPhotoURLTemp != null &&
                                        FFAppState().oldPhotoURLTemp != '') {
                                      logFirebaseEvent('Button_delete_media');
                                      await FirebaseStorage.instance
                                          .refFromURL(
                                              FFAppState().oldPhotoURLTemp)
                                          .delete();
                                    }
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().oldPhotoURLTemp = '';
                                    FFAppState().currentPhotoURLTemp = '';
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Alert'),
                                          content: Text(
                                              'Your profile picture has been updated'),
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
                                    if (valueOrDefault<bool>(
                                        currentUserDocument?.verifiedUser,
                                        false)) {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.goNamed('beginRequest');

                                      return;
                                    } else {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.goNamed('checkSetup');

                                      return;
                                    }
                                  } else {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              Text('Missing Profile Picture'),
                                          content: Text(
                                              'Please upload your profile picture.'),
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
