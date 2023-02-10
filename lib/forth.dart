import 'package:flutter/material.dart';

class For extends StatefulWidget {
  String Loveshayari;
  For(this.Loveshayari);
  @override
  State<For> createState() => _ForState();
}

class _ForState extends State<For> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Love Shayari")),
      body: Column(children: [
        Row(
          children: [
            Container(
              height: 350,
              width: 350,
              color: Colors.pinkAccent,
              margin: EdgeInsets.all(10),
              child: Text("${widget.Loveshayari}"),
            )
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
          Container(alignment: Alignment.center,height: 25,width: 90,child: Text("Background"),color: Colors.red),
          Container(alignment: Alignment.center,height: 25,width: 90,child: Text("Text Color"),color: Colors.red,),
          Container(alignment: Alignment.center,height: 25,width: 90,child: Text("Share"),color: Colors.red,),
        ],),
      ]),
    );
  }
}
