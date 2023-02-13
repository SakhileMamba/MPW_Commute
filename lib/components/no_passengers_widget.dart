import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_passengers_model.dart';
export 'no_passengers_model.dart';

class NoPassengersWidget extends StatefulWidget {
  const NoPassengersWidget({Key? key}) : super(key: key);

  @override
  _NoPassengersWidgetState createState() => _NoPassengersWidgetState();
}

class _NoPassengersWidgetState extends State<NoPassengersWidget> {
  late NoPassengersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoPassengersModel());

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
      'There are no accepted passengers in this commute.',
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
