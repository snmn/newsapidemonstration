import 'package:assignment/api/getapi.dart';
import 'package:assignment/articledetail.dart';
import 'package:assignment/model/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Dashboard extends StatefulWidget{
@override
State<StatefulWidget> createState() {
return DashboardState();
}
}
class DashboardState extends State<Dashboard>{
  Future<news> futurenews;
@override
  void initState() {
  futurenews = GetApi.getnewsdata(context);
  }
  //date time format method
  String formatDateTime12(String date) {
    // VendorApi.encryption();
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime format = (dateFormat.parse(date));
    DateFormat longdate = DateFormat("MMM dd, yyyy");
    date = longdate.format(format);
    return date;
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,

          title: Padding(
            padding: const EdgeInsets.only(top:8),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("eWS",
                        style: TextStyle(color: Color(0xFF3498DB),fontSize: 28, fontWeight: FontWeight.bold)),
                  ],
                ),

              ],
            ),


          ),
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0.0,
          actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: Icon(Icons.search,size: 20,color: Colors.black,),
          )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: futurenews, builder: (BuildContext context,AsyncSnapshot snapshot)
              {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container(
                        child: Center(
                          child:Flexible(child:
                          Text("Try Loading Again.", textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
                          ),
                        )
                    );
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SpinKitFadingCircle(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color: index.isEven ? Colors.red : Colors.green,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    if (!snapshot.hasData) {
                      return Container(
                          height: 120,
                          child: Center(
                              child: Text("No News data Avaliable.\nplease check your internet connection",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)
                              )
                          )
                      );
                    } else {
                      return   Column(
                        children: <Widget>[
                          SizedBox(
                            height: size.height/4.75,
                            width: size.width/1.05,


                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.articles.length,

                              itemBuilder: (BuildContext context, int index)
                              => GestureDetector(
                                onTap: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => ArticleDetail(snapshot.data.articles[index])));

                                },
                                child: Card(

                                  elevation: 0.0,
                                  child: Container(

                                    child: Stack(

                                      children: <Widget>[

                                        snapshot.data.articles[index].urlToImage!=null?ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            imageUrl:snapshot.data.articles[index].urlToImage,height: size.height/5,width: size.width/1.6,fit: BoxFit.fill,
                                            placeholder: (context, url) => new CircularProgressIndicator(strokeWidth: 1,value: 1,),
                                            errorWidget: (context, url, error) => new Icon(Icons.error),
                                          ),
                                        ):Container(width: size.width/1.6,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.black12,),height: size.height/5,child: Icon(Icons.info,size: size.height/5,color: Colors.black12,)),
                                        Positioned(
                                          bottom: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:8.0,bottom: 5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: <Widget>[
                                                Container(width: size.width/2,child: Text(snapshot.data.articles[index].title,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 2,))
                                                ,Text(formatDateTime12(snapshot.data.articles[index].publishedAt),style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,maxLines: 2,),
                                                ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 1,
                                            right: 1,
                                            child: Icon(Icons.play_circle_filled,color: Colors.white,size: 30,))

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                                      physics: ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data.articles.length,
                                      itemBuilder: (BuildContext context, int index)
                                      => InkWell(
                                        onTap: (){
                                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ArticleDetail(snapshot.data.articles[index])));

                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          elevation: 0.0,
                                          child: Center(
                                            child: Container(
                                              width: size.width/1.1,
                                              decoration: BoxDecoration(

                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                              child: Container(
                                                height: 100,
                                                padding: EdgeInsets.only(left: 0,right: 8,top: 8,bottom: 8),
                                                child: Row(
                                                  children: <Widget>[
                                                    Stack(
                                                      children: [
                                                        Container(

                                                          child:  Padding(
                                                            padding: const EdgeInsets.only(left:0.0),
                                                            child: snapshot.data.articles[index].urlToImage!=null?ClipRRect(
                                                              borderRadius: new BorderRadius.circular(10),
                                                              child: CachedNetworkImage(
                                                                imageUrl:snapshot.data.articles[index].urlToImage,height: 100,width: 100,fit: BoxFit.fill,
                                                                errorWidget: (context, url, error) => new Icon(Icons.error),
                                                              ),
                                                            ):Container(width: 100,height: 100,child: Icon(Icons.info,size: 50,color: Colors.blue,)),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 25,
                                                            left: 30,
                                                            child: Icon(Icons.play_circle_filled,color: Colors.white,size: 35,))
                                                      ],
                                                    ),

                                              Container(
                                                        height: 80,
                                                        alignment: Alignment.bottomLeft,

                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 15),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                                  Container(width: size.width/2,child: Text(snapshot.data.articles[index].content,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                                                                  Container(
                                                                    padding: EdgeInsets.only(top: 5),
                                                                    width: size.width/2,
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                      children: [
                                                                        Container(
                                                                          decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(8.0),
                                                                            child: Container(width: 70,child: Text(snapshot.data.articles[index].source.name,overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 12),)),
                                                                          ),
                                                                        ),
                                                                        Text(formatDateTime12(snapshot.data.articles[index].publishedAt),style: TextStyle(color: Colors.brown,fontSize: 12,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,maxLines: 2,),
                                                                      ],
                                                                    ),
                                                                  ),
                                                            ],
                                                          ),
                                                        ),

                                                      ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),



                        ],
                      );
                    }
                }
                return Container(
                    child: Center(
                      child: Flexible(
                          child: Text("Try Loading Again.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal))),
                    ));
              }




              ),

            ],
          ),
        ),
      ),
    );
  }


}