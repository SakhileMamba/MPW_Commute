import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'browse_passengers_empty_model.dart';
export 'browse_passengers_empty_model.dart';

class BrowsePassengersEmptyWidget extends StatefulWidget {
  const BrowsePassengersEmptyWidget({Key? key}) : super(key: key);

  @override
  _BrowsePassengersEmptyWidgetState createState() =>
      _BrowsePassengersEmptyWidgetState();
}

class _BrowsePassengersEmptyWidgetState
    extends State<BrowsePassengersEmptyWidget> {
  late BrowsePassengersEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowsePassengersEmptyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        child: Text(
          (FFAppState().filterTempOriginReversed == null) &&
                  (FFAppState().filterTempDestinationReversed == null)
              ? 'Set the origin, destination and departure datetime filters to start browing ride hailers.'
              : 'There are no ride hailers from ${functions.trimCommaEnd('${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['neighborhood']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['locality']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['sublocality']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['sublocality_level_1']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['sublocality_level_2']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['sublocality_level_3']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['sublocality_level_4']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['sublocality_level_5']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['administrative_area_level_1']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['administrative_area_level_2']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['administrative_area_level_3']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['administrative_area_level_4']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['administrative_area_level_5']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['administrative_area_level_6']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['administrative_area_level_7']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['country']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['postal_code']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['postal_code_prefix']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempOriginReversed,
                  r'''$['postal_town']''',
                ).toString())}')} to ${functions.trimCommaEnd('${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['neighborhood']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['locality']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['sublocality']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['sublocality_level_1']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['sublocality_level_2']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['sublocality_level_3']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['sublocality_level_4']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['sublocality_level_5']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['administrative_area_level_1']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['administrative_area_level_2']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['administrative_area_level_3']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['administrative_area_level_4']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['administrative_area_level_5']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['administrative_area_level_6']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['administrative_area_level_7']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['country']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['postal_code']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['postal_code_prefix']''',
                ).toString())}${functions.nullTest(getJsonField(
                  FFAppState().filterTempDestinationReversed,
                  r'''$['postal_town']''',
                ).toString())}')} before or on ${dateTimeFormat(
                  'MMMMEEEEd',
                  FFAppState().filterDepartureDatetime,
                  locale: FFLocalizations.of(context).languageCode,
                )}, ${dateTimeFormat(
                  'jm',
                  FFAppState().filterDepartureDatetime,
                  locale: FFLocalizations.of(context).languageCode,
                )}. Choose different search filters, or try again later.',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
      ),
    );
  }
}
