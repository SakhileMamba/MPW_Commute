import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vehicles_model.dart';
export 'vehicles_model.dart';

class VehiclesWidget extends StatefulWidget {
  const VehiclesWidget({Key? key}) : super(key: key);

  @override
  _VehiclesWidgetState createState() => _VehiclesWidgetState();
}

class _VehiclesWidgetState extends State<VehiclesWidget> {
  late VehiclesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehiclesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'vehicles'});
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
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('VEHICLES_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('account');
          },
        ),
        title: Text(
          'Vehicles',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.add_rounded,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('VEHICLES_PAGE_add_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed('addVehicle');
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: StreamBuilder<List<VehiclesRecord>>(
            stream: queryVehiclesRecord(
              parent: currentUserReference,
              queryBuilder: (vehiclesRecord) =>
                  vehiclesRecord.where('archived', isEqualTo: false),
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
              List<VehiclesRecord> listViewVehiclesRecordList = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewVehiclesRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewVehiclesRecord =
                      listViewVehiclesRecordList[listViewIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CachedNetworkImage(
                          imageUrl: listViewVehiclesRecord.imageURL!,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Text(
                              '${listViewVehiclesRecord.year}, ${listViewVehiclesRecord.make}, ${listViewVehiclesRecord.model}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'VEHICLES_PAGE_ARCHIVE_BTN_ON_TAP');
                              logFirebaseEvent('Button_alert_dialog');
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Confirmation'),
                                            content: Text(
                                                'Are you sure you want to archive this vehicle? You will not be able to access it again.'),
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
                                logFirebaseEvent('Button_backend_call');

                                final vehiclesUpdateData =
                                    createVehiclesRecordData(
                                  archived: true,
                                );
                                await listViewVehiclesRecord.reference
                                    .update(vehiclesUpdateData);
                                return;
                              } else {
                                return;
                              }
                            },
                            text: 'Archive',
                            icon: Icon(
                              Icons.archive_rounded,
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
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
