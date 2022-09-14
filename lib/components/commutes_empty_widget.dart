import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CommutesEmptyWidget extends StatefulWidget {
  const CommutesEmptyWidget({Key? key}) : super(key: key);

  @override
  _CommutesEmptyWidgetState createState() => _CommutesEmptyWidgetState();
}

class _CommutesEmptyWidgetState extends State<CommutesEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: FaIcon(
                FontAwesomeIcons.solidSadTear,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 150,
              ),
            ),
            Text(
              'You currently do not have any upcoming commutes scheduled. Press the \"add\" icon button in the appbar above to schedule one.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
