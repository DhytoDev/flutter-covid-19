import 'dart:convert';

import 'package:data/network/endpoints.dart';
import 'package:data/network/model/cases_response.dart';
import 'package:data/network/http_extensions.dart';

abstract class CasesNetworkDataSource {
  Future<CasesResponse> getCovid19GlobalCases();
}

class CasesNetworkDataSourceImpl implements CasesNetworkDataSource {
  CasesNetworkDataSourceImpl();

  @override
  Future<CasesResponse> getCovid19GlobalCases() async {
    final String url = EndPoints.COVID_BASE_URL;

    final jsonString = await url.httpGet().then(json.decode);

    return CasesResponse.fromJson(jsonString);
  }
}
