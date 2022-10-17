import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoSeatRequestsWidget extends StatefulWidget {
  const NoSeatRequestsWidget({Key? key}) : super(key: key);

  @override
  _NoSeatRequestsWidgetState createState() => _NoSeatRequestsWidgetState();
}

class _NoSeatRequestsWidgetState extends State<NoSeatRequestsWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Currently, there are no passengers requesting seats in this commute.',
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
