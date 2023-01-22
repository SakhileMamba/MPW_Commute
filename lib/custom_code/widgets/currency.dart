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
import 'package:country_currency_pickers/currency_picker_dialog.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:country_currency_pickers/utils/utils.dart';

class Currency extends StatefulWidget {
  const Currency({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  CurrencyState createState() => CurrencyState();
}

class CurrencyState extends State<Currency> {
  Country selectedDialogCurrency =
      CountryPickerUtils.getCountryByCurrencyCode('ZAR');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openCurrencyPickerDialog,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: _currencyItem(selectedDialogCurrency),
        ),
      ),
    );
  }

  Widget _buildCurrencyDialogItem(Country country) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("${country.currencyCode}"),
          const SizedBox(width: 8.0),
          Flexible(child: Text(country.name ?? ''))
        ],
      );

  Widget _currencyItem(Country country) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("${country.currencyCode}"),
        ],
      );

  void _openCurrencyPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.black),
            child: CurrencyPickerDialog(
                titlePadding: const EdgeInsets.all(8.0),
                searchCursorColor: Colors.black87,
                searchInputDecoration:
                    const InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: const Text('Select your Currency'),
                onValuePicked: (Country country) => setState(() {
                      selectedDialogCurrency = country;
                      FFAppState().pickedCurrency =
                          country.currencyCode.toString();
                    }),
                itemBuilder: _buildCurrencyDialogItem)),
      );
}
