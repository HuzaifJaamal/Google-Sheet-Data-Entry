// ui.dart
import 'package:data_entry_app/sheet_home.dart';
import 'package:data_entry_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final GoogleSheetsApi googleSheetsApi;
  final TextEditingController selectcontroller = TextEditingController();

  HomeScreen({required this.googleSheetsApi, Key? key});

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
              onPressed: () {
                Navigator.pushNamed(context, "/updatescreen",);
              },
              buttonText: "Go to Update Worksheet"
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
