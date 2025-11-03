import 'package:flutter/material.dart';
import 'detail.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final posisiController = TextEditingController();
  final nomerController = TextEditingController();
  final negaraController = TextEditingController();
  final umurController = TextEditingController();
  final tinggiController = TextEditingController();
  String genderController = "Pria";
  int? _selectedGender = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Pemain")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    //Form nama pemain
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: namaController,
                    decoration: InputDecoration(
                      labelText: "Nama Pemain",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong masukan nama pemain.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    //Form posisi pemain
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: posisiController,
                    decoration: InputDecoration(
                      labelText: "Posisi",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Posisi pemain.';
                      }
                      if (![
                        'Penyerang',
                        'Gelandang',
                        'Bek',
                        'Penjaga Gawang',
                      ].contains(value)) {
                        return 'Please enter valid position: Penyerang, Gelandang, Bek, Penjaga Gawang';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    //form nomer punggung pemain
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: nomerController,
                    decoration: InputDecoration(
                      labelText: "Nomer Punggung",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong masukan no punggung pemain.';
                      }
                      final parsed = int.tryParse(value);
                      if (parsed == null) {
                        return 'Please enter a valid number.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    //form umur pemain
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: umurController,
                    decoration: InputDecoration(
                      labelText: "Umur",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Maukan umur peamin.';
                      }
                      final parsed = int.tryParse(value);
                      if (parsed == null) {
                        return 'Hanya gunakan angka.';
                      }
                      if (parsed < 10 || parsed > 50) {
                        return 'Umur anatara 20 - 50 tahun.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    //form tinggi badan pemain
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: tinggiController,
                    decoration: InputDecoration(
                      labelText: "Tinggi Badan (cm)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong masukan tinggi badan pemain.';
                      }
                      final parsed = int.tryParse(value);
                      if (parsed == null) {
                        return 'Hanya gunakan angka.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    //form negara asal pemain
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: negaraController,
                    decoration: InputDecoration(
                      labelText: "Negara Asal",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong masukan negara asal pemain.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Jenis Kelamin: ",
                    textAlign: TextAlign.start,
                  ), // Pilihan jenis kelamin
                  Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Expanded(
                            child: Row(
                              children: [
                                Radio<int>(
                                  value: 1,
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      genderController = 'Pria';
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                                Text("Pria"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio<int>(
                                  value: 2,
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      genderController = 'Wanita';
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                                Text("Wanita"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                nama: namaController.text,
                                posisi: posisiController.text,
                                nomer: int.parse(nomerController.text),
                                negara: negaraController.text,
                                umur: int.parse(umurController.text),
                                tinggi: double.parse(tinggiController.text),
                                gender: genderController,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text("Kirim Data"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
