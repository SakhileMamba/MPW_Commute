import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_departure_datetime_model.dart';
export 'filter_departure_datetime_model.dart';

class FilterDepartureDatetimeWidget extends StatefulWidget {
  const FilterDepartureDatetimeWidget({Key? key}) : super(key: key);

  @override
  _FilterDepartureDatetimeWidgetState createState() =>
      _FilterDepartureDatetimeWidgetState();
}

class _FilterDepartureDatetimeWidgetState
    extends State<FilterDepartureDatetimeWidget> {
  late FilterDepartureDatetimeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterDepartureDatetimeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'filterDepartureDatetime'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Date & Time Filter',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Choose your date and time of departure.',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'FILTER_DEPARTURE_DATETIME_Container_j6zz');
                          logFirebaseEvent('Container_date_time_picker');
                          if (kIsWeb) {
                            final _datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: getCurrentTimestamp,
                              firstDate: getCurrentTimestamp,
                              lastDate: DateTime(2050),
                            );

                            TimeOfDay? _datePickedTime;
                            if (_datePickedDate != null) {
                              _datePickedTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(getCurrentTimestamp),
                              );
                            }

                            if (_datePickedDate != null &&
                                _datePickedTime != null) {
                              setState(() {
                                _model.datePicked = DateTime(
                                  _datePickedDate.year,
                                  _datePickedDate.month,
                                  _datePickedDate.day,
                                  _datePickedTime!.hour,
                                  _datePickedTime.minute,
                                );
                              });
                            }
                          } else {
                            await DatePicker.showDateTimePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (date) {
                                setState(() {
                                  _model.datePicked = date;
                                });
                              },
                              currentTime: getCurrentTimestamp,
                              minTime: getCurrentTimestamp,
                              locale: LocaleType.values.firstWhere(
                                (l) =>
                                    l.name ==
                                    FFLocalizations.of(context).languageCode,
                                orElse: () => LocaleType.en,
                              ),
                            );
                          }

                          logFirebaseEvent('Container_update_app_state');
                          setState(() {
                            FFAppState().tempDepartureDateTime =
                                _model.datePicked;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                                child: Text(
                                  valueOrDefault<String>(
                                    '${dateTimeFormat(
                                      'yMMMd',
                                      FFAppState().tempDepartureDateTime,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}, ${dateTimeFormat(
                                      'jm',
                                      FFAppState().tempDepartureDateTime,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}',
                                    'Not set',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                                child: Icon(
                                  Icons.date_range_rounded,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'FILTER_DEPARTURE_DATETIME_NEXT_BTN_ON_TA');
                    if (FFAppState().tempDepartureDateTime != null) {
                      if (FFAppState().filterCallingSource == 'drivers') {
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().filterCallingSource = '';
                        FFAppState().filterDepartureDatetime =
                            _model.datePicked;
                        FFAppState().filterCurrentDateTime =
                            getCurrentTimestamp;
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed('drivers');

                        return;
                      } else {
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().filterCallingSource = '';
                        FFAppState().filterDepartureDatetime =
                            _model.datePicked;
                        FFAppState().filterCurrentDateTime =
                            getCurrentTimestamp;
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed('passengers');

                        return;
                      }
                    } else {
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Error'),
                            content:
                                Text('Choose your departure date and time'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Continue'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }
                  },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    elevation: 8,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
