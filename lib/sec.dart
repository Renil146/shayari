import 'package:flutter/material.dart';
import 'package:shayari/list.dart';
import 'package:shayari/third.dart';

class Second extends StatefulWidget {
  int title_ind;
  Second(this.title_ind);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  List Loveshayari = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.title_ind == 0) {
      Loveshayari = list.Intzar_Shayari;
    } else if (widget.title_ind == 1) {
      Loveshayari = list.Udas_Shayari;
    } else if (widget.title_ind == 2) {
      Loveshayari = list.Kitab_Shayari;
    } else if (widget.title_ind == 3) {
      Loveshayari = list.Zindagi_Shayari;
    } else if (widget.title_ind == 4) {
      Loveshayari = list.Zulf_Shayari;
    } else if (widget.title_ind == 5) {
      Loveshayari = list.Dard_Shayari;
    } else if (widget.title_ind == 6) {
      Loveshayari = list.Dil_Shayari;
    } else if (widget.title_ind == 7) {
      Loveshayari = list.Didar_Shayari;
    } else if (widget.title_ind == 8) {
      Loveshayari = list.Duniya_Shayari;
    } else if (widget.title_ind == 9) {
      Loveshayari = list.Dost_Shayari;
    } else if (widget.title_ind == 10) {
      Loveshayari = list.Phole_Shayari;
    } else if (widget.title_ind == 11) {
      Loveshayari = list.Mulakat_Shayari;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.green, title: Text("Love Shayari")),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return Third(Loveshayari,index);
                },));
              },
                leading: Image.asset("${list.img[widget.title_ind]}"),
                title: Text("${Loveshayari[index].toString().substring(0,20)}."),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 5,
              );
            },
            itemCount: Loveshayari.length));
  }
}
