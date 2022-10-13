import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoDriversWidget extends StatefulWidget {
  const NoDriversWidget({Key? key}) : super(key: key);

  @override
  _NoDriversWidgetState createState() => _NoDriversWidgetState();
}

class _NoDriversWidgetState extends State<NoDriversWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Currently, there are no drivers requesting to pickup the passenger for this commute.',
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
