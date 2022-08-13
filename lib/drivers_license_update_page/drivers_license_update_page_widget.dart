import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DriversLicenseUpdatePageWidget extends StatefulWidget {
  const DriversLicenseUpdatePageWidget({Key? key}) : super(key: key);

  @override
  _DriversLicenseUpdatePageWidgetState createState() =>
      _DriversLicenseUpdatePageWidgetState();
}

class _DriversLicenseUpdatePageWidgetState
    extends State<DriversLicenseUpdatePageWidget> {
  String uploadedFileUrl = '';
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'drivers_license_update_page'});
    textController = TextEditingController(
        text: valueOrDefault(currentUserDocument?.driverLicenseNumber, ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: Visibility(
          visible: valueOrDefault<bool>(
                  currentUserDocument?.verifiedDriver, false) ==
              true,
          child: AuthUserStreamWidget(
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('DRIVERS_LICENSE_UPDATE_arrow_back_rounde');
                logFirebaseEvent('IconButton_Navigate-Back');
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          'Driver\'s License',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthUserStreamWidget(
                  child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'License No',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Divider(
                  height: 16,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    'License image',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                        ),
                  ),
                ),
                Stack(
                  children: [
                    AuthUserStreamWidget(
                      child: CachedNetworkImage(
                        imageUrl: valueOrDefault<String>(
                          valueOrDefault(
                              currentUserDocument?.driverLicensePhotoPath, ''),
                          'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'DRIVERS_LICENSE_UPDATE_Image_sdm82cia_ON');
                        logFirebaseEvent('Image_Upload-Photo-Video');
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          imageQuality: 50,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          final downloadUrls = (await Future.wait(selectedMedia
                                  .map((m) async => await uploadData(
                                      m.storagePath, m.bytes))))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (downloadUrls.length == selectedMedia.length) {
                            setState(
                                () => uploadedFileUrl = downloadUrls.first);
                            showUploadMessage(
                              context,
                              'Success!',
                            );
                          } else {
                            showUploadMessage(
                              context,
                              'Failed to upload media',
                            );
                            return;
                          }
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: CachedNetworkImage(
                          imageUrl: valueOrDefault<String>(
                            uploadedFileUrl,
                            'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/transparent.png?alt=media&token=91614179-5e5c-403c-822e-96ab05c5557d',
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (valueOrDefault<bool>(
                              currentUserDocument?.verifiedDriver, false) !=
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: AuthUserStreamWidget(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'DRIVERS_LICENSE_UPDATE_CANCEL_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_Navigate-Back');
                                        Navigator.pop(context);
                                      },
                                      text: 'Cancel',
                                      icon: Icon(
                                        Icons.cancel_rounded,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 50,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                            ),
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'DRIVERS_LICENSE_UPDATE_VERIFY_BTN_ON_TAP');
                                        logFirebaseEvent('Button_Backend-Call');

                                        final usersUpdateData =
                                            createUsersRecordData(
                                          driverLicensePhotoPath:
                                              uploadedFileUrl,
                                          driverLicenseNumber:
                                              textController!.text,
                                        );
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                        logFirebaseEvent('Button_Backend-Call');

                                        final driverVerificationRequestsCreateData =
                                            createDriverVerificationRequestsRecordData(
                                          requestDriverRef:
                                              currentUserReference,
                                          requestDatetime: getCurrentTimestamp,
                                        );
                                        await DriverVerificationRequestsRecord
                                            .collection
                                            .doc()
                                            .set(
                                                driverVerificationRequestsCreateData);
                                        logFirebaseEvent(
                                            'Button_Navigate-Back');
                                        Navigator.pop(context);
                                      },
                                      text: ' Verify',
                                      icon: Icon(
                                        Icons.check_circle_rounded,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                ),
                              ],
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