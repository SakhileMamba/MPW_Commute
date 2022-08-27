import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateCommutePageWidget extends StatefulWidget {
  const CreateCommutePageWidget({Key? key}) : super(key: key);

  @override
  _CreateCommutePageWidgetState createState() =>
      _CreateCommutePageWidgetState();
}

class _CreateCommutePageWidgetState extends State<CreateCommutePageWidget> {
  DateTime? datePicked;
  var placePickerValue1 = FFPlace();
  var placePickerValue2 = FFPlace();
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'create_commute_page'});
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Schedule Commute',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                      'Origin',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  FlutterFlowPlacePicker(
                    iOSGoogleMapsApiKey:
                        'AIzaSyBv2c71scP8DWTtc-zAmpCniS3HgVP8vFM',
                    androidGoogleMapsApiKey:
                        'AIzaSyCDdREB-y1l84iC_QLbgPNlVDPeK7euRsg',
                    webGoogleMapsApiKey:
                        'AIzaSyAqMpvumo1SHrdsD9moyulPYRxC5O58XCg',
                    onSelect: (place) async {
                      setState(() => placePickerValue1 = place);
                    },
                    defaultText: 'Please select',
                    icon: Icon(
                      Icons.trip_origin_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                    buttonOptions: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Divider(
                    height: 16,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Destination',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  FlutterFlowPlacePicker(
                    iOSGoogleMapsApiKey:
                        'AIzaSyBv2c71scP8DWTtc-zAmpCniS3HgVP8vFM',
                    androidGoogleMapsApiKey:
                        'AIzaSyCDdREB-y1l84iC_QLbgPNlVDPeK7euRsg',
                    webGoogleMapsApiKey:
                        'AIzaSyAqMpvumo1SHrdsD9moyulPYRxC5O58XCg',
                    onSelect: (place) async {
                      setState(() => placePickerValue2 = place);
                    },
                    defaultText: 'Please select',
                    icon: Icon(
                      Icons.location_pin,
                      color: Colors.white,
                      size: 24,
                    ),
                    buttonOptions: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Divider(
                    height: 16,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Departure Date & Time',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'CREATE_COMMUTE_Container_e8l72gjy_ON_TAP');
                      logFirebaseEvent('Container_Date-Time-Picker');
                      await DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() => datePicked = date);
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

                      logFirebaseEvent('Container_Update-Local-State');
                      setState(() => FFAppState().scheduleDepartureDatetime =
                          dateTimeFormat('d/M h:mm a', datePicked));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    FFAppState().scheduleDepartureDatetime,
                                    'Please input date',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.access_time_rounded,
                              color: Colors.black,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 16,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Vehicle(s)',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  StreamBuilder<List<VehiclesRecord>>(
                    stream: queryVehiclesRecord(
                      parent: currentUserReference,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitChasingDots(
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                          children: List.generate(rowVehiclesRecordList.length,
                              (rowIndex) {
                            final rowVehiclesRecord =
                                rowVehiclesRecordList[rowIndex];
                            return InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'CREATE_COMMUTE_Container_j9vh5nh3_ON_TAP');
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
                            );
                          }),
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 16,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Available Seats',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  Container(
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
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              suffixIcon: Icon(
                                Icons.airline_seat_recline_normal_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 16,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Price/Seat',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  Container(
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
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              suffixIcon: Icon(
                                Icons.monetization_on_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 16,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                    child: Text(
                      'Currency',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: custom_widgets.CurrencyPickerCustom(
                      width: double.infinity,
                      height: 50,
                    ),
                  ),
                  Divider(
                    height: 16,
                    color: FlutterFlowTheme.of(context).primaryBackground,
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
                                  'CREATE_COMMUTE_CANCEL_BTN_ON_TAP');
                              logFirebaseEvent('Button_Navigate-Back');
                              Navigator.pop(context);
                            },
                            text: 'Cancel',
                            icon: Icon(
                              Icons.cancel_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.black,
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
                                  'CREATE_COMMUTE_PROCEED_BTN_ON_TAP');
                              if (placePickerValue1 != null) {
                                if (placePickerValue2 != null) {
                                  if (datePicked != null) {
                                    if (FFAppState().chosenVehicle != null) {
                                      if (textController1!.text != null &&
                                          textController1!.text != '') {
                                        if (functions.isIntGreaterThanZero(
                                            functions.stringNumbertoInt(
                                                textController1!.text))) {
                                          if (textController2!.text != null &&
                                              textController2!.text != '') {
                                            if (!functions
                                                .isDoubleGreaterThanZero(
                                                    functions
                                                        .stringNumbertoDouble(
                                                            textController2!
                                                                .text))) {
                                              logFirebaseEvent(
                                                  'Button_Alert-Dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Correct Seat Price'),
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
                                            logFirebaseEvent(
                                                'Button_Alert-Dialog');
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
                                          logFirebaseEvent(
                                              'Button_Alert-Dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Correct Seat Number Info'),
                                                content: Text(
                                                    'Please correctly input the number of passenger seats available for sale on your commute. '),
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
                                                  'Missing Commute Information'),
                                              content: Text(
                                                  'Please input the number of available passenger seats for your commute.'),
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
                                            title:
                                                Text('Missing Commute Vehicle'),
                                            content: Text(
                                                'Please select a vehicle for your commute.'),
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
                                          title: Text(
                                              'Missing Commute Date and Time'),
                                          content: Text(
                                              'Please select your commute\'s daparture date and time'),
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
                                            Text('Missing Commute Destination'),
                                        content: Text(
                                            'Please select your commute\'s destination physical address.'),
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
                                      title: Text('Missing Commute Origin'),
                                      content: Text(
                                          'Please select your commute\'s origin physical address.'),
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

                              logFirebaseEvent('Button_Backend-Call');

                              final commutesCreateData =
                                  createCommutesRecordData(
                                origin: placePickerValue1.address,
                                destination: placePickerValue2.address,
                                availablePassengerSeats:
                                    int.parse(textController1!.text),
                                pricePerSeat:
                                    double.parse(textController2!.text),
                                driver: currentUserReference,
                                vehicle: FFAppState().chosenVehicle,
                                departureDatetime: datePicked,
                                driversRating: valueOrDefault(
                                    currentUserDocument?.rating, 0.0),
                                currency: FFAppState().pickedCurrency,
                              );
                              await CommutesRecord.collection
                                  .doc()
                                  .set(commutesCreateData);
                              logFirebaseEvent('Button_Navigate-Back');
                              Navigator.pop(context);
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
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
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
