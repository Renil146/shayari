import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';

class edit extends StatefulWidget {
  List Loveshayari;
  int index;

  edit(this.Loveshayari, this.index);

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  int cur_index = 0;
  PageController? controller;
  List Font = ["fam1", "fam2", "fam3", "fam4", "fam5", "fam6"];
  List Emoji = [
    "😃😃😃😃",
    "😢😢😢😢",
    "😂😂😂😂",
    "😁😁😁😁",
    "🤣🤣🤣🤣",
    "😌😌😌😌"
  ];
  double textsiz = 30;
  String emoj = "";
  String ForFont = "";
  Color tocolor = Colors.black;
  String folderpath = "";
  Color bgcolor = Colors.pinkAccent;
  List color = [
    Colors.black,
    Colors.blue,
    Colors.blueGrey,
    Colors.purple,
    Colors.deepPurple,
    Colors.brown,
    Colors.yellow,
    Colors.cyan,
    Colors.deepOrangeAccent,
    Colors.indigo,
    Colors.grey,
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.pink,
    Colors.teal,
    Colors.tealAccent,
    Colors.redAccent,
    Colors.green,
    Colors.blue,
    Colors.blueGrey,
    Colors.purple,
    Colors.deepPurple,
    Colors.brown,
    Colors.yellow,
  ];
  GlobalKey gb = GlobalKey();

  createFolder() async {
    final folder = "shayri";
    final path = Directory("storage/emulated/0/Download/$folder");
    if ((await path.exists())) {
      print("exist");
    } else {
      print("not exist");
      path.create();
    }
    setState(() {
      folderpath = path.path;
    });
  }

  @override
  void initState() {
    super.initState();
    createFolder();
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
          gb.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.green, title: Text("Edit Page")),
        body: Column(
          children: [
            RepaintBoundary(
              key: gb,
              child: Container(
                height: 400,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                //alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: bgcolor,
                ),
                child: Text(
                  "$emoj${widget.Loveshayari[widget.index]}$emoj",
                  style: TextStyle(
                    fontFamily: ForFont,
                    color: tocolor,
                    fontSize: textsiz,
                  ),
                ),
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: Container(
            //        height: 350,
            //         width: double.infinity,
            //         color: Colors.pinkAccent,
            //         margin: EdgeInsets.all(10),
            //         child: PageView.builder(
            //           controller: controller,
            //           onPageChanged: (value) {
            //             setState(() {
            //               cur_index = value;
            //             });
            //           },
            //           itemCount: widget.Loveshayari.length,
            //           itemBuilder: (context, index) {
            //             return Container(
            //                 child: Text("${widget.Loveshayari[widget.index]}",
            //                     style: TextStyle(
            //                         color: Colors.white, fontSize: 25)));
            //           },
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Spacer(),
            Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blueGrey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //         margin: EdgeInsets.all(2),
                        //         color: Colors.white,
                        //         height: 50,
                        //         width: 150,
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Container(
                        //               margin: EdgeInsets.all(5),
                        //               height: 35,
                        //               width: 35,
                        //               child: Image.asset("image/reload.png"),
                        //             ),
                        //             Container(
                        //               margin: EdgeInsets.all(5),
                        //               height: 35,
                        //               width: 35,
                        //               child: Image.asset("image/expand.png"),
                        //             ),
                        //           ],
                        //         )),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      child: GridView.builder(
                                        itemCount: color.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 8,
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 2,
                                                childAspectRatio: 1),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                bgcolor = color[index];
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              color: color[index],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 90,
                                  child: Text("Background",
                                      style: TextStyle(color: Colors.white)),
                                  color: Colors.red),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      width: double.infinity,
                                      child: GridView.builder(
                                        itemCount: color.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 8,
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 2,
                                                childAspectRatio: 1),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                tocolor = color[index];
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              color: color[index],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                height: 40,
                                width: 90,
                                child: Text("Text Color",
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.red,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _capturePng().then((value) async {
                                  print(value);

                                  String Imagename =
                                      "Image${Random().nextInt(1000)}.jpg";

                                  String imagepath = "$folderpath/$Imagename";

                                  File ff = File(imagepath);

                                  ff.writeAsBytes(value);

                                  await ff.create();
                                  Share.shareFiles(['${ff.path}'],
                                      text: 'picture');
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                height: 40,
                                width: 90,
                                child: Text("Share",
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        itemCount: Font.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              setState(() {
                                                ForFont = Font[index];
                                                Navigator.pop(context);
                                              });
                                            },
                                            title: Text(
                                              "Fonts",
                                              style: TextStyle(
                                                  fontFamily: "${Font[index]}"),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 90,
                                  child: Text("Font",
                                      style: TextStyle(color: Colors.white)),
                                  color: Colors.red),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        itemCount: Emoji.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              setState(() {
                                                emoj = Emoji[index];
                                                Navigator.pop(context);
                                              });
                                            },
                                            title: Text(
                                              "${Emoji[index]}",
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                height: 40,
                                width: 90,
                                child: Text("Emoji",
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.red,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      width: double.infinity,
                                      child: StatefulBuilder(
                                        builder: (context, setState1) {
                                          return Slider(
                                            min: 10,
                                            max: 110,
                                            label: "$textsiz",
                                            divisions: 10,
                                            value: textsiz,
                                            onChanged: (value) {
                                              setState1(() {
                                                setState(() {
                                                  textsiz = value;
                                                });
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                height: 40,
                                width: 90,
                                child: Text("Textsize",
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
