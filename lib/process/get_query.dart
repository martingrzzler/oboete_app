import 'dart:convert';

import 'package:http/http.dart' as http;

const url = 'https://jisho.org/api/v1/search/words?keyword=';

class QueryHandler {
  Future getQueryData(String query) async {
    http.Response response = await http.get('${url + query}');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
