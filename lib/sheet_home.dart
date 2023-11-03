import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "fluttergsheetsexample",
  "private_key_id": "3f4c45dd52f0bed96115f432c12c42b995abd098",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCmpwjMv07jIHtM\ncj8BBAhgOF/VKbWXkAf88uy6qgECLmL/QZD7/KIN07afcaTHuXWf6jZMQLo+Ecx8\nKdOSnr0fymV2tHrFH9vHcQ1DVqEzTJA2hk0Y1msUDasDkfwncJyUelV/sLGYMezs\nYHY2oKoXLTUmMX+xzJH1pQ5vImLLks/rxWOhrMV33FZD3kSjYbbRBClWIZT7ItlJ\nXLjg4tKVTDIaT9HUkoSxMZqgQlsJBIXm/akKvh0ot2U5ZQTy+ziSNSddaR5NRfF0\nCgAN7kV+ZU2sbQBdAS5bkLNHYGGvKhgkmWfYZ66RgChtTGdzYEmTrsYEDmFvRefU\n9zRfCtWVAgMBAAECggEAIgN1iFSDhVfb0n5+3XY1P25CIP+iUIzVFIuARZjtG8Tb\n770yGjw11xye6WwIdbskhr8G1glf+csoMS9YP1SmxRZKHzA23oTiFpK8YkIMJKw7\nwuUmVytsL2uau9/P1zzkuGk/ihBGLwoBkT0e44dnL9PKRUFVDrTyFXDawVQDVgkL\n38M0bLoy+WItqQVfpShcdWPeAq4SnA0Mrgb9wzIqyifOYmrnRGR0LbOuh6EZpl39\nM+OHgotcMplljuWnn8B+zpt0tOIgZFQ0W4+9BrGDfwoOel72EQ2dvNOqktWhiYSP\ngPRrzuIXfaDnhrJ/82rnNCXXESYMMl1wwovbu+WbAQKBgQDrN7jUswbHBzD9OncD\nYwpFGvNoIFlZA89SBznhzPjMih22TyYIyaEWkQvFOugeTFYVUgu5Ynixsc5Ueb1z\nCQ12UItBmgiNLQyJ5hJ93tLSsXVRXcZuUfzE5d66Gyk9/toQjUCupnCoFl1W/NuW\nwvekpqIFXi87r7Haur0NI8JmXwKBgQC1YHf2ITN5KnJBjLa0zQyyD3m5H4DIojQg\ndm3x1IcnL5J0P6fDPPBY9IOb6pC4TpopMlQDwGhaWu/zziN23Ol/0uv6RgCeedvX\nVFGt2bMjepxvXHrFy0DCrRgb9ReD263d1vcZ5cGe++Tc7hryQpMBbDAPNnZ4kq+N\nGkq42ArAiwKBgQCIUgz+yJre8l4EBMRA5D9peYskB8uAeWLIKYP0R3TSJiG+LPTg\nFusTRxDJR7CLDra9OIWu9VD5uxDXiI6xgseYkGmEpZ7bIwanTP3ekSsiDNLvSyfb\nfAzAmHCS73bhhTgga5zXG4MjB4MlDPq+z1PyytgPwFwjfVnYaG10lgruhQKBgQCv\nXlTe7/8a2kWax3kom1H5IClrKuCUHPEVqixntDvxUXfjWmDUzyj8eX5+1G+VJLq9\ntmGxNuou4to6+0ci+Dn0U3XCiMi0cdJ0Apzu4Rzp4vU6X0p90CYPlNlIvtM7tL4J\nTn2g1ps9IwSH8NixAFmu+HIHY3ts3TdL0O4KhyjuPQKBgDRCDK0DCCTj0Mq7bexy\ncV/dJIwCDxPiANJoI8e4bZ/sOL8CBmyov8iGvEZnrKA/E5xMCnhZmY0FEFTAvYxE\n6tAVC3m6qTKNsCjT2PtUP3MEnpuaCeMQdMelb8UVw7xnkVh0mi3b1vJKTG6JuC05\nfz8Ex/JbOsMf7Q1l7w2a1LBb\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttergsheetsexample@fluttergsheetsexample.iam.gserviceaccount.com",
  "client_id": "117945790907255506319",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttergsheetsexample%40fluttergsheetsexample.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

const _spreadsheetId = '1bt8R1ASBawClyEMDRmqqqoeSiYXP2HlA5DbpfbJW3Lw';

class GoogleSheetsApi {
  final GSheets gsheets;
  Worksheet? sheet;
  

  GoogleSheetsApi() : gsheets = GSheets(_credentials);

  Future<void> init(String worksheetSelect) async {
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    sheet = ss.worksheetByTitle('$worksheetSelect');
  }

  Future<void> updateCell(String value, int column, int row) async {
    if (sheet != null) {
      await sheet!.values.insertValue(value, column: column, row: row);
    }
  }

  Future<void> createWorksheet(String worksheetName) async {
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    ss.addWorksheet(worksheetName.toString());
  }

  

   Future<void> deleteSheet(String sheetTitle) async {
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    final worksheet = ss.worksheetByTitle(sheetTitle);
    if (worksheet != null) {
      await ss.deleteWorksheet(worksheet);
    }
  }
}