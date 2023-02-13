import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneAuthenticationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PhoneNumberTextField widget.
  TextEditingController? phoneNumberTextFieldController;
  String? Function(BuildContext, String?)?
      phoneNumberTextFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    phoneNumberTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
