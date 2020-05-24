import 'model/news.dart';

class StaticValue{
 static String apikey = "a25a0c0b883c4f389ff5c23da0f9dfea";
 static String baseurl = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-04-24&sortBy=publishedAt";

 //tested data for ui design
// static news newsdata = new news(
//
//     status: "ok",
//     totalResults: 38,
//     articles: [
//      Articles (
//          source: Source(
//              id: "cnn",
//              name: "CNN"
//          ),
//          author : "Faith Karimi, CNN",
//          title: "Two hairstylists with coronavirus served 140 clients while symptomatic in Missouri, officials say - CNN",
//          description: "Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said.",
//          url: "https://www.cnn.com/2020/05/24/us/missouri-hairstylists-coronavirus-clients-trnd/index.html",
//          urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/200523024317-great-clips-springfield-missouri-super-tease.jpg",
//          publishedAt: "2020-05-24T06:33:00Z",
//          content: "(CNN)Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said. \r\nThe Springfield-Greene Healt… [+2195 chars]"
//      ),
//       Articles (
//           source: Source(
//               id: "cnn",
//               name: "CNN"
//           ),
//           author : "Faith Karimi, CNN",
//           title: "Two hairstylists with coronavirus served 140 clients while symptomatic in Missouri, officials say - CNN",
//           description: "Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said.",
//           url: "https://www.cnn.com/2020/05/24/us/missouri-hairstylists-coronavirus-clients-trnd/index.html",
//           urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/200523024317-great-clips-springfield-missouri-super-tease.jpg",
//           publishedAt: "2020-05-24T06:33:00Z",
//           content: "(CNN)Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said. \r\nThe Springfield-Greene Healt… [+2195 chars]"
//       ),
//       Articles (
//           source: Source(
//               id: "cnn",
//               name: "CNN"
//           ),
//           author : "Faith Karimi, CNN",
//           title: "Two hairstylists with coronavirus served 140 clients while symptomatic in Missouri, officials say - CNN",
//           description: "Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said.",
//           url: "https://www.cnn.com/2020/05/24/us/missouri-hairstylists-coronavirus-clients-trnd/index.html",
//           urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/200523024317-great-clips-springfield-missouri-super-tease.jpg",
//           publishedAt: "2020-05-24T06:33:00Z",
//           content: "(CNN)Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said. \r\nThe Springfield-Greene Healt… [+2195 chars]"
//       ),
//       Articles (
//           source: Source(
//               id: "cnn",
//               name: "CNN"
//           ),
//           author : "Faith Karimi, CNN",
//           title: "Two hairstylists with coronavirus served 140 clients while symptomatic in Missouri, officials say - CNN",
//           description: "Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said.",
//           url: "https://www.cnn.com/2020/05/24/us/missouri-hairstylists-coronavirus-clients-trnd/index.html",
//           urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/200523024317-great-clips-springfield-missouri-super-tease.jpg",
//           publishedAt: "2020-05-24T06:33:00Z",
//           content: "(CNN)Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said. \r\nThe Springfield-Greene Healt… [+2195 chars]"
//       ),
//       Articles (
//           source: Source(
//               id: "cnn",
//               name: "CNN"
//           ),
//           author : "Faith Karimi, CNN",
//           title: "Two hairstylists with coronavirus served 140 clients while symptomatic in Missouri, officials say - CNN",
//           description: "Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said.",
//           url: "https://www.cnn.com/2020/05/24/us/missouri-hairstylists-coronavirus-clients-trnd/index.html",
//           urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/200523024317-great-clips-springfield-missouri-super-tease.jpg",
//           publishedAt: "2020-05-24T06:33:00Z",
//           content: "(CNN)Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said. \r\nThe Springfield-Greene Healt… [+2195 chars]"
//       ),
//       Articles (
//           source: Source(
//               id: "cnn",
//               name: "CNN"
//           ),
//           author : "Faith Karimi, CNN",
//           title: "Two hairstylists with coronavirus served 140 clients while symptomatic in Missouri, officials say - CNN",
//           description: "Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said.",
//           url: "https://www.cnn.com/2020/05/24/us/missouri-hairstylists-coronavirus-clients-trnd/index.html",
//           urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/200523024317-great-clips-springfield-missouri-super-tease.jpg",
//           publishedAt: "2020-05-24T06:33:00Z",
//           content: "(CNN)Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said. \r\nThe Springfield-Greene Healt… [+2195 chars]"
//       ),
//       Articles (
//           source: Source(
//               id: "cnn",
//               name: "CNN"
//           ),
//           author : "Faith Karimi, CNN",
//           title: "Two hairstylists with coronavirus served 140 clients while symptomatic in Missouri, officials say - CNN",
//           description: "Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said.",
//           url: "https://www.cnn.com/2020/05/24/us/missouri-hairstylists-coronavirus-clients-trnd/index.html",
//           urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/200523024317-great-clips-springfield-missouri-super-tease.jpg",
//           publishedAt: "2020-05-24T06:33:00Z",
//           content: "(CNN)Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said. \r\nThe Springfield-Greene Healt… [+2195 chars]"
//       ),
//       Articles (
//           source: Source(
//               id: "cnn",
//               name: "CNN"
//           ),
//           author : "Faith Karimi, CNN",
//           title: "Two hairstylists with coronavirus served 140 clients while symptomatic in Missouri, officials say - CNN",
//           description: "Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said.",
//           url: "https://www.cnn.com/2020/05/24/us/missouri-hairstylists-coronavirus-clients-trnd/index.html",
//           urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/200523024317-great-clips-springfield-missouri-super-tease.jpg",
//           publishedAt: "2020-05-24T06:33:00Z",
//           content: "(CNN)Two Missouri hairstylists potentially exposed 140 clients to coronavirus when they worked for up to eight days this month while symptomatic, health officials said. \r\nThe Springfield-Greene Healt… [+2195 chars]"
//       )
//
//     ]
//
// );
}