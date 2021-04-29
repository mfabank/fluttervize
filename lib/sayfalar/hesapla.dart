import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Hesapla extends StatefulWidget {
  var birinciAralik;
  var ikinciAralik;
  var ucuncuAralik;
  Hesapla({this.birinciAralik, this.ikinciAralik, this.ucuncuAralik});
  @override
  _HesaplaState createState() => _HesaplaState();
}

class _HesaplaState extends State<Hesapla> {
  String sonuc;
  var sonNot;
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Hesapla"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("İlgili Ders Notunu Giriniz :"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller,
                  onChanged: (value) {
                    sonNot = int.parse(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Notunuzu Giriniz"),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    child: Text("Not Hesapla"),
                    onPressed: kontrol,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void kontrol() {
    if (widget.birinciAralik < 0 || widget.birinciAralik > 100) {
      sonuc = "Girdiğiniz Değer Aralıklarını Kontrol Edin !";
      controller.clear();
    } else if (widget.ikinciAralik < 0 || widget.ikinciAralik > 100) {
      sonuc = "Girdiğiniz Değer Aralıklarını Kontrol Edin !";
      controller.clear();
    } else if (widget.ucuncuAralik < 0 || widget.ucuncuAralik > 100) {
      sonuc = "Girdiğiniz Değer Aralıklarını Kontrol Edin !";
      controller.clear();
    } else if (sonNot < 0 || sonNot > 100) {
      sonuc = "Lütfen Doğru Bir Aralık Girin";
    } else if (sonNot <= widget.birinciAralik) {
      sonuc = "D";
    } else if (sonNot <= widget.ikinciAralik &&
        sonNot >= widget.birinciAralik) {
      sonuc = "C";
    } else if (sonNot <= widget.ucuncuAralik && sonNot >= widget.ikinciAralik) {
      sonuc = "B";
    } else if (sonNot >= widget.ucuncuAralik) {
      sonuc = "A";
    } else {
      sonuc = "Sayı girişi Yapmadınız";
    }

    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          title: Text("Notunuz : " + sonNot.toString()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Almış Olduğunuz Sonuç"),
                Text(sonuc),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
