import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text("Edit Page")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 350,
                  width: double.infinity,
                  color: Colors.pinkAccent,
                  margin: EdgeInsets.all(10),
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        cur_index = value;
                      });
                    },
                    itemCount: widget.Loveshayari.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Text("${widget.Loveshayari[widget.index]}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25)));
                    },
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.blueGrey,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(2),
                          color: Colors.white,
                          height: 50,
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 35,
                                width: 35,
                                child: Image.asset("image/reload.png"),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 35,
                                width: 35,
                                child: Image.asset("image/expand.png"),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(onTap: () {
                        showBottomSheet(context: context, builder: (context) {
                          return
                        },);
                      },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 25,
                            width: 90,
                            child: Text("Background",
                                style: TextStyle(color: Colors.white)),
                            color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 25,
                        width: 90,
                        child: Text("Text Color",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 25,
                        width: 90,
                        child: Text("Share",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 25,
                          width: 90,
                          child: Text("Font",
                              style: TextStyle(color: Colors.white)),
                          color: Colors.red),
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 25,
                        width: 90,
                        child: Text("Emoji",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 25,
                        width: 90,
                        child: Text("Text Size",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
