import 'package:flutter/material.dart';
import 'costomer.dart';

void main() {
  runApp(PelangganApp());
}

class PelangganApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PelangganForm(),
    );
  }
}

class PelangganForm extends StatefulWidget {
  @override
  _PelangganFormState createState() => _PelangganFormState();
}

class _PelangganFormState extends State<PelangganForm> {
  final _formKey = GlobalKey<FormState>();

  String kodePelanggan = '';
  String namaPelanggan = '';
  String jenisPelanggan = 'VIP'; // Nilai default
  TimeOfDay jamMasuk = TimeOfDay.now();
  TimeOfDay jamKeluar = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Pelanggan Warnet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Kode Pelanggan'),
                onChanged: (value) {
                  setState(() {
                    kodePelanggan = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Pelanggan'),
                onChanged: (value) {
                  setState(() {
                    namaPelanggan = value;
                  });
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Jenis Pelanggan'),
                value: jenisPelanggan,
                onChanged: (value) {
                  setState(() {
                    jenisPelanggan = value as String;
                  });
                },
                items: ['VIP', 'GOLD'].map((String type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Pilih jam masuk dan keluar
                  final TimeOfDay? pickedMasuk = await showTimePicker(
                    context: context,
                    initialTime: jamMasuk,
                  );

                  if (pickedMasuk != null && pickedMasuk != jamMasuk) {
                    setState(() {
                      jamMasuk = pickedMasuk;
                    });
                  }

                  final TimeOfDay? pickedKeluar = await showTimePicker(
                    context: context,
                    initialTime: jamKeluar,
                  );

                  if (pickedKeluar != null && pickedKeluar != jamKeluar) {
                    setState(() {
                      jamKeluar = pickedKeluar;
                    });
                  }

                  // Hitung total bayar
                  if (pickedMasuk != null && pickedKeluar != null) {
                    _calculateTotal();
                  }
                },
                child: Text('Hitung Total Bayar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateTotal() {
    // Ubah TimeOfDay ke DateTime untuk perhitungan selisih jam
    DateTime now = DateTime.now();
    DateTime masuk = DateTime(
      now.year,
      now.month,
      now.day,
      jamMasuk.hour,
      jamMasuk.minute,
    );
    DateTime keluar = DateTime(
      now.year,
      now.month,
      now.day,
      jamKeluar.hour,
      jamKeluar.minute,
    );

    final customer = Customer(
      kodePelanggan: kodePelanggan,
      namaPelanggan: namaPelanggan,
      jenisPelanggan: jenisPelanggan,
      jamMasuk: masuk,
      jamKeluar: keluar,
    );

    final totalBayar = customer.totalBayar;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Total Bayar"),
        content: Text("Total Bayar untuk $namaPelanggan adalah Rp. ${totalBayar.toStringAsFixed(0)}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
