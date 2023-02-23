import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'accept_driver_empty_model.dart';
export 'accept_driver_empty_model.dart';

class AcceptDriverEmptyWidget extends StatefulWidget {
  const AcceptDriverEmptyWidget({Key? key}) : super(key: key);

  @override
  _AcceptDriverEmptyWidgetState createState() =>
      _AcceptDriverEmptyWidgetState();
}

class _AcceptDriverEmptyWidgetState extends State<AcceptDriverEmptyWidget> {
  late AcceptDriverEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcceptDriverEmptyModel());

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
          'You have not requested drivers.',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
      ),
    );
  }
}
