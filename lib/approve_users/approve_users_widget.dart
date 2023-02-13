import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'approve_users_model.dart';
export 'approve_users_model.dart';

class ApproveUsersWidget extends StatefulWidget {
  const ApproveUsersWidget({Key? key}) : super(key: key);

  @override
  _ApproveUsersWidgetState createState() => _ApproveUsersWidgetState();
}

class _ApproveUsersWidgetState extends State<ApproveUsersWidget> {
  late ApproveUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApproveUsersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'approveUsers'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
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
            logFirebaseEvent('APPROVE_USERS_arrow_back_rounded_ICN_ON_');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Approve Users',
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: PagedListView<DocumentSnapshot<Object?>?,
              VerificationRequestsRecord>(
            pagingController: () {
              final Query<Object?> Function(Query<Object?>) queryBuilder =
                  (verificationRequestsRecord) =>
                      verificationRequestsRecord.orderBy('request_datetime');
              if (_model.pagingController != null) {
                final query =
                    queryBuilder(VerificationRequestsRecord.collection);
                if (query != _model.pagingQuery) {
                  // The query has changed
                  _model.pagingQuery = query;
                  _model.streamSubscriptions.forEach((s) => s?.cancel());
                  _model.streamSubscriptions.clear();
                  _model.pagingController!.refresh();
                }
                return _model.pagingController!;
              }

              _model.pagingController = PagingController(firstPageKey: null);
              _model.pagingQuery =
                  queryBuilder(VerificationRequestsRecord.collection);
              _model.pagingController!.addPageRequestListener((nextPageMarker) {
                queryVerificationRequestsRecordPage(
                  queryBuilder: (verificationRequestsRecord) =>
                      verificationRequestsRecord.orderBy('request_datetime'),
                  nextPageMarker: nextPageMarker,
                  pageSize: 25,
                  isStream: true,
                ).then((page) {
                  _model.pagingController!.appendPage(
                    page.data,
                    page.nextPageMarker,
                  );
                  final streamSubscription = page.dataStream?.listen((data) {
                    data.forEach((item) {
                      final itemIndexes = _model.pagingController!.itemList!
                          .asMap()
                          .map((k, v) => MapEntry(v.reference.id, k));
                      final index = itemIndexes[item.reference.id];
                      final items = _model.pagingController!.itemList!;
                      if (index != null) {
                        items.replaceRange(index, index + 1, [item]);
                        _model.pagingController!.itemList = {
                          for (var item in items) item.reference: item
                        }.values.toList();
                      }
                    });
                    setState(() {});
                  });
                  _model.streamSubscriptions.add(streamSubscription);
                });
              });
              return _model.pagingController!;
            }(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            builderDelegate:
                PagedChildBuilderDelegate<VerificationRequestsRecord>(
              // Customize what your widget looks like when it's loading the first page.
              firstPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: SpinKitChasingDots(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 50,
                  ),
                ),
              ),

              itemBuilder: (context, _, listViewIndex) {
                final listViewVerificationRequestsRecord =
                    _model.pagingController!.itemList![listViewIndex];
                return StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(
                      listViewVerificationRequestsRecord.requestUserRef!),
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
                    final cardUsersRecord = snapshot.data!;
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'APPROVE_USERS_PAGE_Image_9zotvzhr_ON_TAP');
                                  logFirebaseEvent('Image_expand_image');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: CachedNetworkImage(
                                          imageUrl: cardUsersRecord.photoUrl!,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: cardUsersRecord.photoUrl!,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: cardUsersRecord.photoUrl!,
                                  transitionOnUserGestures: true,
                                  child: CachedNetworkImage(
                                    imageUrl: cardUsersRecord.photoUrl!,
                                    width: double.infinity,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'APPROVE_USERS_PAGE_Image_6y9c6k5l_ON_TAP');
                                  logFirebaseEvent('Image_expand_image');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: CachedNetworkImage(
                                          imageUrl: cardUsersRecord
                                              .nationalIdPhotoUrl!,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag:
                                            cardUsersRecord.nationalIdPhotoUrl!,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: cardUsersRecord.nationalIdPhotoUrl!,
                                  transitionOnUserGestures: true,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        cardUsersRecord.nationalIdPhotoUrl!,
                                    width: double.infinity,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Wrap(
                                  spacing: 4,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      'Name:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                    ),
                                    Text(
                                      cardUsersRecord.displayName!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Wrap(
                                  spacing: 4,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      'Surname:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                    ),
                                    Text(
                                      cardUsersRecord.displaySurname!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Wrap(
                                  spacing: 4,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      'Birth Date:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                    ),
                                    Text(
                                      dateTimeFormat(
                                        'yMMMd',
                                        cardUsersRecord.birthDate!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Wrap(
                                  spacing: 4,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      'Gender:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                    ),
                                    Text(
                                      cardUsersRecord.gender!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Wrap(
                                  spacing: 4,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      'Phone No:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                    ),
                                    Text(
                                      cardUsersRecord.phoneNumber!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
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
                                            'APPROVE_USERS_PAGE_REJECT_BTN_ON_TAP');
                                        logFirebaseEvent('Button_alert_dialog');
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Reject Account'),
                                                      content: Text(
                                                          'Are you sure you want to reject this account?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('No'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('Yes'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Rejection Reasoning'),
                                                        content: Text(
                                                            'Why is this account being rejected?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text(
                                                                'Name,Surname, etc'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text(
                                                                'Re-upload ID'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            logFirebaseEvent(
                                                'Button_delete_media');
                                            await FirebaseStorage.instance
                                                .refFromURL(cardUsersRecord
                                                    .nationalIdPhotoUrl!)
                                                .delete();
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            final usersUpdateData1 = {
                                              ...createUsersRecordData(
                                                accountVerificationSent: false,
                                              ),
                                              'national_id_photo_url':
                                                  FieldValue.delete(),
                                            };
                                            await cardUsersRecord.reference
                                                .update(usersUpdateData1);
                                            logFirebaseEvent(
                                                'Button_trigger_push_notification');
                                            triggerPushNotification(
                                              notificationTitle:
                                                  'Account Status: Rejected',
                                              notificationText:
                                                  'Your account has been rejected. Upload a new image of your ID and resend your verification request.',
                                              notificationSound: 'default',
                                              userRefs: [
                                                cardUsersRecord.reference
                                              ],
                                              initialPageName:
                                                  'personalInformation',
                                              parameterData: {},
                                            );
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            await listViewVerificationRequestsRecord
                                                .reference
                                                .delete();
                                            return;
                                          } else {
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            final usersUpdateData2 =
                                                createUsersRecordData(
                                              accountVerificationSent: false,
                                            );
                                            await cardUsersRecord.reference
                                                .update(usersUpdateData2);
                                            logFirebaseEvent(
                                                'Button_trigger_push_notification');
                                            triggerPushNotification(
                                              notificationTitle:
                                                  'Account Status: Rejected',
                                              notificationText:
                                                  'Your account has been rejected. Review your personal information and resend your verification request.',
                                              notificationSound: 'default',
                                              userRefs: [
                                                cardUsersRecord.reference
                                              ],
                                              initialPageName:
                                                  'personalInformation',
                                              parameterData: {},
                                            );
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            await listViewVerificationRequestsRecord
                                                .reference
                                                .delete();
                                            return;
                                          }
                                        } else {
                                          return;
                                        }
                                      },
                                      text: 'Reject',
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
                                        elevation: 8,
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
                                            'APPROVE_USERS_PAGE_VERIFY_BTN_ON_TAP');
                                        logFirebaseEvent('Button_alert_dialog');
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Accept Verification'),
                                                      content: Text(
                                                          'Are you sure you want to accept this verification request'),
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
                                                          child:
                                                              Text('Confirm'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          final usersUpdateData = {
                                            ...createUsersRecordData(
                                              verifiedUser: true,
                                            ),
                                            'account_verification_sent':
                                                FieldValue.delete(),
                                          };
                                          await cardUsersRecord.reference
                                              .update(usersUpdateData);
                                          logFirebaseEvent(
                                              'Button_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle:
                                                'Account Status: Approved',
                                            notificationText:
                                                'Your account has been approved. Enjoy the app!',
                                            notificationSound: 'default',
                                            userRefs: [
                                              cardUsersRecord.reference
                                            ],
                                            initialPageName: 'checkSetup',
                                            parameterData: {},
                                          );
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          await listViewVerificationRequestsRecord
                                              .reference
                                              .delete();
                                          return;
                                        } else {
                                          return;
                                        }
                                      },
                                      text: 'Verify',
                                      icon: Icon(
                                        Icons.verified_user,
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
                                        elevation: 8,
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
                          ],
                        ),
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
