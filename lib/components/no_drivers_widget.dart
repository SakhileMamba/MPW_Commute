import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoDriversWidget extends StatefulWidget {
  const NoDriversWidget({Key? key}) : super(key: key);

  @override
  _NoDriversWidgetState createState() => _NoDriversWidgetState();
}

class _NoDriversWidgetState extends State<NoDriversWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      'The are no drivers proposing to pick up this commuter. Send this potential passenger a proposal to earn cash.',
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
