import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPassengersWidget extends StatefulWidget {
  const NoPassengersWidget({Key? key}) : super(key: key);

  @override
  _NoPassengersWidgetState createState() => _NoPassengersWidgetState();
}

class _NoPassengersWidgetState extends State<NoPassengersWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Currently, there are no passengers in this commute.',
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
