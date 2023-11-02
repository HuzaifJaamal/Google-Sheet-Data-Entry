import 'package:data_entry_app/screens/create_screen/create_sheet.dart';
import 'package:data_entry_app/screens/delete_screen/delete_sheet.dart';
import 'package:data_entry_app/screens/home/home_screen.dart';
import 'package:data_entry_app/screens/update_screen/update_sheet.dart';
import 'package:data_entry_app/sheet_home.dart';
import 'package:flutter/material.dart';



void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final googleSheetsApi = GoogleSheetsApi();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(),

      debugShowCheckedModeBanner: false,

      initialRoute: "/",
      routes:  {
        "/":(context)=>  Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: HomeScreen(googleSheetsApi: googleSheetsApi),
      
    ),
      "/createscreen": (context) => CreateScreen(googleSheetsApi: googleSheetsApi,),

      "/deletescreen": (context) => DeleteSheet(googleSheetsApi: googleSheetsApi,),
      "/updatescreen": (context) => UpdateSheet(googleSheetsApi: googleSheetsApi,),
      },
  );
  }
}

