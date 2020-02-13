import 'package:flutter/material.dart';
import 'package:oboete_app/data/query_data.dart';
import 'package:oboete_app/screens/search_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchPage(),
      ),
    );
  }
}
