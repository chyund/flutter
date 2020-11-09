import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("轮播图"),
      ),
      body: BannerWidget(),
    );
  }

}

class BannerWidget extends StatefulWidget {
  final String url = "https://gank.io/api/v2/banners";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BannerState(url);
  }

}

class BannerState extends State<BannerWidget> {
  final String url;
  List<String> urls = [];

  BannerState(this.url);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUrls();
  }

  void getUrls() async{
    try {
      var dio = Dio();
      dio.options.responseType = ResponseType.plain;
      Response response = await dio.get(url);
      String data = response.data.toString();
      Map userMap = jsonDecode(data);
      List<dynamic> list = userMap["data"];
      var tmp = <String>[];
      for(dynamic str in list){
        tmp.add(str["image"].toString());
      }
      setState(() {
        urls.addAll(tmp);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(urls.length == 0){
      return Container();
    }else {
      return  new Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network(urls[index],fit: BoxFit.fill,);
        },
        itemCount: urls.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
        loop: true,
        autoplayDisableOnInteraction: true,
        autoplay: true,
      );
    }
  }

}