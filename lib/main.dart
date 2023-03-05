import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/TahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //
          children: [
            Text(
                "Tahmin Oyunu", style: TextStyle(color: Colors.black54, fontSize: 36),
            ),
            Image.asset(
                "resimler/zar_resim.png"
            ),
            SizedBox( // Butona bir sizedbox ekleyerek boyutlarını düzenliyoruz.
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom( // buton renklendirmesi için buton içerisinde çalşıyoruz.
                 backgroundColor: Colors.blue,
                ),
                child: Text(
                  "OYUN BAŞLA",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TahminEkrani()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
