// ui.dart
import 'package:data_entry_app/sheet_home.dart';
import 'package:flutter/material.dart';


class MyUI extends StatelessWidget {
  final GoogleSheetsApi googleSheetsApi;
  final TextEditingController createcontroller = TextEditingController();
  final TextEditingController deletecontroller = TextEditingController();
  final TextEditingController updatecontroller = TextEditingController();
  final TextEditingController selectcontroller = TextEditingController();

  MyUI({required this.googleSheetsApi, Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: createcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter Worksheet Name',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String worksheetName = createcontroller.text;
                  if (worksheetName.isNotEmpty) {
                    await googleSheetsApi.createWorksheet(worksheetName);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Worksheet created: $worksheetName'),
                      ),
                    );
                  }
                },
                child: Text('Create Worksheet'),
              ),
              TextField(
                controller: updatecontroller,
                decoration: InputDecoration(
                  labelText: 'Enter Worksheet Name',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String worksheetCellUpdate = updatecontroller.text;
                  if (worksheetCellUpdate.isNotEmpty) {
                    await googleSheetsApi.updateCell('$worksheetCellUpdate', 2, 2);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Cell updated in Google Sheets!'),
                      ),
                    );
                  }
                  // await googleSheetsApi.updateCell('KOKO2', 1, 1);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text('Cell updated in Google Sheets!'),
                  //   ),
                  // );
                },
                child: Text('Update Google Sheets'),
              ),
              
              TextField(
                controller: selectcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter Worksheet Name',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String worksheetSelect = selectcontroller.text;
                  if (worksheetSelect.isNotEmpty) {
                    await googleSheetsApi.init(worksheetSelect);
                    // await googleSheetsApi.updateCell('$worksheetSelect', 1, 1);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Worksheet selected: $worksheetSelect'),
                      ),
                    );
                  }
                  // await googleSheetsApi.updateCell('KOKO2', 1, 1);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text('Cell updated in Google Sheets!'),
                  //   ),
                  // );
                },
                child: Text('Google Sheet Selected'),
              ),

              TextField(
                controller: deletecontroller,
                decoration: InputDecoration(
                  labelText: 'Enter Worksheet Name to be Deleted',
                ),
              ),

               ElevatedButton(
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
                },
                child: Text('Delete Sheet'),
              ),
            ],
          ),
        );
  }
}
