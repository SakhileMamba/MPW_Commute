import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommutesEmptyWidget extends StatefulWidget {
  const CommutesEmptyWidget({Key? key}) : super(key: key);

  @override
  _CommutesEmptyWidgetState createState() => _CommutesEmptyWidgetState();
}

class _CommutesEmptyWidgetState extends State<CommutesEmptyWidget> {
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
            'You do not have any commutes scheduled. Schedule a commute to attract potential passengers, rideshare and earn cash.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ],
      ),
    );
  }
}
