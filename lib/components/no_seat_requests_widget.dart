import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoSeatRequestsWidget extends StatefulWidget {
  const NoSeatRequestsWidget({Key? key}) : super(key: key);

  @override
  _NoSeatRequestsWidgetState createState() => _NoSeatRequestsWidgetState();
}

class _NoSeatRequestsWidgetState extends State<NoSeatRequestsWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      'The are no commuters requesting seats at the moment.',
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
