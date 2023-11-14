import 'package:data_entry_app/sheet_home.dart';
import 'package:data_entry_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DeleteSheet extends StatefulWidget {
  final GoogleSheetsApi googleSheetsApi;

  DeleteSheet({required this.googleSheetsApi, Key? key}) :super(key: key);

  @override
  State<DeleteSheet> createState() => _DeleteSheetState();
}

class _DeleteSheetState extends State<DeleteSheet> {
  // final TextEditingController deletecontroller = TextEditingController();
  final TextEditingController selectcontroller = TextEditingController();
  // String selectedSheet = '';
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text(
          "Delete Sheet"
        ),
      ),
      body: Center(
        child: Column(
          children: [
             




            TextField(
                controller: selectcontroller,
                decoration: const InputDecoration(
                  labelText: 'Enter Worksheet Name to be Deleted',
                ),
              ),
                CustomBotton(
                  child: Text("Delete Sheet"),
                  // buttonText: "Delete Sheet",
                  onPressed: () async {
                    String worksheetSelect = selectcontroller.text;
                    // String sheetTitle = deletecontroller.text;
                     String sheetTitle = worksheetSelect; 
                  if (sheetTitle.isNotEmpty) {
                    await widget.googleSheetsApi.init(worksheetSelect);
                    await widget.googleSheetsApi.deleteSheet(sheetTitle);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sheet deleted: $sheetTitle'),
                      ),
                    );
                  }
                  selectcontroller.clear();
                  },
                  ),
          ],
        ),
        ),

    );
  }
}