class DatamatrixData {
  String gtin;
  String numLot;
  String numSerie;
  String dateProd;
  String datePack;
  String dateExpir;
  String numOrd;
  String numAdm;
  String dateAdm;

  DatamatrixData({
    required this.gtin,
    required this.numLot,
    required this.numSerie,
    required this.dateProd,
    required this.datePack,
    required this.dateExpir,
    required this.numOrd,
    required this.numAdm,
    required this.dateAdm,
  });

  @override
  String toString() {
    return 'PersonData{GTIN: $gtin, No. Lote: $numLot, No. Serie: $numSerie, Fecha Produccion: $dateProd, Fecha Empaque: $datePack, Fecha Expiracion: $dateExpir, No. Orden Medica/Compra: $numOrd, No. Admision: $numAdm, Fecha Admision: $dateAdm}';
  }
}
