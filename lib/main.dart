import 'package:data_entry_app/sheet_home.dart';
import 'package:flutter/material.dart';

import 'ui.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final googleSheetsApi = GoogleSheetsApi();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Google Sheets Data Entry App'),
      ),
      body: MyUI(googleSheetsApi: googleSheetsApi),
    ),
  );
  }
}

