import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AcceptDriverEmptyWidget extends StatefulWidget {
  const AcceptDriverEmptyWidget({Key? key}) : super(key: key);

  @override
  _AcceptDriverEmptyWidgetState createState() =>
      _AcceptDriverEmptyWidgetState();
}

class _AcceptDriverEmptyWidgetState extends State<AcceptDriverEmptyWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
            child: FaIcon(
              FontAwesomeIcons.solidSadTear,
              color: FlutterFlowTheme.of(context).secondaryColor,
              size: 50,
            ),
          ),
          Text(
            'You have not requested drivers at the moment.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ],
      ),
    );
  }
}
