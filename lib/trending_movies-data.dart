import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'trending_movies_model.dart';

class Movies_trending {
  static Future<List<dynamic>> getTrending() async {
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/trending/all/day?api_key=0c1881819b36de377c0212f81949a9a3');
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    List<MoviesModel> abc=[];

    for(int i=0;i<body['results'].length ;i++){
      var xyz=body['results'][i]['title'];
       xyz ??= body['results'][i]['name'];
      abc.add(MoviesModel(
        title: xyz,
        poster_path: body['results'][i]['poster_path'],
        //vote_average: body['results'][i]['vote_average'],
      )
      );
    }
    return abc ;
  }
}
