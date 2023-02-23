import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_driver_requesting_model.dart';
export 'no_driver_requesting_model.dart';

class NoDriverRequestingWidget extends StatefulWidget {
  const NoDriverRequestingWidget({Key? key}) : super(key: key);

  @override
  _NoDriverRequestingWidgetState createState() =>
      _NoDriverRequestingWidgetState();
}

class _NoDriverRequestingWidgetState extends State<NoDriverRequestingWidget> {
  late NoDriverRequestingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDriverRequestingModel());

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
          'There are no drivers proposing to pick you up at the moment.',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
      ),
    );
  }
}
