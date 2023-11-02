import 'package:data_entry_app/sheet_home.dart';
import 'package:data_entry_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DeleteSheet extends StatelessWidget {
  final GoogleSheetsApi googleSheetsApi;
  final TextEditingController deletecontroller = TextEditingController();
  


  DeleteSheet({super.key, required this.googleSheetsApi});

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
                controller: deletecontroller,
                decoration: const InputDecoration(
                  labelText: 'Enter Worksheet Name to be Deleted',
                ),
              ),
                CustomBotton(
                  buttonText: "Delete Sheet",
                  onPressed: () async {
                    String sheetTitle = deletecontroller.text;
                  if (sheetTitle.isNotEmpty) {
                    await googleSheetsApi.deleteSheet(sheetTitle);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sheet deleted: $sheetTitle'),
                      ),
                    );
                  }
                  deletecontroller.clear();
                  },
                  ),
          ],
        ),
        ),

    );
  }
}