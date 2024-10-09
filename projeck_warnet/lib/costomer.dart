class Customer {
  String kodePelanggan;
  String namaPelanggan;
  String jenisPelanggan;
  DateTime jamMasuk;
  DateTime jamKeluar;
  final int tarifPerJam = 10000;

  Customer({
    required this.kodePelanggan,
    required this.namaPelanggan,
    required this.jenisPelanggan,
    required this.jamMasuk,
    required this.jamKeluar,
  });

  // Hitung lama waktu dalam jam
  int get lama {
    return jamKeluar.difference(jamMasuk).inHours;
  }

  // Hitung diskon berdasarkan jenis pelanggan
  double get diskon {
    if (lama > 2) {
      if (jenisPelanggan == "VIP") {
        return 0.02; // 2% diskon
      } else if (jenisPelanggan == "GOLD") {
        return 0.05; // 5% diskon
      }
    }
    return 0.0;
  }

  // Hitung total bayar
  double get totalBayar {
    double tarif = (lama * tarifPerJam) as double;
    double discountAmount = tarif * diskon;
    return tarif - discountAmount;
    
  }
}
