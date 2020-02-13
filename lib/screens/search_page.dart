import 'package:flutter/material.dart';
import 'package:oboete_app/data/query_data.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  String query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Image.asset(
          'images/logo-heading.png',
          height: 40.0,
        ),
      ),
      body: Consumer<QueryData>(
        builder: (context, queryData, child) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  onChanged: (value) {
                    query = value;
                  },
                  onSubmitted: (value) async {
                    query = value;
                    bool success = await queryData.updateQueryData(query);
                    if (!success) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Sorry, Couldn\'t find that...'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    hintText: 'Search any word in Kana, Romaji or Kanji...',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.blueGrey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(queryData.word),
                  Text(queryData.reading),
                  Text(queryData.meaning)
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
