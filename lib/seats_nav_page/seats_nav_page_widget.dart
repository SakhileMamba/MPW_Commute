import '../components/commute_card_widget.dart';
import '../components/commutes_filter_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SeatsNavPageWidget extends StatefulWidget {
  const SeatsNavPageWidget({Key? key}) : super(key: key);

  @override
  _SeatsNavPageWidgetState createState() => _SeatsNavPageWidgetState();
}

class _SeatsNavPageWidgetState extends State<SeatsNavPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Seats_Nav_Page'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Browse Commutes',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryBackground,
                fontSize: 18,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.filter_list_rounded,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('SEATS_NAV_filter_list_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_Bottom-Sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: CommutesFilterWidget(),
                    ),
                  );
                },
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              CommuteCardWidget(),
              CommuteCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
