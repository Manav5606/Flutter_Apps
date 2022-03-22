import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model1_api.dart';

Future <List<NewsApiModel>> getNews() async{

    Uri uri = Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2022-02-07&sortBy=publishedAt&apiKey=fd58570d864d4bb6a89bb5c11b26bab6");
    final response = await http.get(uri);

    if(response.statusCode == 200 || response.statusCode == 201){
        Map<String, dynamic> map = json.decode(response.body);

        List _articlesList = map['articles'];
        List<NewsApiModel> newsList = _articlesList.map((jsonData) => NewsApiModel.fromJson(jsonData)).toList();

        return newsList;
    }
    else{
        print("error");
        return[];
    }

}