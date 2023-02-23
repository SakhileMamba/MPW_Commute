import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/no_passengers_widget.dart';
import '../components/no_seat_requests_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'drive_details_model.dart';
export 'drive_details_model.dart';

class DriveDetailsWidget extends StatefulWidget {
  const DriveDetailsWidget({
    Key? key,
    this.commuteDoc,
    this.driverDoc,
    bool? notNotificationOpen,
  })  : this.notNotificationOpen = notNotificationOpen ?? false,
        super(key: key);

  final CommutesRecord? commuteDoc;
  final UsersRecord? driverDoc;
  final bool notNotificationOpen;

  @override
  _DriveDetailsWidgetState createState() => _DriveDetailsWidgetState();
}

class _DriveDetailsWidgetState extends State<DriveDetailsWidget> {
  late DriveDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriveDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'driveDetails'});
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
        leading: FlutterFlowIconButton(
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
            logFirebaseEvent('DRIVE_DETAILS_arrow_back_rounded_ICN_ON_');
            if (widget.notNotificationOpen) {
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
              return;
            } else {
              logFirebaseEvent('IconButton_navigate_to');

              context.goNamed('beginRequest');

              return;
            }
          },
        ),
        title: Text(
          'Drive Details',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [
          Builder(
            builder: (context) => FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.share_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('DRIVE_DETAILS_share_rounded_ICN_ON_TAP');
                logFirebaseEvent('IconButton_generate_current_page_link');
                _model.currentPageLink = await generateCurrentPageLink(
                  context,
                  title: 'Commute Ridesharing: Passengers Required',
                  description:
                      'Rideshare with me from ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalTown!)}')} to ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalTown!)}')}, on ${dateTimeFormat(
                    'MMMEd',
                    widget.commuteDoc!.departureDatetime,
                    locale: FFLocalizations.of(context).languageCode,
                  )}, ${dateTimeFormat(
                    'jm',
                    widget.commuteDoc!.departureDatetime,
                    locale: FFLocalizations.of(context).languageCode,
                  )}.',
                  isShortLink: false,
                );

                logFirebaseEvent('IconButton_share');
                await Share.share(
                  _model.currentPageLink,
                  sharePositionOrigin: getWidgetBoundingBox(context),
                );
              },
            ),
          ),
          Visibility(
            visible: (widget.driverDoc!.reference != currentUserReference) &&
                !FFAppState().driverMode,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.send_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('DRIVE_DETAILS_send_rounded_ICN_ON_TAP');
                if (widget.commuteDoc!.applicantList!
                    .toList()
                    .contains(currentUserReference)) {
                  logFirebaseEvent('IconButton_alert_dialog');
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Request Pending'),
                        content: Text(
                            'You have a pending request for this commute. Please wait for a response.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Continue'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                } else {
                  if (widget.commuteDoc!.archived!) {
                    logFirebaseEvent('IconButton_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Commute Alert'),
                          content: Text(
                              'This commute has expired. You are unable to send a seat request.'),
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
                  } else {
                    if (valueOrDefault<bool>(
                        currentUserDocument?.verifiedUser, false)) {
                      if (getCurrentTimestamp <
                          widget.commuteDoc!.departureDatetime!) {
                        logFirebaseEvent('IconButton_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Seat Request'),
                                  content: Text(
                                      'Are you sure you want to send this driver a request for a seat?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          logFirebaseEvent('IconButton_backend_call');

                          final passengersCreateData =
                              createPassengersRecordData(
                            passengerAccount: currentUserReference,
                            accepted: false,
                            commuteDatetime:
                                widget.commuteDoc!.departureDatetime,
                            archived: false,
                          );
                          await PassengersRecord.createDoc(
                                  widget.commuteDoc!.reference)
                              .set(passengersCreateData);
                          logFirebaseEvent('IconButton_backend_call');

                          final commutesUpdateData = {
                            'applicant_list':
                                FieldValue.arrayUnion([currentUserReference]),
                          };
                          await widget.commuteDoc!.reference
                              .update(commutesUpdateData);
                          logFirebaseEvent(
                              'IconButton_trigger_push_notification');
                          triggerPushNotification(
                            notificationTitle: 'New Seat Request',
                            notificationText:
                                'You have received a new seat request for your commute to ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalTown!)}')} on ${dateTimeFormat(
                              'yMMMd',
                              widget.commuteDoc!.departureDatetime,
                              locale: FFLocalizations.of(context).languageCode,
                            )}, ${dateTimeFormat(
                              'jm',
                              widget.commuteDoc!.departureDatetime,
                              locale: FFLocalizations.of(context).languageCode,
                            )}.',
                            userRefs: [widget.driverDoc!.reference],
                            initialPageName: 'drives',
                            parameterData: {},
                          );
                          logFirebaseEvent('IconButton_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Seat Request Confirmation'),
                                content: Text(
                                    'Your request for a seat has been sent to the driver. You will receive a notification to inform you whether you\'ve been accepted or rejected.'),
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
                        } else {
                          return;
                        }
                      } else {
                        logFirebaseEvent('IconButton_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Commute Expired'),
                              content: Text(
                                  'Please note that your request is late (past the scheduled depature time). Please find a different commute or request a driver.'),
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
                      logFirebaseEvent('IconButton_alert_dialog');
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
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Verify'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed('personalInformation');

                        return;
                      } else {
                        return;
                      }
                    }
                  }
                }
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: FutureBuilder<UsersRecord>(
                    future:
                        UsersRecord.getDocumentOnce(widget.commuteDoc!.driver!),
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'DRIVE_DETAILS_CircleImage_rjes63hs_ON_TA');
                                      logFirebaseEvent(
                                          'CircleImage_expand_image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                cardUsersRecord.photoUrl,
                                                'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: valueOrDefault<String>(
                                              cardUsersRecord.photoUrl,
                                              'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                            ),
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: valueOrDefault<String>(
                                        cardUsersRecord.photoUrl,
                                        'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                      ),
                                      transitionOnUserGestures: true,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: valueOrDefault<String>(
                                            cardUsersRecord.photoUrl,
                                            'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 10, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${cardUsersRecord.displayName} ${cardUsersRecord.displaySurname}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
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
                                  if (cardUsersRecord.rating! > 0.0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            functions.twoDeci(
                                                cardUsersRecord.rating!),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  StreamBuilder<List<PassengersRecord>>(
                                    stream: queryPassengersRecord(
                                      parent: widget.commuteDoc!.reference,
                                      queryBuilder: (passengersRecord) =>
                                          passengersRecord.where(
                                              'passenger_account',
                                              isEqualTo: currentUserReference),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<PassengersRecord>
                                          containerPassengersRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerPassengersRecord =
                                          containerPassengersRecordList
                                                  .isNotEmpty
                                              ? containerPassengersRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Visibility(
                                          visible: containerPassengersRecord!
                                                  .accepted ??
                                              true,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 40,
                                              icon: Icon(
                                                Icons.call_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'DRIVE_DETAILS_call_rounded_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_launch_u_r_l');
                                                await launchURL(
                                                    'tel:${widget.driverDoc!.phoneNumber}');
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: FutureBuilder<VehiclesRecord>(
                                future: VehiclesRecord.getDocumentOnce(
                                    widget.commuteDoc!.vehicle!),
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
                                  final imageVehiclesRecord = snapshot.data!;
                                  return InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'DRIVE_DETAILS_PAGE_Image_ksspjqww_ON_TAP');
                                      logFirebaseEvent('Image_expand_image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                imageVehiclesRecord.imageURL,
                                                'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: valueOrDefault<String>(
                                              imageVehiclesRecord.imageURL,
                                              'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                            ),
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: valueOrDefault<String>(
                                        imageVehiclesRecord.imageURL,
                                        'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                      ),
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl: valueOrDefault<String>(
                                            imageVehiclesRecord.imageURL,
                                            'https://firebasestorage.googleapis.com/v0/b/mpw-commute.appspot.com/o/add_image2.png?alt=media&token=4ffe4096-df47-4d0f-b96b-e717df64c7c3',
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Icon(
                                      Icons.trip_origin_rounded,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 3, 0, 0),
                                      child: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Text(
                                          functions.trimCommaEnd(
                                              '${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalTown!)}'),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 3, 0, 0),
                                      child: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Text(
                                          functions.trimCommaEnd(
                                              '${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalTown!)}'),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
                                              child: Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'jm',
                                                    widget.commuteDoc!
                                                        .departureDatetime!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
                                              child: Icon(
                                                Icons.date_range_rounded,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'MMMEd',
                                                    widget.commuteDoc!
                                                        .departureDatetime!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Icon(
                                              Icons
                                                  .airline_seat_recline_normal_rounded,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Text(
                                                widget.commuteDoc!
                                                    .availablePassengerSeats!
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: FaIcon(
                                              FontAwesomeIcons.moneyBillWaveAlt,
                                              color: Colors.black,
                                              size: 19,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Text(
                                                '${functions.twoDeci(widget.commuteDoc!.pricePerSeat!)} ${widget.commuteDoc!.currency}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                if (currentUserReference == widget.driverDoc!.reference)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                    child: Text(
                      'Pending Seat Requests',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ),
                if (currentUserReference == widget.driverDoc!.reference)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: StreamBuilder<List<PassengersRecord>>(
                      stream: queryPassengersRecord(
                        parent: widget.commuteDoc!.reference,
                        queryBuilder: (passengersRecord) => passengersRecord
                            .where('accepted', isEqualTo: false)
                            .where('archived', isEqualTo: false),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitChasingDots(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<PassengersRecord> listViewPassengersRecordList =
                            snapshot.data!;
                        if (listViewPassengersRecordList.isEmpty) {
                          return NoSeatRequestsWidget();
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPassengersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPassengersRecord =
                                listViewPassengersRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewPassengersRecord.passengerAccount!),
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
                                  final cardUsersRecord = snapshot.data!;
                                  return Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    elevation: 0,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF1F4F8),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'DRIVE_DETAILS_CircleImage_y0dr93ig_ON_TA');
                                                        logFirebaseEvent(
                                                            'CircleImage_expand_image');
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    cardUsersRecord
                                                                        .photoUrl!,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: cardUsersRecord
                                                                  .photoUrl!,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: cardUsersRecord
                                                            .photoUrl!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: Container(
                                                          width: 50,
                                                          height: 50,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                cardUsersRecord
                                                                    .photoUrl!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 10, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${cardUsersRecord.displayName} ${cardUsersRecord.displaySurname}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          cardUsersRecord
                                                              .gender!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if (cardUsersRecord.rating! >
                                                    0.0)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              functions.twoDeci(
                                                                  cardUsersRecord
                                                                      .rating!),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 18,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'DRIVE_DETAILS_PAGE_DECLINE_BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_trigger_push_notification');
                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'Seat Request Declined',
                                                            notificationText:
                                                                'Your request for a seat on the commute from ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalTown!)}')} to ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalTown!)}')} has been declined.',
                                                            notificationSound:
                                                                'default',
                                                            userRefs: [
                                                              cardUsersRecord
                                                                  .reference
                                                            ],
                                                            initialPageName:
                                                                'seats',
                                                            parameterData: {},
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          final passengersUpdateData =
                                                              createPassengersRecordData(
                                                            archived: true,
                                                          );
                                                          await listViewPassengersRecord
                                                              .reference
                                                              .update(
                                                                  passengersUpdateData);
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          final commutesUpdateData =
                                                              {
                                                            'applicant_list':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              listViewPassengersRecord
                                                                  .passengerAccount
                                                            ]),
                                                          };
                                                          await widget
                                                              .commuteDoc!
                                                              .reference
                                                              .update(
                                                                  commutesUpdateData);
                                                          logFirebaseEvent(
                                                              'Button_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Notice'),
                                                                content: Text(
                                                                    'The user has been notified of your decision.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        text: 'Decline',
                                                        icon: Icon(
                                                          Icons.cancel_rounded,
                                                          size: 15,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 50,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                          elevation: 8,
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: FutureBuilder<
                                                          AppConstantsRecord>(
                                                        future: AppConstantsRecord
                                                            .getDocumentOnce(
                                                                FFAppState()
                                                                    .appConstantFreeApp!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitChasingDots(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final buttonAppConstantsRecord =
                                                              snapshot.data!;
                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'DRIVE_DETAILS_PAGE_ACCEPT_BTN_ON_TAP');
                                                              if (buttonAppConstantsRecord
                                                                  .freeApp!) {
                                                                if (functions
                                                                    .swaziNumberTest(
                                                                        currentPhoneNumber)) {
                                                                  if (cardUsersRecord
                                                                      .verifiedUser!) {
                                                                    if (cardUsersRecord
                                                                        .verifiedDriver!) {
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');

                                                                      final passengersUpdateData1 =
                                                                          createPassengersRecordData(
                                                                        accepted:
                                                                            true,
                                                                      );
                                                                      await listViewPassengersRecord
                                                                          .reference
                                                                          .update(
                                                                              passengersUpdateData1);
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');

                                                                      final commutesUpdateData1 =
                                                                          {
                                                                        'available_passenger_seats':
                                                                            FieldValue.increment(-(1)),
                                                                        'applicant_list':
                                                                            FieldValue.arrayRemove([
                                                                          listViewPassengersRecord
                                                                              .passengerAccount
                                                                        ]),
                                                                      };
                                                                      await listViewPassengersRecord
                                                                          .parentReference
                                                                          .update(
                                                                              commutesUpdateData1);
                                                                      logFirebaseEvent(
                                                                          'Button_trigger_push_notification');
                                                                      triggerPushNotification(
                                                                        notificationTitle:
                                                                            'Seat Request Accepted',
                                                                        notificationText:
                                                                            'Your request for a seat on the commute from ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalTown!)}')} to ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalTown!)}')} has been accepted.',
                                                                        notificationSound:
                                                                            'default',
                                                                        userRefs: [
                                                                          cardUsersRecord
                                                                              .reference
                                                                        ],
                                                                        initialPageName:
                                                                            'seats',
                                                                        parameterData: {},
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Notice'),
                                                                            content:
                                                                                Text('The user has been notified of your decision.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      return;
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_alert_dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Driver\'s License Verification'),
                                                                                content: Text('Please upload your driver\'s license and send a request to verify it.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Verify'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (confirmDialogResponse) {
                                                                        logFirebaseEvent(
                                                                            'Button_navigate_to');

                                                                        context.pushNamed(
                                                                            'driversLicense');

                                                                        return;
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_alert_dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Account Verification'),
                                                                                  content: Text('Your account is not verified.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Verify'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context.pushNamed(
                                                                          'account');

                                                                      return;
                                                                    } else {
                                                                      return;
                                                                    }
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Button_revenue_cat');
                                                                  final isEntitled =
                                                                      await revenue_cat
                                                                          .isEntitled(
                                                                              'Driver Access');
                                                                  if (isEntitled ==
                                                                      null) {
                                                                    return;
                                                                  } else if (!isEntitled) {
                                                                    await revenue_cat
                                                                        .loadOfferings();
                                                                  }

                                                                  if (isEntitled) {
                                                                    if (cardUsersRecord
                                                                        .verifiedUser!) {
                                                                      if (cardUsersRecord
                                                                          .verifiedDriver!) {
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        final passengersUpdateData2 =
                                                                            createPassengersRecordData(
                                                                          accepted:
                                                                              true,
                                                                        );
                                                                        await listViewPassengersRecord
                                                                            .reference
                                                                            .update(passengersUpdateData2);
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        final commutesUpdateData2 =
                                                                            {
                                                                          'available_passenger_seats':
                                                                              FieldValue.increment(-(1)),
                                                                          'applicant_list':
                                                                              FieldValue.arrayRemove([
                                                                            listViewPassengersRecord.passengerAccount
                                                                          ]),
                                                                        };
                                                                        await listViewPassengersRecord
                                                                            .parentReference
                                                                            .update(commutesUpdateData2);
                                                                        logFirebaseEvent(
                                                                            'Button_trigger_push_notification');
                                                                        triggerPushNotification(
                                                                          notificationTitle:
                                                                              'Seat Request Accepted',
                                                                          notificationText:
                                                                              'Your request for a seat on the commute from ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalTown!)}')} to ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalTown!)}')} has been accepted.',
                                                                          notificationSound:
                                                                              'default',
                                                                          userRefs: [
                                                                            cardUsersRecord.reference
                                                                          ],
                                                                          initialPageName:
                                                                              'seats',
                                                                          parameterData: {},
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_alert_dialog');
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Notice'),
                                                                              content: Text('The user has been notified of your decision.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        return;
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_alert_dialog');
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Driver\'s License Verification'),
                                                                                  content: Text('Please upload your driver\'s license and send a request to verify it.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Verify'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .pushNamed('driversLicense');

                                                                          return;
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      }
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_alert_dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Account Verification'),
                                                                                content: Text('Your account is not verified.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Verify'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (confirmDialogResponse) {
                                                                        logFirebaseEvent(
                                                                            'Button_navigate_to');

                                                                        context.pushNamed(
                                                                            'account');

                                                                        return;
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_alert_dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Driver Subscription'),
                                                                                  content: Text('To accept passengers into your commute, please subscribe.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Subscribe'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context.pushNamed(
                                                                          'subscription');
                                                                    } else {
                                                                      return;
                                                                    }

                                                                    return;
                                                                  }
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Button_revenue_cat');
                                                                final isEntitled =
                                                                    await revenue_cat
                                                                        .isEntitled(
                                                                            'Driver Access');
                                                                if (isEntitled ==
                                                                    null) {
                                                                  return;
                                                                } else if (!isEntitled) {
                                                                  await revenue_cat
                                                                      .loadOfferings();
                                                                }

                                                                if (isEntitled) {
                                                                  if (cardUsersRecord
                                                                      .verifiedUser!) {
                                                                    if (cardUsersRecord
                                                                        .verifiedDriver!) {
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');

                                                                      final passengersUpdateData3 =
                                                                          createPassengersRecordData(
                                                                        accepted:
                                                                            true,
                                                                      );
                                                                      await listViewPassengersRecord
                                                                          .reference
                                                                          .update(
                                                                              passengersUpdateData3);
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');

                                                                      final commutesUpdateData3 =
                                                                          {
                                                                        'available_passenger_seats':
                                                                            FieldValue.increment(-(1)),
                                                                        'applicant_list':
                                                                            FieldValue.arrayRemove([
                                                                          listViewPassengersRecord
                                                                              .passengerAccount
                                                                        ]),
                                                                      };
                                                                      await listViewPassengersRecord
                                                                          .parentReference
                                                                          .update(
                                                                              commutesUpdateData3);
                                                                      logFirebaseEvent(
                                                                          'Button_trigger_push_notification');
                                                                      triggerPushNotification(
                                                                        notificationTitle:
                                                                            'Seat Request Accepted',
                                                                        notificationText:
                                                                            'Your request for a seat on the commute from ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.originReversedGeocoded.postalTown!)}')} to ${functions.trimCommaEnd('${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.neighborhood!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.locality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocality!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.sublocalityLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel1!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel2!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel3!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel4!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel5!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel6!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.administrativeAreaLevel7!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.country!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCode!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalCodePrefix!)}${functions.nullTest(widget.commuteDoc!.destinationReversedGeocoded.postalTown!)}')} has been accepted.',
                                                                        notificationSound:
                                                                            'default',
                                                                        userRefs: [
                                                                          cardUsersRecord
                                                                              .reference
                                                                        ],
                                                                        initialPageName:
                                                                            'seats',
                                                                        parameterData: {},
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Notice'),
                                                                            content:
                                                                                Text('The user has been notified of your decision.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      return;
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_alert_dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Driver\'s License Verification'),
                                                                                content: Text('Please upload your driver\'s license and send a request to verify it.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Verify'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (confirmDialogResponse) {
                                                                        logFirebaseEvent(
                                                                            'Button_navigate_to');

                                                                        context.pushNamed(
                                                                            'driversLicense');

                                                                        return;
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_alert_dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Account Verification'),
                                                                                  content: Text('Your account is not verified.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Verify'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context.pushNamed(
                                                                          'account');

                                                                      return;
                                                                    } else {
                                                                      return;
                                                                    }
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Button_alert_dialog');
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Driver Subscription'),
                                                                                content: Text('To accept passengers into your commute, please subscribe.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Subscribe'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    logFirebaseEvent(
                                                                        'Button_navigate_to');

                                                                    context.pushNamed(
                                                                        'subscription');
                                                                  } else {
                                                                    return;
                                                                  }

                                                                  return;
                                                                }
                                                              }
                                                            },
                                                            text: 'Accept',
                                                            icon: Icon(
                                                              Icons
                                                                  .check_circle_rounded,
                                                              size: 15,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 130,
                                                              height: 50,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                              elevation: 8,
                                                              borderSide:
                                                                  BorderSide(
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
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
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                  child: Text(
                    'Accepted Passengers',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: StreamBuilder<List<PassengersRecord>>(
                    stream: queryPassengersRecord(
                      parent: widget.commuteDoc!.reference,
                      queryBuilder: (passengersRecord) => passengersRecord
                          .where('accepted', isEqualTo: true)
                          .where('archived', isEqualTo: false),
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
                      List<PassengersRecord> listViewPassengersRecordList =
                          snapshot.data!;
                      if (listViewPassengersRecordList.isEmpty) {
                        return NoPassengersWidget();
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewPassengersRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewPassengersRecord =
                              listViewPassengersRecordList[listViewIndex];
                          return StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                listViewPassengersRecord.passengerAccount!),
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
                              final cardUsersRecord = snapshot.data!;
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 4, 0),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF1F4F8),
                                            shape: BoxShape.circle,
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DRIVE_DETAILS_CircleImage_ym60z0hs_ON_TA');
                                              logFirebaseEvent(
                                                  'CircleImage_expand_image');
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: CachedNetworkImage(
                                                      imageUrl: cardUsersRecord
                                                          .photoUrl!,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: cardUsersRecord
                                                        .photoUrl!,
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: cardUsersRecord.photoUrl!,
                                              transitionOnUserGestures: true,
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      cardUsersRecord.photoUrl!,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 10, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${cardUsersRecord.displayName} ${cardUsersRecord.displaySurname}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Text(
                                                cardUsersRecord.gender!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (cardUsersRecord.rating! > 0.0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 10, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    functions.twoDeci(
                                                        cardUsersRecord
                                                            .rating!),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 18,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (currentUserReference ==
                                          widget.commuteDoc!.driver)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            icon: Icon(
                                              Icons.call_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'DRIVE_DETAILS_call_rounded_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_launch_u_r_l');
                                              await launchURL(
                                                  'tel:${cardUsersRecord.phoneNumber}');
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
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
