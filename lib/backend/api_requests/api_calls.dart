import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CountryAPICall {
  static Future<ApiCallResponse> call({
    String? latlnginput = '-26.569874, 31.487493',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CountryAPICall',
        'variables': {
          'latlnginput': latlnginput,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic countryPath(dynamic response) => getJsonField(
        response,
        r'''$["results"][0]["address_components"][0]["long_name"]''',
      );
}
