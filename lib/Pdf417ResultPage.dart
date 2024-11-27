import 'package:flutter/material.dart';
import 'package:mlkit/personData.dart';

class Pdf417ResultPage extends StatelessWidget {
  final PersonData person;

  const Pdf417ResultPage({super.key, required this.person});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Colombian ID Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Table(
            border: TableBorder.all(color: Colors.black, width: 1),
            children: [
              _buildTableRow('AFIS Code', person.afisCode),
              _buildTableRow('Finger Card', person.fingerCard),
              _buildTableRow('Document Number', person.documentNumber),
              _buildTableRow('Last Name', person.lastName),
              _buildTableRow('Second Last Name', person.secondLastName),
              _buildTableRow('First Name', person.firstName),
              _buildTableRow('Middle Name', person.middleName),
              _buildTableRow('Gender', person.gender),
              _buildTableRow('Birthday Year', person.birthdayYear),
              _buildTableRow('Birthday Month', person.birthdayMonth),
              _buildTableRow('Birthday Day', person.birthdayDay),
              _buildTableRow('Municipality Code', person.municipalityCode),
              _buildTableRow('Department Code', person.departmentCode),
              _buildTableRow('Blood Type', person.bloodType),
            ],
          ),
        ),
      ),
    );
  }
}
TableRow _buildTableRow(String field, String value) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          field,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(value),
      ),
    ],
  );
}
