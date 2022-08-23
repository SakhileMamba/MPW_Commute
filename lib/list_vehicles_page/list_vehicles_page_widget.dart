import '../add_vehicle_page/add_vehicle_page_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ListVehiclesPageWidget extends StatefulWidget {
  const ListVehiclesPageWidget({Key? key}) : super(key: key);

  @override
  _ListVehiclesPageWidgetState createState() => _ListVehiclesPageWidgetState();
}

class _ListVehiclesPageWidgetState extends State<ListVehiclesPageWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'list_vehicles_page'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
            logFirebaseEvent('LIST_VEHICLES_arrow_back_rounded_ICN_ON_');
            logFirebaseEvent('IconButton_Navigate-To');
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'account_page'),
              ),
            );
          },
        ),
        title: Text(
          'Vehicles',
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
              Icons.add_rounded,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('LIST_VEHICLES_add_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_Navigate-To');
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddVehiclePageWidget(),
                ),
              );
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
          child: StreamBuilder<List<VehiclesRecord>>(
            stream: queryVehiclesRecord(
              parent: currentUserReference,
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
              List<VehiclesRecord> columnVehiclesRecordList = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(columnVehiclesRecordList.length,
                      (columnIndex) {
                    final columnVehiclesRecord =
                        columnVehiclesRecordList[columnIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CachedNetworkImage(
                            imageUrl: columnVehiclesRecord.imageURL!,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          TextFormField(
                            controller: textController ??=
                                TextEditingController(
                              text:
                                  '${columnVehiclesRecord.year} ${columnVehiclesRecord.make} ${columnVehiclesRecord.model}',
                            ),
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
