import 'package:flutter/material.dart';
import 'package:taks_two/login.dart';
import 'formpemain.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Logo bagian kiri appbar
            Image.asset('assets/Persib_logo.png', height: 40),
            Text(
              'Home Page',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Icon(Icons.settings, color: Colors.white),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to Persib Official",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              //Logo ditengah halaman
              Image.asset('assets/Persib_logo.png', height: 200),
              SizedBox(height: 10),
              Text(
                "Selamat datang para bakat-bakat muda yang akan bergabung bersama Persib Bandung. Ayo tunjukkan kemampuan terbaikmu dan jadilah bagian dari sejarah besar Persib!",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "Bersama kita bisa membawa Persib Bandung meraih prestasi gemilang di kancah sepak bola nasional maupun internasional. Ayo bergabung dan jadilah bagian dari keluarga besar Persib Bandung!",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //Icon halaman utama
                children: [
                  Column(
                    children: [
                      Icon(Icons.person, size: 40, color: Colors.blue),
                      SizedBox(height: 5),
                      Text("Player", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.timer, size: 40, color: Colors.blue),
                      SizedBox(height: 5),
                      Text("Jadwal", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.bar_chart, size: 40, color: Colors.blue),
                      SizedBox(height: 5),
                      Text("Klasmen", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.shop, size: 40, color: Colors.blue),
                      SizedBox(height: 5),
                      Text("Merchandise", style: TextStyle(fontSize: 14)),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormPage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline),
                      SizedBox(width: 8),
                      Text('Tambah Pemain'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
