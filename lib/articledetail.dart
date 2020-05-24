import 'package:assignment/model/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/api/getapi.dart';
import 'package:assignment/articledetail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ArticleDetail extends StatefulWidget{
  Articles articledetails;
  ArticleDetail(this.articledetails);
  @override
  State<StatefulWidget> createState() {
    return ArticleDetailState(articledetails);
  }

}
class ArticleDetailState extends State<ArticleDetail>{
  Articles articledetails;
  ArticleDetailState(this.articledetails);
  Future<news> futurenews;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    futurenews = GetApi.getnewsdata(context);

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

    body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: size.width,
        child: Column(
          children: [
            Container(

              child: Stack(

                children: <Widget>[

                  articledetails.urlToImage!=null?ClipRRect(

                    child: CachedNetworkImage(
                      imageUrl:articledetails.urlToImage,height: size.height/4,width: size.width,fit: BoxFit.fill,
                      placeholder: (context, url) => new CircularProgressIndicator(strokeWidth: 1,value: 1,),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ):Icon(Icons.info,size: size.height/5,color: Colors.black12,),
                  Positioned(
                    top: 5,
                    left: 10,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Icon(Icons.arrow_back,color: Colors.white,size: 30,))),

                      Positioned(
                        right: 5.0,
                          top: 10,
                          child: InkWell(
                            onTap: (){

                              Share.share(articledetails.url,subject: "News Sharable Link");
                            },
                              child: Icon(Icons.share,color: Colors.white,size: 25,))),


                  Positioned(
                      bottom: size.height/10,
                      right: size.width/2.3,
                      child: Icon(Icons.play_circle_filled,color: Colors.white,size: 50,))

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
                width:size.width/1.1,
                child: Text(articledetails.title.toUpperCase(),overflow: TextOverflow.ellipsis,maxLines: 4,
                  style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 15),
                  child: Container(width:size.width/2,child: Text(articledetails.author,style: TextStyle(color: Colors.brown),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 15),
                  child: Text(formatDateTime12(articledetails.publishedAt),style: TextStyle(color: Colors.brown),),
                )
              ],
            ),
            Container(margin:EdgeInsets.only(top: 15),
                width: size.width/1.1,child: Text(articledetails.description,
                  overflow: TextOverflow.visible,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 18),)),
            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
              child: Divider(thickness: 1.0,color: Colors.black26,height: 20,),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 15),
                  child: Text("Related Video",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),
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
                  return Row(
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
                  );
                case ConnectionState.done:
                  if (!snapshot.hasData) {
                    return Container(
                        height: 120,
                        child: Center(
                            child: Text("No Related data Avaliable.\nplease check your internet connection",
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
                                                ):Icon(Icons.info,size: 50,color: Colors.blue,),
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
                                                        width: 70,
                                                        decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(snapshot.data.articles[index].source.name,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 12),),
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