import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BrowsePassengersEmptyWidget extends StatefulWidget {
  const BrowsePassengersEmptyWidget({Key? key}) : super(key: key);

  @override
  _BrowsePassengersEmptyWidgetState createState() =>
      _BrowsePassengersEmptyWidgetState();
}

class _BrowsePassengersEmptyWidgetState
    extends State<BrowsePassengersEmptyWidget> {
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
            FFAppState().originFiltered
                ? 'The are no commuters requesting drivers near the origin in your search filters. Choose a different location, or try again later.'
                : 'The are no commuters requesting drivers near your current location. Choose a different origin in your search filters, or try again later.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ],
      ),
    );
  }
}
