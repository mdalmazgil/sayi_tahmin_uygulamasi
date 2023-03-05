import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayi_tahmin_uygulamasi/SonucEkrani.dart';
import 'dart:math';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101); // 0 - 100
    print("Rastgele Sayı : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hak: $kalanHak", style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
            ),
            Text(
              "Yardım : $yonlendirme", style: TextStyle(color: Colors.black54, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: tfTahmin, // controller textField içerisine girilen bilgiyi bize iletmektedir.
                keyboardType: TextInputType.number, // klavyenin sayı klavyesi olmasını sağlıyoruz.
                textAlign: TextAlign.center, // yazdığımız verinin ortada gözükmesini sağlıyoruz.
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( // Butona bir sizedbox ekleyerek boyutlarını düzenliyoruz.
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom( // buton renklendirmesi için buton içerisinde çalşıyoruz.
                  backgroundColor: Colors.orangeAccent,
                ),
                child: Text(
                  "TAHMİN ET",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){

                  setState(() {
                    kalanHak = kalanHak - 1;
                  });

                  int tahmin = int.parse(tfTahmin.text);

                  if(tahmin == rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true,)));
                    return; // butonun çalışmasını durdurmaktadır
                  }

                  if(tahmin > rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Azalt";
                    });
                  }

                  if(tahmin < rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Arttır";
                    });
                  }

                  if(kalanHak == 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false,)));
                  }

                  tfTahmin.text = "";

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
