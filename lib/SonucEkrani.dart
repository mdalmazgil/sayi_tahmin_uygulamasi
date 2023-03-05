import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  // diğer sayfadan bu sayfaya geldiğimizde çalışan ilk kısım
  bool sonuc;
  SonucEkrani({required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.sonuc ? Colors.green : Colors.red,
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc ? Image.asset("resimler/mutlu_resim.png") : Image.asset("resimler/uzgun_resim.png"),
            Text(
              widget.sonuc ? "Kazandınız" : "Kaybettiniz", style: TextStyle(color: Colors.black54, fontSize: 36),
            ),
            SizedBox( // Butona bir sizedbox ekleyerek boyutlarını düzenliyoruz.
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom( // buton renklendirmesi için buton içerisinde çalşıyoruz.
                  backgroundColor: widget.sonuc ? Colors.green : Colors.red,
                ),
                child: Text(
                  "TEKRAR DENE",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
