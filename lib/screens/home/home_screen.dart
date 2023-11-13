// ui.dart
import 'package:data_entry_app/sheet_home.dart';
import 'package:data_entry_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class HomeScreen extends StatefulWidget {
  final GoogleSheetsApi googleSheetsApi;
  final String sheetTitle;
  HomeScreen({required this.googleSheetsApi, Key? key, required this.sheetTitle});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController selectcontroller = TextEditingController();
  bool isUpdating = false;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              CustomBotton(
              onPressed: () {
                Navigator.pushNamed(context, "/createscreen",);
              },
              buttonText: "Go to Create Worksheet"
              ),

              CustomBotton(
              onPressed: () {
                Navigator.pushNamed(context, "/deletescreen",);
              },
              buttonText: "Go to Delete Worksheet"
              ),
              

              CustomBotton(
              onPressed: () async{
                setState(() {
                  isUpdating = true;
                });
                await widget.googleSheetsApi.updateSheetName('Worksheet1', 1, 1, '=SheetNames()');
                setState(() {
                  isUpdating = false;
                 });
                Navigator.pushNamed(context, "/updatescreen",);
              },
              buttonText: "Go to Update Worksheet"
              ),



              // ElevatedButton(
              //   onPressed: () async {
              //     await googleSheetsApi.updateSheetName('Worksheet1', 1, 1, '=SheetNames()');
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text('Cell updated with "New Value"'),
              //       ),
              //     );
              //   },
              //   child: Text('Update Cell'),
              // ),



              






              
              // Text(
              //   'Spreadsheet Name: ${googleSheetsApi.getSpreadsheetName(sheetTitle)}',
              //   style: TextStyle(fontSize: 16),
              // ),

              

              // FutureBuilder<String>(
              //   future: googleSheetsApi.getSpreadsheetName(sheetTitle),
              //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator(); // Display a loading indicator while fetching data.
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       return Text(
              //         'Spreadsheet Name: $sheetTitle',
              //         style: TextStyle(fontSize: 16),
              //       );
              //     }
              //   },
              // ),


              // FutureBuilder<String>(
              //   future: googleSheetsApi.getSpreadsheetName(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator(); // Display a loading indicator while fetching data.
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       return Text(
              //         'Spreadsheet Name: ${snapshot.data}',
              //         style: TextStyle(fontSize: 16),
              //       );
              //     }
              //   },
              // ),

              // TextField(
              //   controller: selectcontroller,
              //   decoration: const InputDecoration(
              //     labelText: 'Enter Worksheet Name',
              //   ),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     String worksheetSelect = selectcontroller.text;
              //     if (worksheetSelect.isNotEmpty) {
              //       await googleSheetsApi.init(worksheetSelect);
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           content: Text('Worksheet selected: $worksheetSelect'),
              //         ),
              //       );
              //     }
              //     selectcontroller.clear();
              //   },
              //   child: const Text('Google Sheet Selected'),
              // ),



            ],
          ),
        );
  }
}
