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
              child: Text("Go to Create Worksheet"),
              ),

              CustomBotton(
              onPressed: () {
                Navigator.pushNamed(context, "/deletescreen",);
              },
              child: const Text("Go to Delete Worksheet"),
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

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cell updated with "New Value"'),
                    ),
                  );
              },
              child: isUpdating ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                  : const Text("Press"),
              ),

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
