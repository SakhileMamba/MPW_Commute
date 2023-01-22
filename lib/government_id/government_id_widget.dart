import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
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

class GovernmentIdWidget extends StatefulWidget {
  const GovernmentIdWidget({Key? key}) : super(key: key);

  @override
  _GovernmentIdWidgetState createState() => _GovernmentIdWidgetState();
}

class _GovernmentIdWidgetState extends State<GovernmentIdWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'governmentId'});
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Government ID',
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!valueOrDefault<bool>(
                        currentUserDocument?.verifiedUser, false))
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              'This step is REQUIRED before you can proceed to ensure safety while using this app. Upload a front image of your government-issued national identity card or passport. ',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'GOVERNMENT_ID_PAGE_Image_h093kkx2_ON_TAP');
                          logFirebaseEvent('Image_expand_image');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: CachedNetworkImage(
                                  imageUrl: valueOrDefault<String>(
                                    FFAppState().currentPhotoURLTempID,
                                    'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: valueOrDefault<String>(
                                  FFAppState().currentPhotoURLTempID,
                                  'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                                ),
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: valueOrDefault<String>(
                            FFAppState().currentPhotoURLTempID,
                            'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                          ),
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: valueOrDefault<String>(
                                FFAppState().currentPhotoURLTempID,
                                'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/placeholder.png?alt=media&token=ce8e634c-e229-4c0e-a8bb-093f7cfa3c8e',
                              ),
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'GOVERNMENT_ID_PAGE_UPLOAD_NEW_BTN_ON_TAP');
                        if (FFAppState().currentPhotoURLTempID != null &&
                            FFAppState().currentPhotoURLTempID != '') {
                          logFirebaseEvent('Button_delete_media');
                          await FirebaseStorage.instance
                              .refFromURL(FFAppState().currentPhotoURLTempID)
                              .delete();
                        }
                        if (valueOrDefault(
                                    currentUserDocument?.nationalIdPhotoUrl,
                                    '') !=
                                null &&
                            valueOrDefault(
                                    currentUserDocument?.nationalIdPhotoUrl,
                                    '') !=
                                '') {
                          logFirebaseEvent('Button_update_local_state');
                          FFAppState().oldPhotoURLTemp = valueOrDefault(
                              currentUserDocument?.nationalIdPhotoUrl, '');
                        }
                        logFirebaseEvent('Button_upload_media_to_firebase');
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          imageQuality: 50,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
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
                                (m) async =>
                                    await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            isMediaUploading = false;
                          }
                          if (downloadUrls.length == selectedMedia.length) {
                            setState(
                                () => uploadedFileUrl = downloadUrls.first);
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
                          FFAppState().backButtonFileUpload = true;
                          FFAppState().currentPhotoURLTempID = uploadedFileUrl;
                        });
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
                  ],
                ),
                if (uploadedFileUrl != null && uploadedFileUrl != '')
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('GOVERNMENT_ID_PAGE_SAVE_BTN_ON_TAP');
                      if (uploadedFileUrl != null && uploadedFileUrl != '') {
                        logFirebaseEvent('Button_backend_call');

                        final usersUpdateData = createUsersRecordData(
                          nationalIdPhotoUrl: uploadedFileUrl,
                        );
                        await currentUserReference!.update(usersUpdateData);
                        if (FFAppState().oldPhotoURLTemp != null &&
                            FFAppState().oldPhotoURLTemp != '') {
                          logFirebaseEvent('Button_delete_media');
                          await FirebaseStorage.instance
                              .refFromURL(FFAppState().oldPhotoURLTemp)
                              .delete();
                        }
                        logFirebaseEvent('Button_update_local_state');
                        FFAppState().update(() {
                          FFAppState().backButtonFileUpload = false;
                          FFAppState().oldPhotoURLTemp = '';
                          FFAppState().currentPhotoURLTempID = '';
                        });
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed('checkSetup');

                        return;
                      } else {
                        logFirebaseEvent('Button_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Missing ID Image'),
                              content: Text(
                                  'Please upload an image of the front of your ID. If you have already selected an image, please wait for it to finish loading. It should be displayed on your screen once done.'),
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
                    },
                    text: 'Save',
                    icon: Icon(
                      Icons.check_circle_rounded,
                      size: 15,
                    ),
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
    );
  }
}
