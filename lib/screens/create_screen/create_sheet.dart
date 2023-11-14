import 'package:data_entry_app/sheet_home.dart';
import 'package:data_entry_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  final GoogleSheetsApi googleSheetsApi;
  final TextEditingController createcontroller = TextEditingController();

  CreateScreen({super.key, required this.googleSheetsApi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Sheet"
        ),
      ),
      body: Center(
        child: Column(
          children: [
           TextField(
                controller: createcontroller,
                decoration: const InputDecoration(
                  labelText: 'Enter Worksheet Name',
                  // contentPadding: EdgeInsets.only(left: 40),
                ),
              ),

              CustomBotton(
                onPressed: () async{
                  String worksheetName = createcontroller.text;
                  if (worksheetName.isNotEmpty) {
                    await googleSheetsApi.createWorksheet(worksheetName);
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Worksheet created: $worksheetName'),
                      ),
                    );
                  }
                  createcontroller.clear();
                },
                child: Text("Create Worksheet"),
                // buttonText: "Create Worksheet",
              ),
          ],
        ),
        ),
    );
  }
}