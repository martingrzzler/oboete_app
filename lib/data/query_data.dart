import 'package:flutter/foundation.dart';
import 'package:oboete_app/process/get_query.dart';

class QueryData extends ChangeNotifier {
  String word = '';
  String meaning = '';
  String reading = '';
  QueryHandler queryHandler = QueryHandler();

  Future<bool> updateQueryData(String query) async {
    var data = await queryHandler.getQueryData(query);
    if (data['data'].length != 0) {
      word = data['data'][0]['japanese'][0]['word'];
      reading = data['data'][0]['japanese'][0]['reading'];
      meaning = data['data'][0]['senses'][0]['english_definitions'][0];
      notifyListeners();
      return true;
    } else
      return false;
  }
}
