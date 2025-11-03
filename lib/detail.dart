import 'package:flutter/material.dart';
import 'home.dart';

class DetailPage extends StatefulWidget {
  final String nama;
  final String posisi;
  final int nomer;
  final String negara;
  final int umur;
  final double tinggi;
  final String gender;

  const DetailPage({
    super.key,
    required this.nama,
    required this.posisi,
    required this.nomer,
    required this.negara,
    required this.umur,
    required this.tinggi,
    required this.gender,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late double tinggiBadan;

  @override
  void initState() {
    super.initState();
    tinggiBadan = widget.tinggi / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // Menampilkan detail pemain yang diisi dari form sebelumnya
            Text("Nama Pemain: ${widget.nama}"),
            SizedBox(height: 10),
            Text("Posisi: ${widget.posisi}"),
            SizedBox(height: 10),
            Text("Nomer Punggung: ${widget.nomer}"),
            SizedBox(height: 10),
            Text("Umur: ${widget.umur}"),
            SizedBox(height: 10),
            Text("Tinggi Badan (cm): $tinggiBadan Meter."),
            SizedBox(height: 10),
            Text("Negara Asal: ${widget.negara}"),
            SizedBox(height: 10),
            Text("Jenis Kelamin: ${widget.gender}"),

            SizedBox(height: 30),

            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    SizedBox(width: 8),
                    Text("Save Data pemain"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel),
                    SizedBox(width: 8),
                    Text("Kembali"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
