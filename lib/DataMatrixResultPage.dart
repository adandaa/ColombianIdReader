import 'package:flutter/material.dart';
import 'package:mlkit/datamatrixData.dart';
import 'package:mlkit/personData.dart';

class DataMatrixResultPage extends StatelessWidget {
  final DatamatrixData data;

  const DataMatrixResultPage({super.key, required this.data});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('DataMatrix Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Table(
            border: TableBorder.all(color: Colors.black, width: 1),
            children: [
              _buildTableRow('GTIN', data.gtin),
              _buildTableRow('Numero de Lote', data.numLot),
              _buildTableRow('Numero de Serie', data.numSerie),
              _buildTableRow('Fecha de Produccion', data.dateProd),
              _buildTableRow('Fecha de Empaquetado', data.datePack),
              _buildTableRow('Fecha de Expiracion', data.dateExpir),
              _buildTableRow('Numero de Orden', data.numOrd),
              _buildTableRow('Numero de Admision', data.numAdm),
              _buildTableRow('Fecha de Admision', data.dateAdm),
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
