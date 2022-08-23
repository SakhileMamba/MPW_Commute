// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:country_currency_pickers/country_pickers.dart';

class CurrencyPickerCustom extends StatefulWidget {
  const CurrencyPickerCustom({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CurrencyPickerCustomState createState() => _CurrencyPickerCustomState();
}

class _CurrencyPickerCustomState extends State<CurrencyPickerCustom> {
  Country _selectedDialogCurrency = CountryPickerUtils.getCountryByCurrencyCode(
      FFAppState()?.pickedCurrency ?? 'USD');

  Widget _buildCurrencyDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text(
            "(${country.currencyCode})",
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              country.name ?? '',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
          )
        ],
      );

  void _openCurrencyPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: CurrencyPickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration:
                    const InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: Text(
                  'Select Currency',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
                onValuePicked: (Country country) {
                  setState(() {
                    _selectedDialogCurrency = country;
                  });
                },
                itemBuilder: _buildCurrencyDialogItem)),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: ListTile(
        onTap: _openCurrencyPickerDialog,
        title: _buildCurrencyDialogItem(_selectedDialogCurrency),
      ),
    );
  }
}
