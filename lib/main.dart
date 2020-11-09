import 'package:flutter/material.dart';
import 'ViewUtils.dart';
import 'RecodeItem.dart';
import 'package:flutter/services.dart';
import 'NewRecoder.dart';
import 'bluetooth/bluetoothPage.dart';
import 'banners.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: "MaterialApp",
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        scaffoldBackgroundColor: Color(0xFFF6f8fA),
      ),
      home:  MainHome()
    );
  }
}

class MainHome extends StatefulWidget{
  @override
  MainHomeState createState() {
    // TODO: implement createState
    return MainHomeState();
  }
  
}

class MainHomeState extends State<MainHome> {
  final List<RecodeItem> items = [];
  var scaleX;
  var scaleY;

  MainHomeState(){
    items.add(RecodeItem("El corte ingles","Pago aceptado","-50\$"));
    items.add(RecodeItem("Maria Lujan","Pago aceptado","650\$"));
    items.add(RecodeItem("Maria Lujan","Pago aceptado","250\$"));
  }

  Widget buildMiddleCard(){
    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Color(0xFF0054AE),
          borderRadius: BorderRadius.circular(15*scaleX),
          boxShadow: [
            BoxShadow(
                offset: Offset(0,0),
              blurRadius: 0,
              spreadRadius: 0,
              color: Color(0x14000000)
            ),
            BoxShadow(
                offset: Offset(0,0),
                blurRadius: 0,
                spreadRadius: 0,
                color: Color(0x14000000)
            ),
            BoxShadow(
                offset: Offset(5*scaleX,0),
                blurRadius: 0,
                color: Color(0x14000000)
            ),
            BoxShadow(
                offset: Offset(0,15*scaleY),
                blurRadius: 0,
                spreadRadius: 0,
                color: Color(0x14000000)
            ),
          ]
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8*scaleX, top: 16*scaleY),
        child: Container(
          height: 190*scaleY,
          width: 325*scaleX,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                child: Row(
                  children: [
                    RoundImage(showDot: false, width: 56*scaleY, imageSrc: 'images/avatar3.jpeg',),
                    Expanded(child: Container()
                    ),
                    RectangleText(text: "HOY",
                      fillColor: Color(0xFFFFF0B4),
                      strokeColor: Color(0xFFFFD202),
                      textColor: Color(0xFF3A2424),
                      strokeWidth: 1*scaleY,
                      width: 10*scaleX,
                      height: 5*scaleY,
                      textSize: 10*scaleY,
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 22*scaleX, right: 14*scaleX),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20*scaleX, top: 6*scaleY),
                child: Text(
                  "Nina te ha enviado ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14*scaleY,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20*scaleX),
                child: Text(
                  "20,00€",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28*scaleY,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:18*scaleX, top: 12*scaleY),
                child: Row(
                  children: [
                    RectangleText(
                      text: "VER DETALLES",
                      strokeColor: Colors.white,
                      textColor: Colors.white,
                      width:  21*scaleX,
                      height: 7*scaleY,
                      strokeWidth: 1.5*scaleY,
                      textSize: 12*scaleY,
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(right: 26*scaleX),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mensaje",
                            style: TextStyle(
                              fontSize: 10*scaleY,
                              color: Color(0x64FFFFFF),
                            ),
                          ),
                          Row(
                            children: [
                              Text("Por la cena...",
                                style: TextStyle(
                                    fontSize: 14*scaleY,
                                  color: Color(0x64FFFFFF),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3*scaleX),
                                child: Text(
                                    " 🍕",
                                  style: TextStyle(
                                    fontSize: 14*scaleY
                                  ),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18*scaleX),
          child: buildMiddleCard(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 22*scaleX, top: 28*scaleY, bottom: 19*scaleY),
          child: Text(
            "Enviar de nuevo",
            style: TextStyle(
              fontSize: 14*scaleY,
              color: Color(0xFF003087),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(child: Column(
              children: [
                RoundImage(showDot: false, imageSrc: "images/avatar1.jpeg", width: 48*scaleY,),
                Padding(
                  padding: EdgeInsets.only(top: 9*scaleY),
                  child: Text("Carlos Roca", style: TextStyle(fontSize: 10*scaleY, color: Color(0xFF666666)),),
                )
              ],
            )),
            Expanded(child: Column(
              children: [
                RoundImage(showDot: false, imageSrc: "images/avatar2.jpeg", width: 48*scaleY),
                Padding(
                  padding: EdgeInsets.only(top: 9*scaleY),
                  child: Text("Ruby Sanz", style: TextStyle(fontSize: 10*scaleY, color: Color(0xFF666666)),),
                )
              ],
            )),
            Expanded(child: Column(
              children: [
                RoundImage(showDot: false, imageSrc: "images/avatar3.jpeg", width: 48*scaleY),
                Padding(
                  padding: EdgeInsets.only(top: 9*scaleY),
                  child: Text("Mary Rich", style: TextStyle(fontSize: 10*scaleY, color: Color(0xFF666666)),),
                )
              ],
            )),
            Expanded(child: Column(
              children: [
                RoundImage(showDot: false, width: 48*scaleY),
                Padding(
                  padding: EdgeInsets.only(top: 9*scaleY),
                  child: Text("Jose Prota", style: TextStyle(fontSize: 10*scaleY, color: Color(0xFF666666)),),
                )
              ],
            ),),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 18*scaleX, top: 34*scaleY, bottom: 17*scaleY),
          child: Row(
            children: [
              Text(
                "Actividad",
                style: TextStyle(
                  fontSize: 14*scaleY,
                  color: Color(0xFF003087),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.only(right: 34*scaleX),
                child: Text(
                  "Ver mas movimientos",
                  style: TextStyle(
                    fontSize: 12*scaleY,
                    color: Color(0xff025ED7),
                  ),
                ),
              ),
            ],
          ),
        ),
        buildListView(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    scaleX = MediaQuery.of(context).size.width / 360;
    scaleY = MediaQuery.of(context).size.height / 761;

      return Scaffold(
        appBar: PreferredSize(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  child: RoundImage(showDot: true,imageSrc: 'images/avatar3.jpeg', width: 36*scaleY,),
                  padding: EdgeInsets.only(left: 26*scaleX),
                ),
                Expanded(child: Center(child: Text("I am title"),)),
                IconButton(icon: Icon(Icons.settings),),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(78*scaleY),
        ),
        body: buildBody(),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 78*scaleY,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround ,
                children: [
                  GestureDetector(
                    onTapUp: (v){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return DevicesListScreen();
                      }));
                    },
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [Icon(Icons.assignment_return, color: Color(0xff999999), size: 20*scaleY,),
                        Container(height:9*scaleY),
                        Text("Envia", style: TextStyle(fontSize: 12*scaleY, color: Color(0xff999999)),)],
                    ),
                  ),
                  Column(
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: [Padding(child: Text("Recibir",
                        style: TextStyle(fontSize: 12*scaleY, color:Color(0xff999999))), padding: EdgeInsets.only(bottom: 6),),],
                  ),
                  GestureDetector(
                    onTapUp: (v){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return BannerView();
                      }));
                    },
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Icon(Icons.assignment_ind, color: Color(0xff999999), size: 20*scaleY,),
                        Container(height:9*scaleY),
                        Text("Perfri", style: TextStyle(fontSize: 12*scaleY, color:Color(0xff999999)),)],
                    ),
                  ),
                ],
              ),
            )
        ),
        floatingActionButton: MyFloatButton(
          child: Icon(Icons.assignment_returned, color: Colors.white,size: 20*scaleY,),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return NewRecoder();
            })).then((value){if(value != null) setState(() {
              items.add(value);
            });});
          },
          width: 64*scaleY,
          height: 64*scaleY,
          color: Color(0xff003087),
        ),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(FloatingActionButtonLocation.centerDocked,0,13*scaleY),
      );
    }

  Widget buildListView(){
    return  Padding(
      padding: EdgeInsets.only(left: 14*scaleX, right: 21*scaleX,),
      child: Container(
        height: 165*scaleY,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10*scaleX),
            boxShadow: [BoxShadow(
                offset: Offset(2.0, 2.0),
              color: Color(0x14000000)
            )]
        ),
        padding: EdgeInsets.only(left: 19*scaleX, right:14*scaleX),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index){
            RecodeItem item = items[index];
            return Container(
              height: 50*scaleY,
              //padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item.text1, style: TextStyle( fontSize: 12*scaleY, color:Color(0xff1b1b1b))),
                      Text(item.text2, style: TextStyle( fontSize: 10*scaleY, color: Color(0xff999999))),
                    ],
                  ),
                  Expanded(child: Container()),
                  Text(item.number, style: TextStyle(fontSize: 16*scaleY, color:Color(0xff1b1b1b)),),
                ],
              ),
            );
          },
          itemCount: items.length,
          separatorBuilder: (BuildContext context, int index){
            return MySeparator(color: Color(0xff999999),);
          },
        ),
      ),
    );
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX;    // X方向的偏移量
  double offsetY;    // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}