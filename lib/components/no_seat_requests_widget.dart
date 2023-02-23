import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_seat_requests_model.dart';
export 'no_seat_requests_model.dart';

class NoSeatRequestsWidget extends StatefulWidget {
  const NoSeatRequestsWidget({Key? key}) : super(key: key);

  @override
  _NoSeatRequestsWidgetState createState() => _NoSeatRequestsWidgetState();
}

class _NoSeatRequestsWidgetState extends State<NoSeatRequestsWidget> {
  late NoSeatRequestsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoSeatRequestsModel());

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

    return Text(
      'There are no passengers requesting a seat at the moment.',
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
