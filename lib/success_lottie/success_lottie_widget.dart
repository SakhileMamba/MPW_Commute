import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SuccessLottieWidget extends StatefulWidget {
  const SuccessLottieWidget({Key? key}) : super(key: key);

  @override
  _SuccessLottieWidgetState createState() => _SuccessLottieWidgetState();
}

class _SuccessLottieWidgetState extends State<SuccessLottieWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'success_lottie'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Lottie.asset(
                    'assets/lottie_animations/lf30_editor_2c9xhqlg.json',
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                    repeat: false,
                    animate: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
