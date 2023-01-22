// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!

class DiallingCode extends StatefulWidget {
  const DiallingCode({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _DiallingCodeState createState() => _DiallingCodeState();
}

class _DiallingCodeState extends State<DiallingCode> {
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('27');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openCountryPickerDialog,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: _buildDialogItemSelected(_selectedDialogCountry),
        ),
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          const SizedBox(width: 8.0),
          Flexible(child: Text(country.name ?? ''))
        ],
      );

  Widget _buildDialogItemSelected(Country country) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
        ],
      );

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.black),
            child: CountryPickerDialog(
                titlePadding: const EdgeInsets.all(8.0),
                searchCursorColor: Colors.black87,
                searchInputDecoration:
                    const InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: const Text('Select your phone code'),
                onValuePicked: (Country country) {
                  setState(() {
                    _selectedDialogCountry = country;
                    FFAppState().countryDiallingCode =
                        '+' + country.phoneCode.toString();
                  });
                },
                itemBuilder: _buildDialogItem)),
      );
}
