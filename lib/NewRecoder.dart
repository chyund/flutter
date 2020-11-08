import 'package:flutter/material.dart';
import 'RecodeItem.dart';

class NewRecoder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewRecoderState();
  }
}

class NewRecoderState extends State<NewRecoder> {
  String text1;
  String text2;
  String number;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("NewRecoder"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Text1: "),
                Expanded(child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "请输入text1"
                  ),
                  onChanged: (v){
                    text1 = v;
                  },
                ),)
              ],
            ),
            Divider(),
            Row(
              children: [
                Text("Text2: "),
                Expanded(child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "请输入text2"
                  ),
                  onChanged: (v){
                    text2 = v;
                  },
                ),)
              ],
            ),
            Divider(),
            Row(
              children: [
                Text("Number: "),
                Expanded(child: TextField(
                  decoration: InputDecoration.collapsed(hintText: "请输入数字"),
                  onChanged: (v){
                    number = v + "\$";
                  },
                ),)
              ],
            ),
            Divider(),
            RaisedButton(
                child: Text("return"),
                onPressed: (){
                  RecodeItem item = new RecodeItem(text1, text2, number);
                  Navigator.pop(context, item);
                }),
          ],
        ),
      )
    );
  }

}