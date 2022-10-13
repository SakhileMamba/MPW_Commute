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

class SubscriptionsPageWidget extends StatefulWidget {
  const SubscriptionsPageWidget({Key? key}) : super(key: key);

  @override
  _SubscriptionsPageWidgetState createState() =>
      _SubscriptionsPageWidgetState();
}

class _SubscriptionsPageWidgetState extends State<SubscriptionsPageWidget> {
  bool? purchaseCompleted;
  bool? purchaseCompletedNonSwazi;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'subscriptions_page'});
  }

  @override
  Widget build(BuildContext context) {
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
            logFirebaseEvent('SUBSCRIPTIONS_arrow_back_rounded_ICN_ON_');
            logFirebaseEvent('IconButton_Navigate-Back');
            Navigator.pop(context);
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
          onTap: () => FocusScope.of(context).unfocus(),
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
                          'To gain the privilege of scheduling and managing commutes as a driver, you are required to subscribe.',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                  ],
                ),
                if (!revenue_cat.activeEntitlementIds.contains('Driver Access'))
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      final buttonAppConstantsRecord = snapshot.data!;
                      return FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'SUBSCRIPTIONS_SUBSCRIBE_BTN_ON_TAP');
                          var _shouldSetState = false;
                          if (functions.swaziNumberTest(currentPhoneNumber)) {
                            if (buttonAppConstantsRecord.freeApp!) {
                              logFirebaseEvent('Button_Alert-Dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Free Usage'),
                                    content: Text(
                                        'This app is free for users in Eswatini.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              logFirebaseEvent('Button_Revenue-Cat');
                              purchaseCompleted =
                                  await revenue_cat.purchasePackage(revenue_cat
                                      .offerings!.current!.monthly!.identifier);
                              _shouldSetState = true;
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          } else {
                            logFirebaseEvent('Button_Revenue-Cat');
                            purchaseCompletedNonSwazi =
                                await revenue_cat.purchasePackage(revenue_cat
                                    .offerings!.current!.monthly!.identifier);
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
