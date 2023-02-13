import 'package:flutter/material.dart';
import 'package:shayari/list.dart';
import 'package:shayari/sec.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> t = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    t = List.filled(list.Shayari.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.green, title: Text("Love Shayari")),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTapUp: (details) {
                setState(() {
                  t[index] = false;
                });
              },
              onTapDown: (details) {
                setState(() {
                  t[index] = true;
                });
              },
              onTapCancel: () {
                setState(() {
                  t[index] = false;
                });

              },
              child: ListTile(onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Second(index);
                  },
                ));
              },
                title: Text("${list.Shayari[index]}"),
                leading: Image.asset("${list.img[index]}"),
                tileColor:
                    (t[index] == true) ? Colors.pinkAccent : Colors.black26,
                trailing: (t[index]) ? Icon(Icons.arrow_right) : null,
              ),
            );
          },
          itemCount: list.Shayari.length,
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 5,
              color: Colors.black12,
            );
          },
        ));
  }
}
