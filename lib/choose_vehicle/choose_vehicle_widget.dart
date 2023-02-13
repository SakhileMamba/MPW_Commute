import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_vehicle_model.dart';
export 'choose_vehicle_model.dart';

class ChooseVehicleWidget extends StatefulWidget {
  const ChooseVehicleWidget({Key? key}) : super(key: key);

  @override
  _ChooseVehicleWidgetState createState() => _ChooseVehicleWidgetState();
}

class _ChooseVehicleWidgetState extends State<ChooseVehicleWidget> {
  late ChooseVehicleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseVehicleModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'chooseVehicle'});
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
            logFirebaseEvent('CHOOSE_VEHICLE_arrow_back_rounded_ICN_ON');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Vehicle',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
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
              Icons.close_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('CHOOSE_VEHICLE_close_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_alert_dialog');
              var confirmDialogResponse = await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Cancel Request'),
                        content: Text(
                            'Are you sure you want to cancel this request?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  ) ??
                  false;
              if (confirmDialogResponse) {
                logFirebaseEvent('IconButton_update_app_state');
                FFAppState().tempRequestType = '';
                FFAppState().tempDepartureDateTime = null;
                FFAppState().tempSeats = 0;
                FFAppState().tempPrice = 0.0;
                FFAppState().tempChosenVehicleMaxSeats = 0;
                FFAppState().tempProposingToDrive = false;
                FFAppState().tempPassengerHailingDriverRef = null;
                FFAppState().tempHailingPassengerAccountRef = null;
                FFAppState().tempOriginLatLng = null;
                FFAppState().tempDestinationLatLng = null;
                FFAppState().tempOriginReversed = null;
                FFAppState().tempDestinationReversed = null;
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('beginRequest');

                return;
              } else {
                return;
              }
            },
          ),
        ],
        centerTitle: true,
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
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Choose a vehicle for your commute.',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: StreamBuilder<List<VehiclesRecord>>(
                        stream: queryVehiclesRecord(
                          parent: currentUserReference,
                          queryBuilder: (vehiclesRecord) => vehiclesRecord
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
                          List<VehiclesRecord> rowVehiclesRecordList =
                              snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowVehiclesRecordList.length, (rowIndex) {
                                final rowVehiclesRecord =
                                    rowVehiclesRecordList[rowIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CHOOSE_VEHICLE_Container_wf52k8ep_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_update_app_state');
                                      setState(() {
                                        FFAppState().chosenVehicle =
                                            rowVehiclesRecord.reference;
                                        FFAppState().tempChosenVehicleMaxSeats =
                                            rowVehiclesRecord
                                                .numberOfPassengerSeats!;
                                      });
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Color(0x0B101213),
                                        image: DecorationImage(
                                          fit: BoxFit.scaleDown,
                                          image: CachedNetworkImageProvider(
                                            rowVehiclesRecord.imageURL!,
                                          ),
                                        ),
                                      ),
                                      child: Visibility(
                                        visible: FFAppState().chosenVehicle ==
                                            rowVehiclesRecord.reference,
                                        child: Icon(
                                          Icons.check_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 90,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('CHOOSE_VEHICLE_PAGE_NEXT_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('availableSeats');
                  },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    elevation: 8,
                    borderSide: BorderSide(
                      color: Colors.transparent,
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
