import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_drivers_model.dart';
export 'no_drivers_model.dart';

class NoDriversWidget extends StatefulWidget {
  const NoDriversWidget({Key? key}) : super(key: key);

  @override
  _NoDriversWidgetState createState() => _NoDriversWidgetState();
}

class _NoDriversWidgetState extends State<NoDriversWidget> {
  late NoDriversModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDriversModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      'There are no drivers proposing to pick up this passenger at the moment.',
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
