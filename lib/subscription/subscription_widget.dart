import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionWidget extends StatefulWidget {
  const SubscriptionWidget({Key? key}) : super(key: key);

  @override
  _SubscriptionWidgetState createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  bool? purchaseCompleted;
  bool? purchaseCompletedNonSwazi;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'subscription'});
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
            logFirebaseEvent('SUBSCRIPTION_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Subscription',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Driver Access',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        if (revenue_cat.activeEntitlementIds
                            .contains('Driver Access'))
                          Text(
                            'Subscribed',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                      ],
                    ),
                    if (!revenue_cat.activeEntitlementIds
                        .contains('Driver Access'))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Text(
                          'This auto-renewing subscription unlocks the ability for drivers to accept passengers into their commutes (sell car seats). Also, it unlocks the ability to offer to drive passengers that are requesting drivers.',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!revenue_cat.activeEntitlementIds
                        .contains('Driver Access'))
                      FutureBuilder<AppConstantsRecord>(
                        future: AppConstantsRecord.getDocumentOnce(
                            FFAppState().appConstantFreeApp!),
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
                          final buttonAppConstantsRecord = snapshot.data!;
                          return FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SUBSCRIPTION_PAGE_SUBSCRIBE_BTN_ON_TAP');
                              var _shouldSetState = false;
                              if (functions
                                  .swaziNumberTest(currentPhoneNumber)) {
                                if (buttonAppConstantsRecord.freeApp!) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Free Usage'),
                                        content: Text(
                                            'This app is free for users in Eswatini.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  logFirebaseEvent('Button_revenue_cat');
                                  purchaseCompleted = await revenue_cat
                                      .purchasePackage(revenue_cat.offerings!
                                          .current!.monthly!.identifier);
                                  _shouldSetState = true;
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              } else {
                                logFirebaseEvent('Button_revenue_cat');
                                purchaseCompletedNonSwazi = await revenue_cat
                                    .purchasePackage(revenue_cat.offerings!
                                        .current!.monthly!.identifier);
                                _shouldSetState = true;
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            text: 'Subscribe',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50,
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: SelectionArea(
                          child: Text(
                        '(one month free trial)',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'SUBSCRIPTION_TERMS_OF_SERVICE_BTN_ON_TAP');
                          logFirebaseEvent('Button_launch_u_r_l');
                          await launchURL(
                              FFAppState().persistedTermsOfServiceURL);
                        },
                        text: 'Terms of Service',
                        options: FFButtonOptions(
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                          elevation: 0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}