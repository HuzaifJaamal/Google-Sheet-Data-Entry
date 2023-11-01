import 'package:data_entry_app/sheet_home.dart';
import 'package:flutter/material.dart';

import 'ui.dart';




void main() async {

  final googleSheetsApi = GoogleSheetsApi();
  // await googleSheetsApi.init();
  
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Google Sheets Data Entry App'),
      ),
      body: MyUI(googleSheetsApi: googleSheetsApi),
    ),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
       
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: MyUI(googleSheetsApi: googleSheetsApi),
//     );
//   }
// }

