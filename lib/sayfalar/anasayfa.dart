import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttervize/sayfalar/hesapla.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa>
    with SingleTickerProviderStateMixin {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();
  TabController tabController;

  var birinciAralik;
  var ikinciAralik;
  var ucuncuAralik;

  List<Widget> tabs = [
    Tab(
      icon: Icon(Icons.looks_one),
    ),
    Tab(
      icon: Icon(Icons.looks_two),
    ),
    Tab(
      icon: Icon(Icons.looks_3),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> sayfalar = [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("D-C İçin Kullanılacak Not Aralığını Giriniz :"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller1,
                  onChanged: (value) {
                    birinciAralik = int.parse(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "1.Not Aralığını Giriniz."),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("C-B İçin Kullanılacak Not Aralığını Giriniz :"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller2,
                  onChanged: (value) {
                    ikinciAralik = int.parse(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "2.Not Aralığını Giriniz."),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("B-A İçin Kullanılacak Not Aralığını Giriniz :"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller3,
                  onChanged: (value) {
                    ucuncuAralik = int.parse(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "3.Not Aralığını Giriniz."),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    child: Text("Kaydet ve İkinci Sayfaya Geç"),
                    onPressed: gonder,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
        ),
        title: Text("Sınav Not Aralıkları"),
      ),
      body: TabBarView(controller: tabController, children: sayfalar),
    );
  }

  void gonder() {
    if (birinciAralik == null || ikinciAralik == null || ucuncuAralik == null) {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            title: Text("Uyarı"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Lütfen alanları boş bırakmayın"),
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
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Hesapla(
                    birinciAralik: birinciAralik,
                    ikinciAralik: ikinciAralik,
                    ucuncuAralik: ucuncuAralik,
                  )));
    }
  }
}
