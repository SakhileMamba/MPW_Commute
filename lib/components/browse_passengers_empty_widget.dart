import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
            'There are no passengers looking for drivers at the moment. Change your filters or try again later.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ],
      ),
    );
  }
}
