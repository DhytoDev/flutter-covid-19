import 'package:core/error.dart';
import 'package:http/http.dart' as http;

extension HttpGet on String {
  Future<String> httpGet() async {

    final response = await http.get(this);

    if(response.statusCode == 200) {
      return response.body;
    } else {
      throw NetworkException();
    }
  }
}