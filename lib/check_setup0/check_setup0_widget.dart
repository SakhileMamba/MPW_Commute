import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CheckSetup0Widget extends StatefulWidget {
  const CheckSetup0Widget({Key? key}) : super(key: key);

  @override
  _CheckSetup0WidgetState createState() => _CheckSetup0WidgetState();
}

class _CheckSetup0WidgetState extends State<CheckSetup0Widget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'checkSetup0'});
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

    return StreamBuilder<List<AppConstantsRecord>>(
      stream: queryAppConstantsRecord(
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
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<AppConstantsRecord> checkSetup0AppConstantsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final checkSetup0AppConstantsRecord =
            checkSetup0AppConstantsRecordList.isNotEmpty
                ? checkSetup0AppConstantsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Lottie.asset(
                    'assets/lottie_animations/lf30_editor_qvakyxtx.json',
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    fit: BoxFit.fitWidth,
                    animate: true,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
