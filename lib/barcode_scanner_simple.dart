import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mlkit/personData.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:typed_data';

import 'Pdf417ResultPage.dart';

class BarcodeScannerSimple extends StatefulWidget {
  const BarcodeScannerSimple({super.key});

  @override
  State<BarcodeScannerSimple> createState() => _BarcodeScannerSimpleState();
}

class _BarcodeScannerSimpleState extends State<BarcodeScannerSimple> {
  Barcode? _barcode;

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted && barcodes.barcodes.isNotEmpty) {
      setState(() {
        _barcode = barcodes.barcodes.first;
      });

      // Check if the raw value is null before navigating
      if (_barcode?.rawBytes != null) {
        PersonData scannedPersonData = parsePersonData(_barcode!.rawBytes!);
        printPersonData(scannedPersonData);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Pdf417ResultPage(person: scannedPersonData),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid barcode or missing data')),
        );
      }
    }
  }



  PersonData parsePersonData(Uint8List bytes) {
    String getFieldValue(int start, int end) {
      //return String.fromCharCodes(bytes.sublist(start, end)).trim();

      return String.fromCharCodes(
        bytes.sublist(start, end).map((byte) {
          if (byte >= 32 && byte <= 126) {
            return byte; // Printable ASCII
          }
          return 32; // Replace non-printable characters with a space
        }),
      ).trim();
    }


    return PersonData(
      afisCode: getFieldValue(2, 10),
      fingerCard: getFieldValue(40, 48),
      documentNumber: getFieldValue(48, 58),
      lastName: getFieldValue(58, 80),
      secondLastName: getFieldValue(81, 104),
      firstName: getFieldValue(104, 127),
      middleName: getFieldValue(127, 150),
      gender: getFieldValue(151, 152),
      birthdayYear: getFieldValue(152, 156),
      birthdayMonth: getFieldValue(156, 158),
      birthdayDay: getFieldValue(158, 160),
      municipalityCode: getFieldValue(160, 162),
      departmentCode: getFieldValue(162, 165),
      bloodType: getFieldValue(166, 168),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple scanner')),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            onDetect: _handleBarcode,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Center(child: _buildBarcode(_barcode))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void printPersonData(PersonData person) {
  print("Person Data:");
  print("AFIS Code         : ${person.afisCode}");
  print("Finger Card       : ${person.fingerCard}");
  print("Document Number   : ${person.documentNumber}");
  print("Last Name         : ${person.lastName}");
  print("Second Last Name  : ${person.secondLastName}");
  print("First Name        : ${person.firstName}");
  print("Middle Name       : ${person.middleName}");
  print("Gender            : ${person.gender}");
  print("Birthday Year     : ${person.birthdayYear}");
  print("Birthday Month    : ${person.birthdayMonth}");
  print("Birthday Day      : ${person.birthdayDay}");
  print("Municipality Code : ${person.municipalityCode}");
  print("Department Code   : ${person.departmentCode}");
  print("Blood Type        : ${person.bloodType}");
}