import 'package:data_entry_app/sheet_home.dart';
import 'package:data_entry_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UpdateSheet extends StatelessWidget {
  final GoogleSheetsApi googleSheetsApi;
  final TextEditingController updatecontroller = TextEditingController();

  UpdateSheet({super.key, required this.googleSheetsApi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Sheet"
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
                controller: updatecontroller,
                decoration: const InputDecoration(
                  labelText: 'Enter Worksheet Name',
                ),
              ),
              CustomBotton(
                buttonText: 'Update Google Sheets',
                onPressed: () async{
                  String worksheetCellUpdate = updatecontroller.text;
                  if (worksheetCellUpdate.isNotEmpty) {
                    await googleSheetsApi.updateCell(worksheetCellUpdate, 2, 2);
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cell updated in Google Sheets!'),
                      ),
                    );
                  }
                 updatecontroller.clear();
                },
              ),            
          ],
        ),
      )
    );
  }
}