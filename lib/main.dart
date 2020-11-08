import 'package:flutter/material.dart';
import 'ViewUtils.dart';
import 'RecodeItem.dart';
import 'package:flutter/services.dart';
import 'NewRecoder.dart';
import 'bluetooth/bluetoothPage.dart';
import 'banners.dart';

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
        scaffoldBackgroundColor: Colors.grey[100]
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

  MainHomeState(){
    items.add(RecodeItem("El corte ingles","Pago aceptado","-50\$"));
    items.add(RecodeItem("Maria Lujan","Pago aceptado","650\$"));
    items.add(RecodeItem("Maria Lujan","Pago aceptado","250\$"));
  }

  Widget buildMiddleCard(){
    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.blue[500],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(2.0,2.0),
              blurRadius: 8,
              spreadRadius: 1,
            )
          ]
      ),
      child: Container(
        height: 150,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                child: Row(
                  children: [
                    RoundImage(showDot: false, width: 40,),
                    Expanded(child: Container()
                    ),
                    RectangleText(text: "HOY",
                      fillColor: Colors.yellow[100],
                      strokeColor: Colors.yellow,
                      width: 20,
                      height: 5,
                      textSize: 14,
                    ),
                  ],
                ),
                padding: EdgeInsets.only(bottom: 10),
              ),
              Text(
                "Nina te ha enviado",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),
              ),
              Text(
                "20,00\$",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    RectangleText(
                      text: "VER DETALLES",
                      strokeColor: Colors.white,
                      textColor: Colors.white,
                      width:  10,
                      height: 10,
                    ),
                    Expanded(child: Container(),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mensaje",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[200]
                          ),
                        ),
                        Row(
                          children: [
                            Text("Por la cena...",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                            Image(
                              image: AssetImage("images/avatar.jpeg"),
                              width: 20,
                            )
                          ],
                        )
                      ],
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

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      title: Row(
        children: [
          Padding(
            child: RoundImage(showDot: true, width: 30,),
            padding: EdgeInsets.only(left: 10, right: 20),
          ),
          Expanded(child: Center(child: Text("I am title"),))
        ],
      ),
      elevation: 0.0,
      actions: [
        IconButton(icon: Icon(Icons.settings))
      ],
    );
  }

  Widget buildBody(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildMiddleCard(),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                "Enviar de nuevo",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue[500],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: Column(
                  children: [
                    RoundImage(showDot: false, imageSrc: "images/avatar1.jpeg",),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text("Carlos Roca", style: TextStyle(fontSize: 12),),
                    )
                  ],
                )),
                Expanded(child: Column(
                  children: [
                    RoundImage(showDot: false, imageSrc: "images/avatar2.jpeg",),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text("Ruby Sanz", style: TextStyle(fontSize: 12),),
                    )
                  ],
                )),
                Expanded(child: Column(
                  children: [
                    RoundImage(showDot: false, imageSrc: "images/avatar3.jpeg",),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5,),
                      child: Text("Mary Rich", style: TextStyle(fontSize: 12),),
                    )
                  ],
                )),
                Expanded(child: Column(
                  children: [
                    RoundImage(showDot: false,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text("Jose Prota", style: TextStyle(fontSize: 12),),
                    )
                  ],
                ),),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                children: [
                  Text(
                    "Activited",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[500],
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Ver mas movimientos",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[300],
                    ),
                  ),
                ],
              ),
            ),
            buildListView(),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
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
                  children: [Icon(Icons.assignment_return, color: Colors.grey,), Text("Envia", style: TextStyle(fontSize: 12, color: Colors.grey),)],
                ),
              ),
              Column(
                mainAxisAlignment:MainAxisAlignment.end,
                children: [Padding(child: Text("Recibir", style: TextStyle(fontSize: 12, color: Colors.grey)), padding: EdgeInsets.only(bottom: 6),),],
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
                      Icon(Icons.assignment_ind, color: Colors.grey),
                      Text("Perfri", style: TextStyle(fontSize: 12, color: Colors.grey),)],
                  ),
              ),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.assignment_returned),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return NewRecoder();
          })).then((value){if(value != null) setState(() {
            items.add(value);
          });});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildListView(){
    return  Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(
          offset: Offset(0, 2.0)
        )]
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index){
          RecodeItem item = items[index];
          return Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item.text1, style: TextStyle( fontSize: 18)),
                    Text(item.text2, style: TextStyle( fontSize: 14, color: Colors.grey)),
                  ],
                ),
                Expanded(child: Container()),
                Text(item.number),
              ],
            ),
          );
        },
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index){
          return MySeparator(color: Colors.grey,);
        },
      ),
    );
  }
}

/*
, onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DevicesListScreen();
          }));
        })
 */

