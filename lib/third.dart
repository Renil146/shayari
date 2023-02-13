import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shayari/edit.dart';


class Third extends StatefulWidget {
  List Loveshayari = [];
  int ind;
  Third(this.Loveshayari, this.ind);

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  int cur_index = 0;
  PageController? controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // cur_index = widget.ind;
    controller = PageController(initialPage: cur_index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Love Shayari")),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: 50,
            //   width: 50,
            //   child: Image.asset("image/expand.png"),
            // ),
            Container(
                height: 50,
                width: 50,
                child: Text("${cur_index + 1}/ ${widget.Loveshayari.length}")),
            // Container(
            //   height: 50,
            //   width: 50,
            //   child: Image.asset("image/reload.png"),
            // ),
          ],
        ),
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
                    return Container(child: Text("${widget.Loveshayari[index]}",
                      style: TextStyle(color: Colors.white, fontSize: 25)));
                  },
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                margin: EdgeInsets.all(10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                  IconButton(
                      onPressed: () {
                        FlutterClipboard.copy(widget.Loveshayari[cur_index])
                            .then((value) {
                          Fluttertoast.showToast(
                              msg: "Text Copied....",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        });
                      },
                      icon: Icon(Icons.copy)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          cur_index++;
                        });
                        controller!.jumpToPage(cur_index);
                      }, icon: Icon(Icons.keyboard_arrow_left)),
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return edit(widget.Loveshayari,widget.ind);
                    },));
                  },child: Image(image: AssetImage("image/pencil2.png"))),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          cur_index--;
                        });
                        controller!.jumpToPage(cur_index);
                      }, icon: Icon(Icons.keyboard_arrow_right)),
                  IconButton(
                      onPressed: () async {
                        await FlutterShare.share(
                          title: 'Example share',
                          text: widget.Loveshayari[cur_index],
                        );
                      },
                      icon: Icon(Icons.share_sharp)),
                ]),
              ),
            )
          ],
        )
      ]),
    );
  }
}
