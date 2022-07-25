import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInformationUpdatePageWidget extends StatefulWidget {
  const PersonalInformationUpdatePageWidget({Key? key}) : super(key: key);

  @override
  _PersonalInformationUpdatePageWidgetState createState() =>
      _PersonalInformationUpdatePageWidgetState();
}

class _PersonalInformationUpdatePageWidgetState
    extends State<PersonalInformationUpdatePageWidget> {
  String uploadedFileUrl1 = '';
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  String uploadedFileUrl2 = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'personal_information_update_page'});
    textController1 = TextEditingController(text: currentUserDisplayName);
    textController2 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.displaySurname, ''));
    textController3 = TextEditingController(text: currentPhoneNumber);
    textController4 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.nationalId, ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Personal Information',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.done_rounded,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('PERSONAL_INFORMATION_UPDATE_done_rounded');
              logFirebaseEvent('IconButton_Backend-Call');

              final usersUpdateData = createUsersRecordData(
                displayName: textController1!.text,
                photoUrl: uploadedFileUrl1,
                nationalId: textController4!.text,
                nationalIdPhotoUrl: uploadedFileUrl2,
                displaySurname: textController2!.text,
              );
              await currentUserReference!.update(usersUpdateData);
              logFirebaseEvent('IconButton_Navigate-Back');
              Navigator.pop(context);
            },
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AuthUserStreamWidget(
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'PERSONAL_INFORMATION_UPDATE_CircleImage_');
                        logFirebaseEvent('CircleImage_Upload-Photo-Video');
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
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
                          if (downloadUrls != null &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(
                                () => uploadedFileUrl1 = downloadUrls.first);
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
                      child: Container(
                        width: 150,
                        height: 150,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            currentUserPhoto,
                            'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image.png?alt=media&token=bfa8ad44-8478-4509-9619-fe572df973d4',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 16,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  AuthUserStreamWidget(
                    child: TextFormField(
                      controller: textController1,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Name',
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
                  AuthUserStreamWidget(
                    child: TextFormField(
                      controller: textController2,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Surname',
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
                  AuthUserStreamWidget(
                    child: TextFormField(
                      controller: textController3,
                      autofocus: true,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
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
                  AuthUserStreamWidget(
                    child: TextFormField(
                      controller: textController4,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Government ID No',
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
                  Align(
                    alignment: AlignmentDirectional(-1.07, -1.22),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'PERSONAL_INFORMATION_UPDATE_Image_7wkoms');
                        logFirebaseEvent('Image_Upload-Photo-Video');
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
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
                          if (downloadUrls != null &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(
                                () => uploadedFileUrl2 = downloadUrls.first);
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
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image.png?alt=media&token=bfa8ad44-8478-4509-9619-fe572df973d4',
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
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
