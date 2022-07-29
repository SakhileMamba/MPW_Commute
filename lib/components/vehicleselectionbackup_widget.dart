import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleselectionbackupWidget extends StatefulWidget {
  const VehicleselectionbackupWidget({Key? key}) : super(key: key);

  @override
  _VehicleselectionbackupWidgetState createState() =>
      _VehicleselectionbackupWidgetState();
}

class _VehicleselectionbackupWidgetState
    extends State<VehicleselectionbackupWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<VehiclesRecord>>(
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
        List<VehiclesRecord> rowVehiclesRecordList = snapshot.data!;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(rowVehiclesRecordList.length, (rowIndex) {
              final rowVehiclesRecord = rowVehiclesRecordList[rowIndex];
              return Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'VEHICLESELECTIONBACKUP_Image_tw6nfgpi_ON');
                        logFirebaseEvent('Image_Update-Local-State');
                        setState(() => FFAppState().choseVehicle =
                            rowVehiclesRecord.reference);
                      },
                      child: Image.network(
                        rowVehiclesRecord.imageURL!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if ((FFAppState().choseVehicle ==
                      rowVehiclesRecord.reference))
                    Icon(
                      Icons.check_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
