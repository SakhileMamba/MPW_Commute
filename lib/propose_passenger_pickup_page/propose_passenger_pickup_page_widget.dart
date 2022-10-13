import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProposePassengerPickupPageWidget extends StatefulWidget {
  const ProposePassengerPickupPageWidget({
    Key? key,
    this.passengerHail,
  }) : super(key: key);

  final PassengersHailingRecord? passengerHail;

  @override
  _ProposePassengerPickupPageWidgetState createState() =>
      _ProposePassengerPickupPageWidgetState();
}

class _ProposePassengerPickupPageWidgetState
    extends State<ProposePassengerPickupPageWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'propose_passenger_pickup_page'});
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('PROPOSE_PASSENGER_PICKUP_arrow_back_roun');
            logFirebaseEvent('IconButton_Navigate-Back');
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Pickup Request',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Vehicle(s)',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: StreamBuilder<List<VehiclesRecord>>(
                      stream: queryVehiclesRecord(
                        parent: currentUserReference,
                        queryBuilder: (vehiclesRecord) =>
                            vehiclesRecord.where('archived', isEqualTo: false),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitChasingDots(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<VehiclesRecord> rowVehiclesRecordList =
                            snapshot.data!;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                rowVehiclesRecordList.length, (rowIndex) {
                              final rowVehiclesRecord =
                                  rowVehiclesRecordList[rowIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'PROPOSE_PASSENGER_PICKUP_Container_3fmbc');
                                    logFirebaseEvent(
                                        'Container_Update-Local-State');
                                    setState(() => FFAppState().chosenVehicle =
                                        rowVehiclesRecord.reference);
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0x0B101213),
                                      image: DecorationImage(
                                        fit: BoxFit.scaleDown,
                                        image: CachedNetworkImageProvider(
                                          rowVehiclesRecord.imageURL!,
                                        ),
                                      ),
                                    ),
                                    child: Visibility(
                                      visible: FFAppState().chosenVehicle ==
                                          rowVehiclesRecord.reference,
                                      child: Icon(
                                        Icons.check_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 90,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Available Seats',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textController1,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Please input seats',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                suffixIcon: Icon(
                                  Icons.airline_seat_recline_normal_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            width: 6,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Price/Seat',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textController2,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Please input price',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                suffixIcon: Icon(
                                  Icons.monetization_on_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            width: 6,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Currency',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: custom_widgets.CurrencyPickerCustom(
                        width: double.infinity,
                        height: 50,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PROPOSE_PASSENGER_PICKUP_CANCEL_BTN_ON_T');
                              logFirebaseEvent('Button_Navigate-Back');
                              Navigator.pop(context);
                            },
                            text: 'Cancel',
                            icon: Icon(
                              Icons.cancel_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              elevation: 8,
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PROPOSE_PASSENGER_PICKUP_PROCEED_BTN_ON_');
                              if (FFAppState().chosenVehicle != null) {
                                if (textController1!.text != null &&
                                    textController1!.text != '') {
                                  if (functions.isIntGreaterThanZero(
                                      functions.stringNumbertoInt(
                                          textController1!.text))) {
                                    if (textController2!.text != null &&
                                        textController2!.text != '') {
                                      if (functions.isDoubleGreaterThanZero(
                                          functions.stringNumbertoDouble(
                                              textController2!.text))) {
                                        logFirebaseEvent('Button_Backend-Call');

                                        final pickupRequestsCreateData =
                                            createPickupRequestsRecordData(
                                          driver: currentUserReference,
                                          vehicle: FFAppState().chosenVehicle,
                                          availableSeats:
                                              int.parse(textController1!.text),
                                          pricePerSeat: double.parse(
                                              textController2!.text),
                                          currency: FFAppState().pickedCurrency,
                                        );
                                        await PickupRequestsRecord.createDoc(
                                                widget.passengerHail!.reference)
                                            .set(pickupRequestsCreateData);
                                        logFirebaseEvent(
                                            'Button_Trigger-Push-Notification');
                                        triggerPushNotification(
                                          notificationTitle:
                                              'New Pickup Request',
                                          notificationText:
                                              '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.displaySurname, '')} has request to pick you up from your trip from ${widget.passengerHail!.origin} to ${widget.passengerHail!.destination} on ${dateTimeFormat(
                                            'MMMEd',
                                            widget.passengerHail!
                                                .departureDatetime,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}, ${dateTimeFormat(
                                            'jm',
                                            widget.passengerHail!
                                                .departureDatetime,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}.',
                                          notificationSound: 'default',
                                          userRefs: [
                                            widget.passengerHail!
                                                .hailingPassenger!
                                          ],
                                          initialPageName:
                                              'accept_drivers_details_page',
                                          parameterData: {
                                            'hailDoc': widget.passengerHail,
                                          },
                                        );
                                        logFirebaseEvent('Button_Alert-Dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Pickup Request.'),
                                              content: Text(
                                                  'Your request has been sent successfully. '),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Continue'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        logFirebaseEvent(
                                            'Button_Navigate-Back');
                                        Navigator.pop(context);
                                        return;
                                      } else {
                                        logFirebaseEvent('Button_Alert-Dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Correct Seat Price'),
                                              content: Text(
                                                  'Please correctly input the price per seat for your commute.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Continue'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        return;
                                      }
                                    } else {
                                      logFirebaseEvent('Button_Alert-Dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Missing Commute Seat Price'),
                                            content: Text(
                                                'Please input your price per seat on this commute.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Continue'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      return;
                                    }
                                  } else {
                                    logFirebaseEvent('Button_Alert-Dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              Text('Correct Seat Number Info'),
                                          content: Text(
                                              'Please correctly input the number of passenger seats available for sale on your commute. '),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Continue'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    return;
                                  }
                                } else {
                                  logFirebaseEvent('Button_Alert-Dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title:
                                            Text('Missing Commute Information'),
                                        content: Text(
                                            'Please input the number of available passenger seats for your commute.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Continue'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                              } else {
                                logFirebaseEvent('Button_Alert-Dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Missing Commute Vehicle'),
                                      content: Text(
                                          'Please select a vehicle for your commute.'),
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
                            text: 'Proceed',
                            icon: Icon(
                              Icons.check_circle_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              elevation: 8,
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
